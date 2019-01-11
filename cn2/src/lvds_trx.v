module lvds_trx(
  input [31:0] tx_data,
  input enable,
  input clk64mhz,
  output tx_done,
  output tx_a, //output tx_b, 
  output clk_a, //output clk_b,
  output slowclk
);

  reg [3:0] cntr = 4'd0;
  reg [31:0] tx_buf = 32'd0;
  reg tx0 = 1'b0, tx1 = 1'b0;

  //SB_GB gb1(
  //  .USER_SIGNAL_TO_GLOBAL_BUFFER(cntr[1]),
  //  .GLOBAL_BUFFER_OUTPUT(slowclk)
  //);
  assign slowclk = cntr[2];

  always @(posedge clk64mhz)
  begin
    cntr <= cntr + 1;
    if (cntr == 4'd15)
    begin
      tx_buf <= tx_data;
	  tx1 <= tx_data[30];
      tx0 <= tx_data[31];
    end else begin
      tx_buf <= {tx_buf[29:0], 2'b00};
	  tx1 <= tx_buf[28];
      tx0 <= tx_buf[29];
    end
  end

  /*defparam transmit_a.PIN_TYPE = 6'b0100_00 ;
  defparam transmit_a.IO_STANDARD = "SB_LVCMOS" ;
  SB_IO transmit_a (
    .PACKAGE_PIN(tx_a),
    .OUTPUT_CLK (clk64mhz),
    .OUTPUT_ENABLE (enable),
    .D_OUT_0 (tx0),
    .D_OUT_1 (tx1)
  );

  defparam transmit_b.PIN_TYPE = 6'b0100_00 ;
  defparam transmit_b.IO_STANDARD = "SB_LVCMOS" ;
  SB_IO transmit_b (
    .PACKAGE_PIN(tx_b),
    .OUTPUT_CLK (clk64mhz),
    .OUTPUT_ENABLE (enable),
    .D_OUT_0 (~tx0),
    .D_OUT_1 (~tx1)
  );*/
//DDR_TRANSMIT (clk, clkout, reset, sclk, dataout, dout)
DDR_TRANSMIT transmit (
    .clk(clk64mhz),
    .clkout(clk_a),
    .reset(1'b0),
    .sclk(),
    .dataout({tx1,tx0}),
    .dout(tx_a)
  );
/*
  defparam tclk_a.PIN_TYPE = 6'b0100_00 ;
  defparam tclk_a.IO_STANDARD = "SB_LVCMOS" ;
  SB_IO tclk_a (
    .PACKAGE_PIN(clk_a),
    .OUTPUT_CLK (clk64mhz),
    .OUTPUT_ENABLE (enable),
    .D_OUT_0 (1'b1),
    .D_OUT_1 (1'b0)
  );

  defparam tclk_b.PIN_TYPE = 6'b0100_00 ;
  defparam tclk_b.IO_STANDARD = "SB_LVCMOS" ;
  SB_IO tclk_b (
    .PACKAGE_PIN(clk_b),
    .OUTPUT_CLK (clk64mhz),
    .OUTPUT_ENABLE (enable),
    .D_OUT_0 (1'b0),
    .D_OUT_1 (1'b1)
  );
*/
  assign tx_done = cntr[3];

endmodule
