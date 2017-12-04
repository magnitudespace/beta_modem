module preamble(
  input clk,
  input reset,
  input enable,
  output valid,
  output [3:0] preamble
);

  reg [3:0] offset = 4'b0;
  reg [6:0] offset2 = 7'b0;
  reg [1:0] s2 = 2'b0;
  reg [3:0] preamble_buffer = 4'b0;
  wire [1:0] s1;
  reg data_valid = 1'b0;
  reg next_code = 1'b0;

  assign preamble = preamble_buffer;
  assign valid = data_valid;

  preamble_s1 sg1(
    .clk(clk),
    .reset(reset),
    .enable(next_code),
    .s1(s1)
  );

  always @(offset)
  begin
    s2 = 2'b00;
    case (offset)
      4'h0 : s2 = 2'b00; //  1
      4'h1 : s2 = 2'b10; //  j
      4'h2 : s2 = 2'b10; //  j
      4'h3 : s2 = 2'b00; //  1
      4'h4 : s2 = 2'b10; //  j
      4'h5 : s2 = 2'b11; // -1
      4'h6 : s2 = 2'b11; // -1
      4'h7 : s2 = 2'b10; //  j
      4'h8 : s2 = 2'b10; //  j
      4'h9 : s2 = 2'b00; //  1
      4'ha : s2 = 2'b11; // -1
      4'hb : s2 = 2'b01; // -j
      4'hc : s2 = 2'b00; //  1
      4'hd : s2 = 2'b01; // -j
      4'he : s2 = 2'b10; //  j
      4'hf : s2 = 2'b11; // -1
    endcase
  end

  always @(s1 or s2)
  begin
    preamble_buffer = 4'b0000; // prevent latches
    case ({s2, s1})
      4'b0000 : preamble_buffer = 4'b0101;
      4'b0001 : preamble_buffer = 4'b0111;
      4'b0010 : preamble_buffer = 4'b1101;
      4'b0011 : preamble_buffer = 4'b1111;
      4'b0100 : preamble_buffer = 4'b0111;
      4'b0101 : preamble_buffer = 4'b1111;
      4'b0110 : preamble_buffer = 4'b0101;
      4'b0111 : preamble_buffer = 4'b1101;
      4'b1000 : preamble_buffer = 4'b1101;
      4'b1001 : preamble_buffer = 4'b0101;
      4'b1010 : preamble_buffer = 4'b1111;
      4'b1011 : preamble_buffer = 4'b0111;
      4'b1100 : preamble_buffer = 4'b1111;
      4'b1101 : preamble_buffer = 4'b1101;
      4'b1110 : preamble_buffer = 4'b0111;
      4'b1111 : preamble_buffer = 4'b0101;
    endcase
  end

  always @(posedge clk)
  begin
    if (reset) begin
      offset <= 0;
      offset2 <= 0;
    end else if (enable) begin
      data_valid <= 1'b0;
      offset <= offset + 1;
      if (offset == 15) begin
        next_code <= 1'b1;
        offset <= 0;
        offset2 <= offset2 + 1;
      end
      else begin
        next_code <= 1'b0;
      end
    end else begin
      data_valid <= ~next_code;
      next_code <= 1'b0;
    end
  end

endmodule

module preamble_s1(
  input clk,
  input reset,
  input enable,
  output [1:0] s1
);

  wire z1, z2;

  preamble_z_n zg1(
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .initial_reg_x(9'b1),
    .initial_reg_y(9'h1ff),
    .z_n(z1));

  preamble_z_n zg2(
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .initial_reg_x(9'b000010101),
    .initial_reg_y(9'b101011001),
    .z_n(z2));

  assign s1 = {z1, z2};

endmodule

module preamble_z_n(
  input clk,
  input reset,
  input enable,
  input [8:0] initial_reg_x,
  input [8:0] initial_reg_y,
  output z_n
);

  reg [8:0] reg_x;
  reg [8:0] reg_y;

  always @(posedge clk)
  begin
    if (reset)
    begin
      reg_x <= initial_reg_x;
      reg_y <= initial_reg_y;
    end else if (enable) begin
      reg_x <= {reg_x[0] ^ reg_x[4], reg_x[8:1]};
      reg_y <= {reg_y[0] ^ reg_y[1] ^ reg_y[3] ^ reg_y[4], reg_y[8:1]};
    end
  end

  assign z_n = reg_x[0] ^ reg_y[0];
endmodule
