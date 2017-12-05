module top(
  input hwclk,
  input reset_n,
  input cs,
  input mosi,
  input spi_clk_in,
  output miso,
  output GPIO1,
  output GPIO2,
  output GPIO3,
  output GPIO4,
//  output led5,
//  output led6,
//  output led7,
//  output led8,
  output tx_a,
  //output tx_b,
  output clk_a
  //output clk_b
);

  parameter IDLE = 2'd0;
  parameter PREPARE = 2'd1;
  parameter TRANSMIT = 2'd2;

  wire clk64mhz;
  wire pll_outg;
  wire lock;
  wire clk;
//  wire hwclk;
//defparam OSCH_inst.NOM_FREQ = "12.09";  
//OSCH OSCH_inst( 
//    .STDBY(1'b0), // 0=Enabled, 1=Disabled
//    .OSC(hwclk),
//    .SEDSTDBY()
//    );

  // 64 MHz clock.
  //CLKI, RST, CLKOP, LOCK
  PLL_64MHz pll_u1 (
    //.BYPASS(1'b0),
    .RST(~reset_n),
    .CLKI(hwclk),
    .LOCK(lock),
    .CLKOP(clk64mhz)
  );

  // Make the 64 MHz clock a net
  //SB_GB SB_GB(
  //  .USER_SIGNAL_TO_GLOBAL_BUFFER(pll_outg),
  //  .GLOBAL_BUFFER_OUTPUT(clk64mhz)
  //);

  reg reset;
  reg [3:0] cntr2 = 4'd0;
  reg [31:0] tx_data = 32'b0;

  reg [1:0] tx_state = IDLE, tx_state_d = IDLE;

  wire [12:0] OUTPUT_I;
  wire [12:0] OUTPUT_Q;
  wire [12:0] sg_output_i;
  wire [12:0] sg_output_q;

  wire read_enable, msg_done;
  reg transmit_d = 1'b0, transmit_dd;

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
        cntr2 <= cntr2 + 1;
        if (cntr2 == 4'd3)// to speed up to 800KHz
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
    .clk64mhz(clk64mhz),
    .tx_done (tx_done),
    .tx_a(tx_a),
    //.tx_b(tx_b),
    .clk_a(clk_a),
    //.clk_b(clk_b),
    .slowclk(clk)
  );

  wire [9:0] ram_addr, o_addr;
  wire [7:0] ram_data, o_data;
  wire transmit, o_rd, o_wr;
  wire reg_cw; // to chose if set maximum output on I and Q or real mesage
  signal_gen sg0(
    .clk(clk),
    .reset(rst),
    .enable(gen_enable),
    .done(msg_done),
    .read_enable(read_enable),
    .ram_addr(ram_addr),
    .ram_data(ram_data),
    .OUTPUT_I(sg_output_i),
    .OUTPUT_Q(sg_output_q)
  );
   
  assign OUTPUT_I = reg_cw ? 13'b0111111111111 : sg_output_i;
  assign OUTPUT_Q = reg_cw ? 13'b0111111111111 : sg_output_q;
/*
  SB_RAM1024x8 ram (
    .RDATA(ram_data),
    .RCLK(hwclk),
    .RCLKE(1'b1), // always read
    .RE(is_idle ? o_rd : read_enable),
    .RADDR(is_idle ? o_addr : ram_addr),
    .WCLK(hwclk),
    .WCLKE(o_wr),
    .WE(is_idle & o_wr),
    .WADDR(o_addr),
    .MASK(8'b00000000),
    .WDATA(o_data)
  );*/
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
        .Data(o_data) 
            );

  control ctrl(
    .clk(hwclk),
    .reset(~reset_n),
    .i_mosi(mosi),
    .i_ssn(cs),
    .i_sclk(spi_clk_in),
    .o_miso(spi_miso),
    .o_rd(o_rd),
    .o_wr(o_wr),
    .i_tx_done(msg_done_d),
    .i_ram_data(ram_data),
    .o_ram_addr(o_addr),
    .o_ram_data(o_data),
    .o_msg_length(msg_length),
    .o_transmit(transmit),
    .o_reg_cw(reg_cw)
  );


  wire spi_miso;

/*
  SB_IO #(
      .PIN_TYPE(6'b 1010_01),
      .PULLUP(1'b0)
  ) io_block_instance (
      .PACKAGE_PIN(miso),
      .OUTPUT_ENABLE(~cs),
      .D_OUT_0(spi_miso),
      .D_IN_0(din)
  );*/

  wire rst;
  
  assign miso = ~cs ? spi_miso : 'bz;

  assign rst = (tx_state == IDLE);

  reg [31:0] cntr3 = 0;
  reg blink = 0;

  always @(posedge clk64mhz)
  begin
	  cntr3 <= cntr3 + 1;
	  if (cntr3 == 32'd32000000)
      begin
		  cntr3 <= 0;
		  blink <= ~blink;
      end
  end

//  assign led1 = ~lock;
//  assign led2 = ~tx_state[0];
//  assign led3 = ~tx_state[1];
//  assign led4 = ~transmit;
//  assign led5 = ~o_addr[0];
//  assign led6 = ~o_addr[1];
//  assign led7 = ~o_addr[2];
//  assign led8 = ~blink;
  assign GPIO1 = 1;
  assign GPIO2 = 1;
  assign GPIO3 = 0;
  assign GPIO4 = ~blink;

endmodule
