module filter(
  input CLK,
  input ENABLE,
  input [2:0] STAGE,
  input [33:0] INPUT_I,
  input [33:0] INPUT_Q,
  output [12:0] OUTPUT_I,
  output [12:0] OUTPUT_Q
);

  wire [13:0] sum;
  reg signed [12:0] result_i = 0;
  reg signed [12:0] result_q = 0;

  assign OUTPUT_I = result_i;
  assign OUTPUT_Q = result_q;

  wire [33:0] INPUT;

  assign INPUT = STAGE[0] ? INPUT_Q : INPUT_I;

  reg [13:0] a0 /* synthesis syn_romstyle = "select_rom" */, a1 /* synthesis syn_romstyle = "select_rom" */, a2 /* synthesis syn_romstyle = "select_rom" */, a3 /* synthesis syn_romstyle = "select_rom" */, a4 /* synthesis syn_romstyle = "select_rom" */, a5 /* synthesis syn_romstyle = "select_rom" */, a6 /* synthesis syn_romstyle = "select_rom" */, a7 /* synthesis syn_romstyle = "select_rom" */, a8 /* synthesis syn_romstyle = "select_rom" */, a9 /* synthesis syn_romstyle = "select_rom" */, a10 /* synthesis syn_romstyle = "select_rom" */, a11 /* synthesis syn_romstyle = "select_rom" */, a12 /* synthesis syn_romstyle = "select_rom" */, a13 /* synthesis syn_romstyle = "select_rom" */, a14 /* synthesis syn_romstyle = "select_rom" */, a15 /* synthesis syn_romstyle = "select_rom" */, a16 /* synthesis syn_romstyle = "select_rom" */;

  always @ (STAGE or INPUT) 
  begin

    a0 = 0;
    case ({STAGE[2:1], INPUT[1:0]})
      4'b0000 : a0 = 0;
      4'b0001 : a0 = -23;
      4'b0010 : a0 = 0;
      4'b0011 : a0 = 23;
      4'b0100 : a0 = 0;
      4'b0101 : a0 = 0;
      4'b0110 : a0 = 0;
      4'b0111 : a0 = 0;
      4'b1000 : a0 = 0;
      4'b1001 : a0 = 0;
      4'b1010 : a0 = 0;
      4'b1011 : a0 = 0;
      4'b1100 : a0 = 0;
      4'b1101 : a0 = 0;
      4'b1110 : a0 = 0;
      4'b1111 : a0 = 0;
    endcase

    a1 = 0;
    case ({STAGE[2:1], INPUT[3:2]})
      4'b0000 : a1 = 0;
      4'b0001 : a1 = 15;
      4'b0010 : a1 = 0;
      4'b0011 : a1 = -15;
      4'b0100 : a1 = 0;
      4'b0101 : a1 = 33;
      4'b0110 : a1 = 0;
      4'b0111 : a1 = -33;
      4'b1000 : a1 = 0;
      4'b1001 : a1 = 23;
      4'b1010 : a1 = 0;
      4'b1011 : a1 = -23;
      4'b1100 : a1 = 0;
      4'b1101 : a1 = -2;
      4'b1110 : a1 = 0;
      4'b1111 : a1 = 2;
    endcase

    a2 = 0;
    case ({STAGE[2:1], INPUT[5:4]})
      4'b0000 : a2 = 0;
      4'b0001 : a2 = 8;
      4'b0010 : a2 = 0;
      4'b0011 : a2 = -8;
      4'b0100 : a2 = 0;
      4'b0101 : a2 = -26;
      4'b0110 : a2 = 0;
      4'b0111 : a2 = 26;
      4'b1000 : a2 = 0;
      4'b1001 : a2 = -37;
      4'b1010 : a2 = 0;
      4'b1011 : a2 = 37;
      4'b1100 : a2 = 0;
      4'b1101 : a2 = -16;
      4'b1110 : a2 = 0;
      4'b1111 : a2 = 16;
    endcase

    a3 = 0;
    case ({STAGE[2:1], INPUT[7:6]})
      4'b0000 : a3 = 0;
      4'b0001 : a3 = -51;
      4'b0010 : a3 = 0;
      4'b0011 : a3 = 51;
      4'b0100 : a3 = 0;
      4'b0101 : a3 = -9;
      4'b0110 : a3 = 0;
      4'b0111 : a3 = 9;
      4'b1000 : a3 = 0;
      4'b1001 : a3 = 32;
      4'b1010 : a3 = 0;
      4'b1011 : a3 = -32;
      4'b1100 : a3 = 0;
      4'b1101 : a3 = 38;
      4'b1110 : a3 = 0;
      4'b1111 : a3 = -38;
    endcase

    a4 = 0;
    case ({STAGE[2:1], INPUT[9:8]})
      4'b0000 : a4 = 0;
      4'b0001 : a4 = 107;
      4'b0010 : a4 = 0;
      4'b0011 : a4 = -107;
      4'b0100 : a4 = 0;
      4'b0101 : a4 = 86;
      4'b0110 : a4 = 0;
      4'b0111 : a4 = -86;
      4'b1000 : a4 = 0;
      4'b1001 : a4 = 10;
      4'b1010 : a4 = 0;
      4'b1011 : a4 = -10;
      4'b1100 : a4 = 0;
      4'b1101 : a4 = -48;
      4'b1110 : a4 = 0;
      4'b1111 : a4 = 48;
    endcase

    a5 = 0;
    case ({STAGE[2:1], INPUT[11:10]})
      4'b0000 : a5 = 0;
      4'b0001 : a5 = -169;
      4'b0010 : a5 = 0;
      4'b0011 : a5 = 169;
      4'b0100 : a5 = 0;
      4'b0101 : a5 = -218;
      4'b0110 : a5 = 0;
      4'b0111 : a5 = 218;
      4'b1000 : a5 = 0;
      4'b1001 : a5 = -115;
      4'b1010 : a5 = 0;
      4'b1011 : a5 = 115;
      4'b1100 : a5 = 0;
      4'b1101 : a5 = 29;
      4'b1110 : a5 = 0;
      4'b1111 : a5 = -29;
    endcase

    a6 = 0;
    case ({STAGE[2:1], INPUT[13:12]})
      4'b0000 : a6 = 0;
      4'b0001 : a6 = 225;
      4'b0010 : a6 = 0;
      4'b0011 : a6 = -225;
      4'b0100 : a6 = 0;
      4'b0101 : a6 = 437;
      4'b0110 : a6 = 0;
      4'b0111 : a6 = -437;
      4'b1000 : a6 = 0;
      4'b1001 : a6 = 325;
      4'b1010 : a6 = 0;
      4'b1011 : a6 = -325;
      4'b1100 : a6 = 0;
      4'b1101 : a6 = 52;
      4'b1110 : a6 = 0;
      4'b1111 : a6 = -52;
    endcase

    a7 = 0;
    case ({STAGE[2:1], INPUT[15:14]})
      4'b0000 : a7 = 0;
      4'b0001 : a7 = -264;
      4'b0010 : a7 = 0;
      4'b0011 : a7 = 264;
      4'b0100 : a7 = 0;
      4'b0101 : a7 = -885;
      4'b0110 : a7 = 0;
      4'b0111 : a7 = 885;
      4'b1000 : a7 = 0;
      4'b1001 : a7 = -782;
      4'b1010 : a7 = 0;
      4'b1011 : a7 = 782;
      4'b1100 : a7 = 0;
      4'b1101 : a7 = -274;
      4'b1110 : a7 = 0;
      4'b1111 : a7 = 274;
    endcase

    a8 = 0;
    case ({STAGE[2:1], INPUT[17:16]})
      4'b0000 : a8 = 0;
      4'b0001 : a8 = 4716;
      4'b0010 : a8 = 0;
      4'b0011 : a8 = -4716;
      4'b0100 : a8 = 0;
      4'b0101 : a8 = 4172;
      4'b0110 : a8 = 0;
      4'b0111 : a8 = -4172;
      4'b1000 : a8 = 0;
      4'b1001 : a8 = 2769;
      4'b1010 : a8 = 0;
      4'b1011 : a8 = -2769;
      4'b1100 : a8 = 0;
      4'b1101 : a8 = 1081;
      4'b1110 : a8 = 0;
      4'b1111 : a8 = -1081;
    endcase

    a9 = 0;
    case ({STAGE[2:1], INPUT[19:18]})
      4'b0000 : a9 = 0;
      4'b0001 : a9 = -264;
      4'b0010 : a9 = 0;
      4'b0011 : a9 = 264;
      4'b0100 : a9 = 0;
      4'b0101 : a9 = 1081;
      4'b0110 : a9 = 0;
      4'b0111 : a9 = -1081;
      4'b1000 : a9 = 0;
      4'b1001 : a9 = 2769;
      4'b1010 : a9 = 0;
      4'b1011 : a9 = -2769;
      4'b1100 : a9 = 0;
      4'b1101 : a9 = 4172;
      4'b1110 : a9 = 0;
      4'b1111 : a9 = -4172;
    endcase

    a10 = 0;
    case ({STAGE[2:1], INPUT[21:20]})
      4'b0000 : a10 = 0;
      4'b0001 : a10 = 225;
      4'b0010 : a10 = 0;
      4'b0011 : a10 = -225;
      4'b0100 : a10 = 0;
      4'b0101 : a10 = -274;
      4'b0110 : a10 = 0;
      4'b0111 : a10 = 274;
      4'b1000 : a10 = 0;
      4'b1001 : a10 = -782;
      4'b1010 : a10 = 0;
      4'b1011 : a10 = 782;
      4'b1100 : a10 = 0;
      4'b1101 : a10 = -885;
      4'b1110 : a10 = 0;
      4'b1111 : a10 = 885;
    endcase

    a11 = 0;
    case ({STAGE[2:1], INPUT[23:22]})
      4'b0000 : a11 = 0;
      4'b0001 : a11 = -169;
      4'b0010 : a11 = 0;
      4'b0011 : a11 = 169;
      4'b0100 : a11 = 0;
      4'b0101 : a11 = 52;
      4'b0110 : a11 = 0;
      4'b0111 : a11 = -52;
      4'b1000 : a11 = 0;
      4'b1001 : a11 = 325;
      4'b1010 : a11 = 0;
      4'b1011 : a11 = -325;
      4'b1100 : a11 = 0;
      4'b1101 : a11 = 437;
      4'b1110 : a11 = 0;
      4'b1111 : a11 = -437;
    endcase

    a12 = 0;
    case ({STAGE[2:1], INPUT[25:24]})
      4'b0000 : a12 = 0;
      4'b0001 : a12 = 107;
      4'b0010 : a12 = 0;
      4'b0011 : a12 = -107;
      4'b0100 : a12 = 0;
      4'b0101 : a12 = 29;
      4'b0110 : a12 = 0;
      4'b0111 : a12 = -29;
      4'b1000 : a12 = 0;
      4'b1001 : a12 = -115;
      4'b1010 : a12 = 0;
      4'b1011 : a12 = 115;
      4'b1100 : a12 = 0;
      4'b1101 : a12 = -218;
      4'b1110 : a12 = 0;
      4'b1111 : a12 = 218;
    endcase

    a13 = 0;
    case ({STAGE[2:1], INPUT[27:26]})
      4'b0000 : a13 = 0;
      4'b0001 : a13 = -51;
      4'b0010 : a13 = 0;
      4'b0011 : a13 = 51;
      4'b0100 : a13 = 0;
      4'b0101 : a13 = -48;
      4'b0110 : a13 = 0;
      4'b0111 : a13 = 48;
      4'b1000 : a13 = 0;
      4'b1001 : a13 = 10;
      4'b1010 : a13 = 0;
      4'b1011 : a13 = -10;
      4'b1100 : a13 = 0;
      4'b1101 : a13 = 86;
      4'b1110 : a13 = 0;
      4'b1111 : a13 = -86;
    endcase

    a14 = 0;
    case ({STAGE[2:1], INPUT[29:28]})
      4'b0000 : a14 = 0;
      4'b0001 : a14 = 8;
      4'b0010 : a14 = 0;
      4'b0011 : a14 = -8;
      4'b0100 : a14 = 0;
      4'b0101 : a14 = 38;
      4'b0110 : a14 = 0;
      4'b0111 : a14 = -38;
      4'b1000 : a14 = 0;
      4'b1001 : a14 = 32;
      4'b1010 : a14 = 0;
      4'b1011 : a14 = -32;
      4'b1100 : a14 = 0;
      4'b1101 : a14 = -9;
      4'b1110 : a14 = 0;
      4'b1111 : a14 = 9;
    endcase

    a15 = 0;
    case ({STAGE[2:1], INPUT[31:30]})
      4'b0000 : a15 = 0;
      4'b0001 : a15 = 15;
      4'b0010 : a15 = 0;
      4'b0011 : a15 = -15;
      4'b0100 : a15 = 0;
      4'b0101 : a15 = -16;
      4'b0110 : a15 = 0;
      4'b0111 : a15 = 16;
      4'b1000 : a15 = 0;
      4'b1001 : a15 = -37;
      4'b1010 : a15 = 0;
      4'b1011 : a15 = 37;
      4'b1100 : a15 = 0;
      4'b1101 : a15 = -26;
      4'b1110 : a15 = 0;
      4'b1111 : a15 = 26;
    endcase

    a16 = 0;
    case ({STAGE[2:1], INPUT[33:32]})
      4'b0000 : a16 = 0;
      4'b0001 : a16 = -23;
      4'b0010 : a16 = 0;
      4'b0011 : a16 = 23;
      4'b0100 : a16 = 0;
      4'b0101 : a16 = -2;
      4'b0110 : a16 = 0;
      4'b0111 : a16 = 2;
      4'b1000 : a16 = 0;
      4'b1001 : a16 = 23;
      4'b1010 : a16 = 0;
      4'b1011 : a16 = -23;
      4'b1100 : a16 = 0;
      4'b1101 : a16 = 33;
      4'b1110 : a16 = 0;
      4'b1111 : a16 = -33;
    endcase

  end

  assign sum = a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14 + a15 + a16;

  always @(posedge CLK)
  begin
  	if (STAGE[0] == 0 && ENABLE)
  	begin
  	  result_i <= sum[13:1];
  	end
  	else if (STAGE[0] == 1 && ENABLE)
    begin
  	  result_q <= sum[13:1];
  	end
  end

endmodule
