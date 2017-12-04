module shiftreg(
  input CLK,
  input WE,
  input [3:0] WDATA,
  output [33:0] RDATA_I,
  output [33:0] RDATA_Q
);
  reg [67:0] data = 68'h0;

  always @(posedge CLK)
  begin
    if (WE == 1)
    begin
      data <= { WDATA, data[67:4] };
    end
  end

  assign RDATA_I = { data[67:66], data[63:62], data[59:58], data[55:54], data[51:50], data[47:46], data[43:42], data[39:38], data[35:34], data[31:30], data[27:26], data[23:22], data[19:18], data[15:14], data[11:10], data[7:6], data[3:2] };
  assign RDATA_Q = { data[65:64], data[61:60], data[57:56], data[53:52], data[49:48], data[45:44], data[41:40], data[37:36], data[33:32], data[29:28], data[25:24], data[21:20], data[17:16], data[13:12], data[9:8], data[5:4], data[1:0] };
endmodule
