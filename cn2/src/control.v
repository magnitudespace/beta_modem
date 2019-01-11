module control(
  input clk,
  input reset,
  input i_sclk,
  input i_ssn,
  input i_mosi,
  input i_tx_done,
  input [7:0] i_ram_data,
  input [3:0] i_gpios,
  output o_miso,
  output o_rd,
  output o_wr,
  output o_reg_cw,
  output [7:0] o_ram_data,
  output [9:0] o_ram_addr,
  output [9:0] o_msg_length,
  output o_transmit
);

  wire is_ram; // is this address a ram address?
  wire [9:0] o_addr;
  wire [7:0] o_data;
  reg [7:0] i_data;
  reg [9:0] msg_length = 10'd0;
  reg transmit = 1'b0;
  reg i_tx_done_d;
  reg [7:0] c_data;
  reg reg_cw;

  assign is_ram = o_addr < 10'd1000;

  always @(o_addr)
  begin
    case (o_addr)
      10'd1020: c_data = 8'b10010110;
      10'd1021: c_data = 8'd0;
      10'd1022: c_data = 8'd4;
      default: c_data = 8'b0;
    endcase
  end

  // Register read (i_data is SPI out)
  always @(*)
  begin
    if (is_ram)
      i_data = i_ram_data;
    else begin
      case (o_addr)
        10'd1000: i_data = {6'b0, msg_length[9:8]};
        10'd1001: i_data = msg_length[7:0];
        10'd1023: i_data = {3'b0, i_gpios, transmit };
        default: i_data = c_data;
      endcase
    end
  end

  always @(posedge clk)
    i_tx_done_d <= i_tx_done;

  // Register write (o_data is SPI in)
  always @(posedge clk)
  begin
    if (reset)
    begin
      msg_length <= 10'd0;
      transmit <= 1'b0;
      reg_cw <= 1'b0;
    end
    else if (i_tx_done_d)
    begin
      transmit <= 1'b0;
    end
    else if (spi_wr && ~is_ram && !transmit)
    begin
      case (o_addr)
        10'd1000: msg_length[9:8] <= o_data[1:0];
        10'd1001: msg_length[7:0] <= o_data;
        10'd1019: reg_cw   <= o_data[0];
        10'd1023: transmit <= o_data[0];
      endcase
    end
  end

  wire spi_wr, spi_rd;

  SPI_Slave_top spi(
    .i_sys_clk(clk),
    .i_mosi(i_mosi),
    .i_ssn(i_ssn),
    .i_sclk(i_sclk),
    .o_miso(o_miso),
    .i_data(i_data),
    .o_wr(spi_wr),
    .o_rd(spi_rd),
    .o_data(o_data),
    .o_addr(o_addr)
  );

  assign o_wr = is_ram && spi_wr;
  assign o_rd = is_ram && spi_rd;
  assign o_ram_addr = o_addr;
  assign o_ram_data = o_data;
  assign o_transmit = transmit;
  assign o_msg_length = msg_length;
  assign o_reg_cw = reg_cw;

endmodule
