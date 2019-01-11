module shiftreg(CLK, WE, WDATA, RDATA_I, RDATA_Q );
  
parameter OUTPUT_DATA_WIDTH = 66;// was 34
parameter SHIFT_REG_WIDTH = OUTPUT_DATA_WIDTH*2;
parameter INPUT_DATA_WIDTH =4; 
parameter NUMBER_OF_PAIRS = OUTPUT_DATA_WIDTH/2;
input CLK;
input WE;
input [INPUT_DATA_WIDTH-1:0] WDATA;
output [OUTPUT_DATA_WIDTH-1:0] RDATA_I;
output [OUTPUT_DATA_WIDTH-1:0] RDATA_Q; 


reg [SHIFT_REG_WIDTH-1:0] data = {SHIFT_REG_WIDTH {1'b0}};

  always @(posedge CLK)
  begin
    if (WE == 1)
    begin
      data <= { WDATA, data[SHIFT_REG_WIDTH-1:INPUT_DATA_WIDTH] };
    end
  end


generate
  genvar   idx;
  for (idx = 0; idx <= ((OUTPUT_DATA_WIDTH/2)-1); idx = idx +1) 
  begin
    assign RDATA_I[(OUTPUT_DATA_WIDTH-1)-2*idx:(OUTPUT_DATA_WIDTH-2)-2*idx] = data [(SHIFT_REG_WIDTH-1)-INPUT_DATA_WIDTH*idx:(SHIFT_REG_WIDTH-2)-INPUT_DATA_WIDTH*idx];
    assign RDATA_Q[(OUTPUT_DATA_WIDTH-1)-2*idx:(OUTPUT_DATA_WIDTH-2)-2*idx] = data [(SHIFT_REG_WIDTH-3)-INPUT_DATA_WIDTH*idx:(SHIFT_REG_WIDTH-4)-INPUT_DATA_WIDTH*idx];
  end
endgenerate  
  //assign RDATA_I = { data[67:66], data[63:62], data[59:58], data[55:54], data[51:50], data[47:46], data[43:42], data[39:38], data[35:34], data[31:30], data[27:26], data[23:22], data[19:18], data[15:14], data[11:10], data[7:6], data[3:2] };
  //assign RDATA_I = { data[65:64], data[61:60], data[57:56], data[53:52], data[49:48], data[45:44], data[41:40], data[37:36], data[33:32], data[29:28], data[25:24], data[21:20], data[17:16], data[13:12], data[9:8], data[5:4], data[1:0] };
endmodule

