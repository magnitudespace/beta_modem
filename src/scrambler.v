module scrambler_pn(
  input clk,
  input reset,
  input enable,
  output cn1,
  output cn2
);

  reg [24:0] reg0 = 25'b1;
  reg [24:0] reg1 = 25'h1ffffff;

  always @(posedge clk)
  begin
    if (reset)
    begin
      reg0 <= 25'b1;
      reg1 <= 25'h1ffffff;
    end else if (enable) begin
      reg0 <= {reg0[0] ^ reg0[3], reg0[24:1]};
      reg1 <= {reg1[0] ^ reg1[1] ^ reg1[2] ^ reg1[3], reg1[24:1]};
    end
  end

  assign cn1 = reg0[0] ^ reg1[0];
  assign cn2 = (reg0[4] ^ reg0[7] ^ reg0[18]) ^ (reg1[4] ^ reg1[6] ^ reg1[17]);

endmodule

module scrambler(
  input clk,
  input reset,
  input enable,
  output valid,
  output [1:0] out);

  reg w1 = 1'b0;
  reg l_cn2 = 1'b0;
  reg data_valid = 1'b0;
  wire cn1, cn2;

  scrambler_pn pn0(
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .cn1(cn1),
    .cn2(cn2)
  );

  always @(posedge clk)
  begin
    if (reset)
    begin
      w1 <= 1'b0;
      l_cn2 <= 1'b0;
    end
    else if (enable) begin
      data_valid <= 1'b0;
      w1 <= ~w1;
      l_cn2 <= cn2;
    end else begin
      data_valid <= 1'b1;
    end
  end

  assign valid = data_valid;
  assign out = {~cn1, ~ (w1 ^ cn1 ^ (w1 ? l_cn2 : cn2))};

endmodule
