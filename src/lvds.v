module top(
  input hwclk,
  input reset_n,
  input cs,
  input mosi,
  input spi_clk_in,
  input clk64mhz, // From AT86RF215 LVDS
  input rx_in,
  output miso,
  output GPIO1,
  output GPIO2,
  output GPIO3,
  output GPIO4,
  output tx_a,
  output clk_a
);

  parameter IDLE = 2'd0;
  parameter PREPARE = 2'd1;
  parameter TRANSMIT = 2'd2;

  wire pll_outg;
  wire lock;
  wire clk;
 
  reg reset;
  reg [3:0] cntr2 = 4'd0;
  reg [31:0] tx_data = 32'b0;

  reg [1:0] tx_state = IDLE, tx_state_d = IDLE;

  wire [12:0] OUTPUT_I;
  wire [12:0] OUTPUT_Q;
  wire [12:0] sg_output_i;
  wire [12:0] sg_output_q;

  wire [31:0] fifo_out;

  wire read_enable, msg_done;
  reg transmit_d = 1'b0, transmit_dd;

  wire [1:0] reg_speed;
  // 0 == normal speed (e.g. sample rate = 800 KHz, every other filter output is not sent (decimated))
  // 1 == 50 Kchip/s (e.g. sample rate = 800 KHz, all filter outputs are sent)
  // 2 == 25 Kchip/s (e.g. sample rate = 400 KHz, all filter outputs are sent)

  wire transmit_pe = ~transmit_dd && transmit_d;

  always @(posedge clk)
    tx_state_d <= tx_state;

  reg msg_done_d = 1'b0;

  always @(posedge clk)
  begin
    if (tx_state == IDLE)
      msg_done_d <= 1'b0;
    else
      msg_done_d <= msg_done;
  end

  reg tx_done_d;
  wire tx_done;
  wire tx_done_pe = tx_done & ~tx_done_d;

  reg [3:0] skip_count;
  always @(reg_speed)
	if (reg_speed[1])
	  skip_count = 4'd8; // (4000 / (8 + 2)) = 400 Ksps
	else
	  skip_count = 4'd3; // (4000 / (3 + 2)) = 800 Ksps

  always @(posedge clk)
    tx_done_d <= tx_done;

  always @(posedge clk)
  begin
    if (tx_done_pe)
    begin
      transmit_d <= transmit;
      transmit_dd <= transmit_d;
      if (tx_state == IDLE)
      begin
        tx_data <= 32'b0;
        if (transmit_pe)
        begin
          cntr2 <= 4'd0;
          tx_state <= PREPARE;
        end
      end
      if (tx_state == PREPARE)
      begin
        cntr2 <= cntr2 + 4'd1;
        if (cntr2 == skip_count)
        begin
          tx_data <= {2'b10, OUTPUT_I[12:0], 1'b1, 2'b01, OUTPUT_Q[12:0], 1'b0};
          tx_state <= TRANSMIT;
        end
      end
      if (tx_state == TRANSMIT)
      begin
        if (msg_done_d)
        begin
          tx_data <= {2'b10, 14'b0, 2'b01, 14'b0};
          tx_state <= IDLE;
        end
        else begin
          tx_data <= 32'b0;
          tx_state <= PREPARE;
          cntr2 <= 4'd0;
        end
      end
    end
  end

  reg gen_enable = 1'b0;

  always @(posedge clk)
  begin
    gen_enable <= (tx_state_d != PREPARE && tx_state == PREPARE && !msg_done_d);
  end

  reg is_idle;

  always @(tx_state)
    is_idle = (tx_state == IDLE);

  lvds_trx trx(
    .tx_data(tx_data),
    .enable(1'b1),
    .clk64mhz(s_rx_ck),
    .tx_done (tx_done),
    .tx_a(tx_a),
    .clk_a(clk_a),
    .slowclk(clk)
  );

  wire [9:0] ram_addr, o_addr;
  wire [7:0] ram_data, o_data;
  reg  [7:0] fifo_data;
  wire [7:0] ram_or_fifo;
  wire [3:0] GPIOs;

  wire transmit, o_rd, o_wr;
  wire reg_cw; // to chose if set maximum output on I and Q or real mesage
  wire reg_use_fifo;
  wire reg_oqpsk;

  // [ 31:24,  23:16,   15:8,    7:0]
  // [byte 0, byte 1, byte 2, byte 3]
  always @(posedge hwclk)
  begin
	fifo_data <= (o_addr[1:0] == 2'd0) ? fifo_out[31:24] : (
		(o_addr[1:0] == 2'd1) ? fifo_out[23:16] : (
		(o_addr[1:0] == 2'd2) ? fifo_out[15:8] : fifo_out[7:0]));
  end

  assign ram_or_fifo = reg_use_fifo ? fifo_data : ram_data;

  signal_gen sg0(
    .clk(clk),
    .reset(rst),
    .enable(gen_enable),
    .done(msg_done),
    .read_enable(read_enable),
    .ram_addr(ram_addr),
    .ram_data(ram_data),
    .OUTPUT_I(sg_output_i),
    .OUTPUT_Q(sg_output_q),
	.downsample(reg_speed == 2'b00),
	.oqpsk(reg_oqpsk)
  );
   
  assign OUTPUT_I = reg_cw ? 13'b0111111111111 : sg_output_i;
  assign OUTPUT_Q = reg_cw ? 13'b0111111111111 : sg_output_q;

  DP_RAM1024x8 sb_ram_1024x8_u1 ( 
        .Reset(~reset_n),
        .Q(ram_data), 
        .RdClock(hwclk), 
        .RdClockEn(1'b1),// always read
        .RdAddress(is_idle ? o_addr : ram_addr),
        .WrClock(hwclk), 
        .WrClockEn(o_wr), 
        .WE(is_idle & o_wr),
        .WrAddress(o_addr),
        .Data(o_data));

  control ctrl(
    .clk(hwclk),
    .reset(~reset_n),
    .i_mosi(mosi),
    .i_ssn(cs),
    .i_sclk(spi_clk_in),
	.i_gpios(GPIOs),
    .o_miso(spi_miso),
    .o_rd(o_rd),
    .o_wr(o_wr),
    .i_tx_done(msg_done_d),
    .i_ram_data(ram_or_fifo),
    .o_ram_addr(o_addr),
    .o_ram_data(o_data),
    .o_msg_length(msg_length),
    .o_transmit(transmit),
    .o_reg_cw(reg_cw),
	.o_reg_speed(reg_speed),
	.o_reg_use_fifo(reg_use_fifo),
	.o_reg_oqpsk(reg_oqpsk),
	.o_fifo_reset(fifo_reset)
  );

  wire spi_miso;
  wire rst;

  reg fifo_write;
  reg [1:0] valid_cntr;
  reg [31:0] rx_data;
  reg [31:0] valid_data;
  reg [3:0] sync_cnt;
  reg valid;
  wire [1:0] s_rx_d;
  wire s_rx_ck, sync, all_zero, fifo_reset;
  reg fifo_read;
  
  DDR_RECEIVE ddr_recv(clk64mhz, ~reset_n, s_rx_ck, rx_in, s_rx_d);

  assign sync = (rx_data[31:30] == 2'b10) && (rx_data[15:14] == 2'b01);
  assign all_zero = (rx_data[31:0] == 32'b0);

  always @(posedge hwclk)
	fifo_read <= (o_rd && o_addr[1:0] == 2'd3);

  always @(posedge s_rx_ck)
	rx_data <= {rx_data[29:0], s_rx_d[0], s_rx_d[1]};

  always @(posedge s_rx_ck)
  begin
	sync_cnt <= sync_cnt + 4'd1;
	valid <= 1'b0;
	if (all_zero)
	  sync_cnt <= 4'd0;
	else if (sync_cnt == 4'd15 && sync)
	begin
	  valid <= 1'b1;
	  valid_data <= rx_data;
	end
  end

  wire fifo_almost_empty;

  data_fifo df(
	.Data(valid_data),
	.WrClock(s_rx_ck),
	.RdClock(hwclk),
	.WrEn(valid),
	.RdEn(fifo_read),
	.Reset(fifo_reset),
	.RPReset(~reset_n),
	.AlmostEmpty(fifo_almost_empty),
	.Q(fifo_out));

  assign miso = ~cs ? spi_miso : 1'bz;
  assign rst = (tx_state == IDLE);

  reg [31:0] cntr3 = 0;

  assign GPIO1 = 1;
  assign GPIO2 = 1;
  assign GPIO3 = transmit;
  assign GPIO4 = ~fifo_almost_empty;
  
  assign GPIOs = {1'b1, 1'b1, transmit, ~fifo_almost_empty };

endmodule
