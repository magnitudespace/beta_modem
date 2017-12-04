module signal_gen(
  input clk,
  input reset,
  input enable,
  input [7:0] ram_data,
  output done,
  output [9:0] ram_addr,
  output read_enable,
  output [12:0] OUTPUT_I,
  output [12:0] OUTPUT_Q,
  output valid
);

  // Inputs
  reg [15:0] msg_length = 16'd2119; // x2 bits
  wire [3:0] data;

  // Outputs
  wire data_valid, eof;

  reg [3:0] state;
  reg [3:0] filter_stage = 4'b0000;//one bit more for 8 t over sampling
  reg filter_enable = 0;

  parameter INITIAL = 4'd0;
  parameter LOAD = 4'd1;
  parameter WAIT_FOR_DATA = 4'd2;
  parameter SHIFT = 4'd3;
  parameter FILTER_I = 4'd4;
  parameter FILTER_I1 = 4'd5;
  parameter FILTER_Q = 4'd6;
  parameter FILTER_Q1 = 4'd7;
  parameter TRANSMIT = 4'd8;
  parameter DONE = 4'd9;

  always @ (posedge clk) begin
    if (reset)
    begin
      state <= INITIAL;
      filter_enable <= 0;
      filter_stage <= 0;
    end
    else begin
      if (state == INITIAL && enable)
      begin
        state <= LOAD;
      end
      if (state == LOAD)
      begin
        state <= WAIT_FOR_DATA;
      end
      if (state == WAIT_FOR_DATA && eof)
      begin
        state <= DONE;
        filter_enable <= 0;
      end
      else if (state == WAIT_FOR_DATA && data_valid)
      begin
        state <= SHIFT;
        filter_enable <= 0;
      end
      if (state == SHIFT)
      begin
        state <= FILTER_I;
        filter_stage <= 0;
        filter_enable <= 1;
      end
      if (state == FILTER_I)
      begin
        state <= FILTER_I1;
      end
      if (state == FILTER_I1) begin
        filter_stage <= filter_stage + 1;
        state <= FILTER_Q;
      end
      if (state == FILTER_Q)
      begin
        state <= FILTER_Q1;
      end
      if (state == FILTER_Q1)
      begin
        state <= TRANSMIT;
      end
      if (state == TRANSMIT && enable)
      begin
        if (filter_stage != 4'b1111)//one bit more for 8 t over sampling
        begin
          filter_stage <= filter_stage + 1;
          state <= FILTER_I;
        end else begin
          state <= LOAD;
          filter_enable <= 0;
        end
      end
      if (state == DONE && enable)
      begin
        state <= INITIAL;
      end
    end
  end

  wire [65:0] RDATA0;//should be parametrized size 65 vs 33 
  wire [65:0] RDATA1;//should be parametrized size 65 vs 33 

  generator g0(
    .clk(clk),
    .reset(reset),
    .enable(state == LOAD),
    .msg_length(msg_length),
    .ram_data(ram_data),
    .valid(data_valid),
    .done(eof),
    .read_enable(read_enable),
    .ram_addr(ram_addr),
    .data(data)
  );

  shiftreg s1(
    .CLK(clk),
    .WE(state == SHIFT),
    .WDATA(data),
    .RDATA_I(RDATA0),
    .RDATA_Q(RDATA1)
  );

  filter8 f1(
    .CLK(clk),
    .ENABLE(filter_enable),
    .STAGE(filter_stage),
    .INPUT_I(RDATA0),
    .INPUT_Q(RDATA1),
    .OUTPUT_I(OUTPUT_I),
    .OUTPUT_Q(OUTPUT_Q)
  );

  assign valid = (state == TRANSMIT);
  assign done = (state == DONE);

endmodule
