module filter16(
  input CLK,
  input ENABLE,
  input [4:0] STAGE,//should be parametrized size 
  input [65:0] INPUT_I,//should be parametrized size 
  input [65:0] INPUT_Q,//should be parametrized size 
  output [12:0] OUTPUT_I,
  output [12:0] OUTPUT_Q
);

  wire [13:0] sum;
  reg signed [12:0] result_i = 0;
  reg signed [12:0] result_q = 0;

  assign OUTPUT_I = result_i;
  assign OUTPUT_Q = result_q;

  wire [65:0] INPUT;//should be parametrized size 

  assign INPUT = STAGE[0] ? INPUT_Q : INPUT_I;

reg [13:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31, a32;

always @ (STAGE or INPUT) 
begin
  case ({STAGE[4:1], INPUT[1:0]})
    6'b000001 : a0 = 2; 
    6'b000011 : a0 = -2;
    default : a0 = 0;
  endcase

  case ({STAGE[4:1], INPUT[3:2]})
    6'b000001 : a1 = -5;
    6'b000011 : a1 = 5;
    6'b000101 : a1 = -5;
    6'b000111 : a1 = 5;
    6'b001001 : a1 = -5;
    6'b001011 : a1 = 5;
    6'b001101 : a1 = -4;
    6'b001111 : a1 = 4;
    6'b010001 : a1 = -3;
    6'b010011 : a1 = 3;
    6'b010101 : a1 = -2;
    6'b010111 : a1 = 2;
    6'b011001 : a1 = -1;
    6'b011011 : a1 = 1;
    6'b100001 : a1 = 1;
    6'b100011 : a1 = -1;
    6'b100101 : a1 = 2;
    6'b100111 : a1 = -2;
    6'b101001 : a1 = 3;
    6'b101011 : a1 = -3;
    6'b101101 : a1 = 4;
    6'b101111 : a1 = -4;
    6'b110001 : a1 = 4;
    6'b110011 : a1 = -4;
    6'b110101 : a1 = 4;
    6'b110111 : a1 = -4;
    6'b111001 : a1 = 4;
    6'b111011 : a1 = -4;
    6'b111101 : a1 = 3;
    6'b111111 : a1 = -3;
    default : a1 = 0;
  endcase

  case ({STAGE[4:1], INPUT[5:4]})
    6'b000001 : a2 = 2;
    6'b000011 : a2 = -2;
    6'b000101 : a2 = 3;
    6'b000111 : a2 = -3;
    6'b001001 : a2 = 5;
    6'b001011 : a2 = -5;
    6'b001101 : a2 = 5;
    6'b001111 : a2 = -5;
    6'b010001 : a2 = 6;
    6'b010011 : a2 = -6;
    6'b010101 : a2 = 6;
    6'b010111 : a2 = -6;
    6'b011001 : a2 = 5;
    6'b011011 : a2 = -5;
    6'b011101 : a2 = 4;
    6'b011111 : a2 = -4;
    6'b100001 : a2 = 3;
    6'b100011 : a2 = -3;
    6'b100101 : a2 = 2;
    6'b100111 : a2 = -2;
    6'b101001 : a2 = 1;
    6'b101011 : a2 = -1;
    6'b110001 : a2 = -1;
    6'b110011 : a2 = 1;
    6'b110101 : a2 = -3;
    6'b110111 : a2 = 3;
    6'b111001 : a2 = -4;
    6'b111011 : a2 = 4;
    6'b111101 : a2 = -4;
    6'b111111 : a2 = 4;
    default : a2 = 0;
  endcase

  case ({STAGE[4:1], INPUT[7:6]})
    6'b000001 : a3 = 4;
    6'b000011 : a3 = -4;
    6'b000101 : a3 = 2;
    6'b000111 : a3 = -2;
    6'b001101 : a3 = -1;
    6'b001111 : a3 = 1;
    6'b010001 : a3 = -2;
    6'b010011 : a3 = 2;
    6'b010101 : a3 = -4;
    6'b010111 : a3 = 4;
    6'b011001 : a3 = -5;
    6'b011011 : a3 = 5;
    6'b011101 : a3 = -6;
    6'b011111 : a3 = 6;
    6'b100001 : a3 = -6;
    6'b100011 : a3 = 6;
    6'b100101 : a3 = -6;
    6'b100111 : a3 = 6;
    6'b101001 : a3 = -5;
    6'b101011 : a3 = 5;
    6'b101101 : a3 = -4;
    6'b101111 : a3 = 4;
    6'b110001 : a3 = -3;
    6'b110011 : a3 = 3;
    6'b110101 : a3 = -2;
    6'b110111 : a3 = 2;
    6'b111101 : a3 = 1;
    6'b111111 : a3 = -1;
    default : a3 = 0;
  endcase

  case ({STAGE[4:1], INPUT[9:8]})
    6'b000001 : a4 = -8;
    6'b000011 : a4 = 8;
    6'b000101 : a4 = -8;
    6'b000111 : a4 = 8;
    6'b001001 : a4 = -7;
    6'b001011 : a4 = 7;
    6'b001101 : a4 = -6;
    6'b001111 : a4 = 6;
    6'b010001 : a4 = -5;
    6'b010011 : a4 = 5;
    6'b010101 : a4 = -3;
    6'b010111 : a4 = 3;
    6'b011001 : a4 = -1;
    6'b011011 : a4 = 1;
    6'b100001 : a4 = 2;
    6'b100011 : a4 = -2;
    6'b100101 : a4 = 4;
    6'b100111 : a4 = -4;
    6'b101001 : a4 = 5;
    6'b101011 : a4 = -5;
    6'b101101 : a4 = 6;
    6'b101111 : a4 = -6;
    6'b110001 : a4 = 6;
    6'b110011 : a4 = -6;
    6'b110101 : a4 = 6;
    6'b110111 : a4 = -6;
    6'b111001 : a4 = 6;
    6'b111011 : a4 = -6;
    6'b111101 : a4 = 5;
    6'b111111 : a4 = -5;
    default : a4 = 0;
  endcase

  case ({STAGE[4:1], INPUT[11:10]})
    6'b000001 : a5 = 4;
    6'b000011 : a5 = -4;
    6'b000101 : a5 = 6;
    6'b000111 : a5 = -6;
    6'b001001 : a5 = 8;
    6'b001011 : a5 = -8;
    6'b001101 : a5 = 9;
    6'b001111 : a5 = -9;
    6'b010001 : a5 = 10;
    6'b010011 : a5 = -10;
    6'b010101 : a5 = 9;
    6'b010111 : a5 = -9;
    6'b011001 : a5 = 9;
    6'b011011 : a5 = -9;
    6'b011101 : a5 = 7;
    6'b011111 : a5 = -7;
    6'b100001 : a5 = 5;
    6'b100011 : a5 = -5;
    6'b100101 : a5 = 3;
    6'b100111 : a5 = -3;
    6'b101001 : a5 = 1;
    6'b101011 : a5 = -1;
    6'b110001 : a5 = -3;
    6'b110011 : a5 = 3;
    6'b110101 : a5 = -5;
    6'b110111 : a5 = 5;
    6'b111001 : a5 = -6;
    6'b111011 : a5 = 6;
    6'b111101 : a5 = -7;
    6'b111111 : a5 = 7;
    default : a5 = 0;
  endcase

  case ({STAGE[4:1], INPUT[13:12]})
    6'b000001 : a6 = 6;
    6'b000011 : a6 = -6;
    6'b000101 : a6 = 3;
    6'b000111 : a6 = -3;
    6'b001101 : a6 = -2;
    6'b001111 : a6 = 2;
    6'b010001 : a6 = -4;
    6'b010011 : a6 = 4;
    6'b010101 : a6 = -7;
    6'b010111 : a6 = 7;
    6'b011001 : a6 = -9;
    6'b011011 : a6 = 9;
    6'b011101 : a6 = -10;
    6'b011111 : a6 = 10;
    6'b100001 : a6 = -10;
    6'b100011 : a6 = 10;
    6'b100101 : a6 = -10;
    6'b100111 : a6 = 10;
    6'b101001 : a6 = -9;
    6'b101011 : a6 = 9;
    6'b101101 : a6 = -7;
    6'b101111 : a6 = 7;
    6'b110001 : a6 = -5;
    6'b110011 : a6 = 5;
    6'b110101 : a6 = -3;
    6'b110111 : a6 = 3;
    6'b111101 : a6 = 2;
    6'b111111 : a6 = -2;
    default : a6 = 0;
  endcase

  case ({STAGE[4:1], INPUT[15:14]})
    6'b000001 : a7 = -14;
    6'b000011 : a7 = 14;
    6'b000101 : a7 = -14;
    6'b000111 : a7 = 14;
    6'b001001 : a7 = -13;
    6'b001011 : a7 = 13;
    6'b001101 : a7 = -11;
    6'b001111 : a7 = 11;
    6'b010001 : a7 = -8;
    6'b010011 : a7 = 8;
    6'b010101 : a7 = -5;
    6'b010111 : a7 = 5;
    6'b011001 : a7 = -2;
    6'b011011 : a7 = 2;
    6'b011101 : a7 = 1;
    6'b011111 : a7 = -1;
    6'b100001 : a7 = 4;
    6'b100011 : a7 = -4;
    6'b100101 : a7 = 7;
    6'b100111 : a7 = -7;
    6'b101001 : a7 = 9;
    6'b101011 : a7 = -9;
    6'b101101 : a7 = 10;
    6'b101111 : a7 = -10;
    6'b110001 : a7 = 11;
    6'b110011 : a7 = -11;
    6'b110101 : a7 = 11;
    6'b110111 : a7 = -11;
    6'b111001 : a7 = 10;
    6'b111011 : a7 = -10;
    6'b111101 : a7 = 8;
    6'b111111 : a7 = -8;
    default : a7 = 0;
  endcase

  case ({STAGE[4:1], INPUT[17:16]})
    6'b000001 : a8 = 9;
    6'b000011 : a8 = -9;
    6'b000101 : a8 = 13;
    6'b000111 : a8 = -13;
    6'b001001 : a8 = 16;
    6'b001011 : a8 = -16;
    6'b001101 : a8 = 18;
    6'b001111 : a8 = -18;
    6'b010001 : a8 = 19;
    6'b010011 : a8 = -19;
    6'b010101 : a8 = 18;
    6'b010111 : a8 = -18;
    6'b011001 : a8 = 17;
    6'b011011 : a8 = -17;
    6'b011101 : a8 = 14;
    6'b011111 : a8 = -14;
    6'b100001 : a8 = 10;
    6'b100011 : a8 = -10;
    6'b100101 : a8 = 6;
    6'b100111 : a8 = -6;
    6'b101001 : a8 = 2;
    6'b101011 : a8 = -2;
    6'b101101 : a8 = -1;
    6'b101111 : a8 = 1;
    6'b110001 : a8 = -6;
    6'b110011 : a8 = 6;
    6'b110101 : a8 = -9;
    6'b110111 : a8 = 9;
    6'b111001 : a8 = -12;
    6'b111011 : a8 = 12;
    6'b111101 : a8 = -14;
    6'b111111 : a8 = 14;
    default : a8 = 0;
  endcase

  case ({STAGE[4:1], INPUT[19:18]})
    6'b000001 : a9 = 11;
    6'b000011 : a9 = -11;
    6'b000101 : a9 = 6;
    6'b000111 : a9 = -6;
    6'b001101 : a9 = -5;
    6'b001111 : a9 = 5;
    6'b010001 : a9 = -11;
    6'b010011 : a9 = 11;
    6'b010101 : a9 = -15;
    6'b010111 : a9 = 15;
    6'b011001 : a9 = -18;
    6'b011011 : a9 = 18;
    6'b011101 : a9 = -20;
    6'b011111 : a9 = 20;
    6'b100001 : a9 = -21;
    6'b100011 : a9 = 21;
    6'b100101 : a9 = -20;
    6'b100111 : a9 = 20;
    6'b101001 : a9 = -18;
    6'b101011 : a9 = 18;
    6'b101101 : a9 = -14;
    6'b101111 : a9 = 14;
    6'b110001 : a9 = -10;
    6'b110011 : a9 = 10;
    6'b110101 : a9 = -5;
    6'b110111 : a9 = 5;
    6'b111101 : a9 = 4;
    6'b111111 : a9 = -4;
    default : a9 = 0;
  endcase

  case ({STAGE[4:1], INPUT[21:20]})
    6'b000001 : a10 = -33;
    6'b000011 : a10 = 33;
    6'b000101 : a10 = -33;
    6'b000111 : a10 = 33;
    6'b001001 : a10 = -30;
    6'b001011 : a10 = 30;
    6'b001101 : a10 = -25;
    6'b001111 : a10 = 25;
    6'b010001 : a10 = -19;
    6'b010011 : a10 = 19;
    6'b010101 : a10 = -12;
    6'b010111 : a10 = 12;
    6'b011001 : a10 = -4;
    6'b011011 : a10 = 4;
    6'b011101 : a10 = 2;
    6'b011111 : a10 = -2;
    6'b100001 : a10 = 9;
    6'b100011 : a10 = -9;
    6'b100101 : a10 = 15;
    6'b100111 : a10 = -15;
    6'b101001 : a10 = 19;
    6'b101011 : a10 = -19;
    6'b101101 : a10 = 22;
    6'b101111 : a10 = -22;
    6'b110001 : a10 = 23;
    6'b110011 : a10 = -23;
    6'b110101 : a10 = 22;
    6'b110111 : a10 = -22;
    6'b111001 : a10 = 20;
    6'b111011 : a10 = -20;
    6'b111101 : a10 = 16;
    6'b111111 : a10 = -16;
    default : a10 = 0;
  endcase

  case ({STAGE[4:1], INPUT[23:22]})
    6'b000001 : a11 = 28;
    6'b000011 : a11 = -28;
    6'b000101 : a11 = 38;
    6'b000111 : a11 = -38;
    6'b001001 : a11 = 45;
    6'b001011 : a11 = -45;
    6'b001101 : a11 = 49;
    6'b001111 : a11 = -49;
    6'b010001 : a11 = 50;
    6'b010011 : a11 = -50;
    6'b010101 : a11 = 48;
    6'b010111 : a11 = -48;
    6'b011001 : a11 = 43;
    6'b011011 : a11 = -43;
    6'b011101 : a11 = 35;
    6'b011111 : a11 = -35;
    6'b100001 : a11 = 26;
    6'b100011 : a11 = -26;
    6'b100101 : a11 = 16;
    6'b100111 : a11 = -16;
    6'b101001 : a11 = 5;
    6'b101011 : a11 = -5;
    6'b101101 : a11 = -4;
    6'b101111 : a11 = 4;
    6'b110001 : a11 = -14;
    6'b110011 : a11 = 14;
    6'b110101 : a11 = -22;
    6'b110111 : a11 = 22;
    6'b111001 : a11 = -28;
    6'b111011 : a11 = 28;
    6'b111101 : a11 = -32;
    6'b111111 : a11 = 32;
    default : a11 = 0;
  endcase

  case ({STAGE[4:1], INPUT[25:24]})
    6'b000001 : a12 = 29;
    6'b000011 : a12 = -29;
    6'b000101 : a12 = 11;
    6'b000111 : a12 = -11;
    6'b001001 : a12 = -5;
    6'b001011 : a12 = 5;
    6'b001101 : a12 = -22;
    6'b001111 : a12 = 22;
    6'b010001 : a12 = -37;
    6'b010011 : a12 = 37;
    6'b010101 : a12 = -48;
    6'b010111 : a12 = 48;
    6'b011001 : a12 = -56;
    6'b011011 : a12 = 56;
    6'b011101 : a12 = -60;
    6'b011111 : a12 = 60;
    6'b100001 : a12 = -60;
    6'b100011 : a12 = 60;
    6'b100101 : a12 = -56;
    6'b100111 : a12 = 56;
    6'b101001 : a12 = -48;
    6'b101011 : a12 = 48;
    6'b101101 : a12 = -37;
    6'b101111 : a12 = 37;
    6'b110001 : a12 = -24;
    6'b110011 : a12 = 24;
    6'b110101 : a12 = -10;
    6'b110111 : a12 = 10;
    6'b111001 : a12 = 3;
    6'b111011 : a12 = -3;
    6'b111101 : a12 = 16;
    6'b111111 : a12 = -16;
    default : a12 = 0;
  endcase

  case ({STAGE[4:1], INPUT[27:26]})
    6'b000001 : a13 = -143;
    6'b000011 : a13 = 143;
    6'b000101 : a13 = -137;
    6'b000111 : a13 = 137;
    6'b001001 : a13 = -123;
    6'b001011 : a13 = 123;
    6'b001101 : a13 = -103;
    6'b001111 : a13 = 103;
    6'b010001 : a13 = -78;
    6'b010011 : a13 = 78;
    6'b010101 : a13 = -50;
    6'b010111 : a13 = 50;
    6'b011001 : a13 = -22;
    6'b011011 : a13 = 22;
    6'b011101 : a13 = 4;
    6'b011111 : a13 = -4;
    6'b100001 : a13 = 28;
    6'b100011 : a13 = -28;
    6'b100101 : a13 = 47;
    6'b100111 : a13 = -47;
    6'b101001 : a13 = 61;
    6'b101011 : a13 = -61;
    6'b101101 : a13 = 68;
    6'b101111 : a13 = -68;
    6'b110001 : a13 = 70;
    6'b110011 : a13 = -70;
    6'b110101 : a13 = 66;
    6'b110111 : a13 = -66;
    6'b111001 : a13 = 57;
    6'b111011 : a13 = -57;
    6'b111101 : a13 = 44;
    6'b111111 : a13 = -44;
    default : a13 = 0;
  endcase

  case ({STAGE[4:1], INPUT[29:28]})
    6'b000001 : a14 = 284;
    6'b000011 : a14 = -284;
    6'b000101 : a14 = 336;
    6'b000111 : a14 = -336;
    6'b001001 : a14 = 364;
    6'b001011 : a14 = -364;
    6'b001101 : a14 = 370;
    6'b001111 : a14 = -370;
    6'b010001 : a14 = 356;
    6'b010011 : a14 = -356;
    6'b010101 : a14 = 324;
    6'b010111 : a14 = -324;
    6'b011001 : a14 = 279;
    6'b011011 : a14 = -279;
    6'b011101 : a14 = 224;
    6'b011111 : a14 = -224;
    6'b100001 : a14 = 164;
    6'b100011 : a14 = -164;
    6'b100101 : a14 = 102;
    6'b100111 : a14 = -102;
    6'b101001 : a14 = 42;
    6'b101011 : a14 = -42;
    6'b101101 : a14 = -11;
    6'b101111 : a14 = 11;
    6'b110001 : a14 = -58;
    6'b110011 : a14 = 58;
    6'b110101 : a14 = -96;
    6'b110111 : a14 = 96;
    6'b111001 : a14 = -122;
    6'b111011 : a14 = 122;
    6'b111101 : a14 = -138;
    6'b111111 : a14 = 138;
    default : a14 = 0;
  endcase

  case ({STAGE[4:1], INPUT[31:30]})
    6'b000001 : a15 = -401;
    6'b000011 : a15 = 401;
    6'b000101 : a15 = -627;
    6'b000111 : a15 = 627;
    6'b001001 : a15 = -793;
    6'b001011 : a15 = 793;
    6'b001101 : a15 = -899;
    6'b001111 : a15 = 899;
    6'b010001 : a15 = -949;
    6'b010011 : a15 = 949;
    6'b010101 : a15 = -948;
    6'b010111 : a15 = 948;
    6'b011001 : a15 = -902;
    6'b011011 : a15 = 902;
    6'b011101 : a15 = -819;
    6'b011111 : a15 = 819;
    6'b100001 : a15 = -708;
    6'b100011 : a15 = 708;
    6'b100101 : a15 = -575;
    6'b100111 : a15 = 575;
    6'b101001 : a15 = -431;
    6'b101011 : a15 = 431;
    6'b101101 : a15 = -284;
    6'b101111 : a15 = 284;
    6'b110001 : a15 = -140;
    6'b110011 : a15 = 140;
    6'b110101 : a15 = -7;
    6'b110111 : a15 = 7;
    6'b111001 : a15 = 110;
    6'b111011 : a15 = -110;
    6'b111101 : a15 = 208;
    6'b111111 : a15 = -208;
    default : a15 = 0;
  endcase

  case ({STAGE[4:1], INPUT[33:32]})
    6'b000001 : a16 = 5408;
    6'b000011 : a16 = -5408;
    6'b000101 : a16 = 5364;
    6'b000111 : a16 = -5364;
    6'b001001 : a16 = 5234;
    6'b001011 : a16 = -5234;
    6'b001101 : a16 = 5022;
    6'b001111 : a16 = -5022;
    6'b010001 : a16 = 4735;
    6'b010011 : a16 = -4735;
    6'b010101 : a16 = 4380;
    6'b010111 : a16 = -4380;
    6'b011001 : a16 = 3970;
    6'b011011 : a16 = -3970;
    6'b011101 : a16 = 3515;
    6'b011111 : a16 = -3515;
    6'b100001 : a16 = 3030;
    6'b100011 : a16 = -3030;
    6'b100101 : a16 = 2528;
    6'b100111 : a16 = -2528;
    6'b101001 : a16 = 2024;
    6'b101011 : a16 = -2024;
    6'b101101 : a16 = 1529;
    6'b101111 : a16 = -1529;
    6'b110001 : a16 = 1058;
    6'b110011 : a16 = -1058;
    6'b110101 : a16 = 620;
    6'b110111 : a16 = -620;
    6'b111001 : a16 = 226;
    6'b111011 : a16 = -226;
    6'b111101 : a16 = -115;
    6'b111111 : a16 = 115;
    default : a16 = 0;
  endcase

  case ({STAGE[4:1], INPUT[35:34]})
    6'b000001 : a17 = -401;
    6'b000011 : a17 = 401;
    6'b000101 : a17 = -115;
    6'b000111 : a17 = 115;
    6'b001001 : a17 = 226;
    6'b001011 : a17 = -226;
    6'b001101 : a17 = 620;
    6'b001111 : a17 = -620;
    6'b010001 : a17 = 1058;
    6'b010011 : a17 = -1058;
    6'b010101 : a17 = 1529;
    6'b010111 : a17 = -1529;
    6'b011001 : a17 = 2024;
    6'b011011 : a17 = -2024;
    6'b011101 : a17 = 2528;
    6'b011111 : a17 = -2528;
    6'b100001 : a17 = 3030;
    6'b100011 : a17 = -3030;
    6'b100101 : a17 = 3515;
    6'b100111 : a17 = -3515;
    6'b101001 : a17 = 3970;
    6'b101011 : a17 = -3970;
    6'b101101 : a17 = 4380;
    6'b101111 : a17 = -4380;
    6'b110001 : a17 = 4735;
    6'b110011 : a17 = -4735;
    6'b110101 : a17 = 5022;
    6'b110111 : a17 = -5022;
    6'b111001 : a17 = 5234;
    6'b111011 : a17 = -5234;
    6'b111101 : a17 = 5364;
    6'b111111 : a17 = -5364;
    default : a17 = 0;
  endcase

  case ({STAGE[4:1], INPUT[37:36]})
    6'b000001 : a18 = 284;
    6'b000011 : a18 = -284;
    6'b000101 : a18 = 208;
    6'b000111 : a18 = -208;
    6'b001001 : a18 = 110;
    6'b001011 : a18 = -110;
    6'b001101 : a18 = -7;
    6'b001111 : a18 = 7;
    6'b010001 : a18 = -140;
    6'b010011 : a18 = 140;
    6'b010101 : a18 = -284;
    6'b010111 : a18 = 284;
    6'b011001 : a18 = -431;
    6'b011011 : a18 = 431;
    6'b011101 : a18 = -575;
    6'b011111 : a18 = 575;
    6'b100001 : a18 = -708;
    6'b100011 : a18 = 708;
    6'b100101 : a18 = -819;
    6'b100111 : a18 = 819;
    6'b101001 : a18 = -902;
    6'b101011 : a18 = 902;
    6'b101101 : a18 = -948;
    6'b101111 : a18 = 948;
    6'b110001 : a18 = -949;
    6'b110011 : a18 = 949;
    6'b110101 : a18 = -899;
    6'b110111 : a18 = 899;
    6'b111001 : a18 = -793;
    6'b111011 : a18 = 793;
    6'b111101 : a18 = -627;
    6'b111111 : a18 = 627;
    default : a18 = 0;
  endcase

  case ({STAGE[4:1], INPUT[39:38]})
    6'b000001 : a19 = -143;
    6'b000011 : a19 = 143;
    6'b000101 : a19 = -138;
    6'b000111 : a19 = 138;
    6'b001001 : a19 = -122;
    6'b001011 : a19 = 122;
    6'b001101 : a19 = -96;
    6'b001111 : a19 = 96;
    6'b010001 : a19 = -58;
    6'b010011 : a19 = 58;
    6'b010101 : a19 = -11;
    6'b010111 : a19 = 11;
    6'b011001 : a19 = 42;
    6'b011011 : a19 = -42;
    6'b011101 : a19 = 102;
    6'b011111 : a19 = -102;
    6'b100001 : a19 = 164;
    6'b100011 : a19 = -164;
    6'b100101 : a19 = 224;
    6'b100111 : a19 = -224;
    6'b101001 : a19 = 279;
    6'b101011 : a19 = -279;
    6'b101101 : a19 = 324;
    6'b101111 : a19 = -324;
    6'b110001 : a19 = 356;
    6'b110011 : a19 = -356;
    6'b110101 : a19 = 370;
    6'b110111 : a19 = -370;
    6'b111001 : a19 = 364;
    6'b111011 : a19 = -364;
    6'b111101 : a19 = 336;
    6'b111111 : a19 = -336;
    default : a19 = 0;
  endcase

  case ({STAGE[4:1], INPUT[41:40]})
    6'b000001 : a20 = 29;
    6'b000011 : a20 = -29;
    6'b000101 : a20 = 44;
    6'b000111 : a20 = -44;
    6'b001001 : a20 = 57;
    6'b001011 : a20 = -57;
    6'b001101 : a20 = 66;
    6'b001111 : a20 = -66;
    6'b010001 : a20 = 70;
    6'b010011 : a20 = -70;
    6'b010101 : a20 = 68;
    6'b010111 : a20 = -68;
    6'b011001 : a20 = 61;
    6'b011011 : a20 = -61;
    6'b011101 : a20 = 47;
    6'b011111 : a20 = -47;
    6'b100001 : a20 = 28;
    6'b100011 : a20 = -28;
    6'b100101 : a20 = 4;
    6'b100111 : a20 = -4;
    6'b101001 : a20 = -22;
    6'b101011 : a20 = 22;
    6'b101101 : a20 = -50;
    6'b101111 : a20 = 50;
    6'b110001 : a20 = -78;
    6'b110011 : a20 = 78;
    6'b110101 : a20 = -103;
    6'b110111 : a20 = 103;
    6'b111001 : a20 = -123;
    6'b111011 : a20 = 123;
    6'b111101 : a20 = -137;
    6'b111111 : a20 = 137;
    default : a20 = 0;
  endcase

  case ({STAGE[4:1], INPUT[43:42]})
    6'b000001 : a21 = 28;
    6'b000011 : a21 = -28;
    6'b000101 : a21 = 16;
    6'b000111 : a21 = -16;
    6'b001001 : a21 = 3;
    6'b001011 : a21 = -3;
    6'b001101 : a21 = -10;
    6'b001111 : a21 = 10;
    6'b010001 : a21 = -24;
    6'b010011 : a21 = 24;
    6'b010101 : a21 = -37;
    6'b010111 : a21 = 37;
    6'b011001 : a21 = -48;
    6'b011011 : a21 = 48;
    6'b011101 : a21 = -56;
    6'b011111 : a21 = 56;
    6'b100001 : a21 = -60;
    6'b100011 : a21 = 60;
    6'b100101 : a21 = -60;
    6'b100111 : a21 = 60;
    6'b101001 : a21 = -56;
    6'b101011 : a21 = 56;
    6'b101101 : a21 = -48;
    6'b101111 : a21 = 48;
    6'b110001 : a21 = -37;
    6'b110011 : a21 = 37;
    6'b110101 : a21 = -22;
    6'b110111 : a21 = 22;
    6'b111001 : a21 = -5;
    6'b111011 : a21 = 5;
    6'b111101 : a21 = 11;
    6'b111111 : a21 = -11;
    default : a21 = 0;
  endcase

  case ({STAGE[4:1], INPUT[45:44]})
    6'b000001 : a22 = -33;
    6'b000011 : a22 = 33;
    6'b000101 : a22 = -32;
    6'b000111 : a22 = 32;
    6'b001001 : a22 = -28;
    6'b001011 : a22 = 28;
    6'b001101 : a22 = -22;
    6'b001111 : a22 = 22;
    6'b010001 : a22 = -14;
    6'b010011 : a22 = 14;
    6'b010101 : a22 = -4;
    6'b010111 : a22 = 4;
    6'b011001 : a22 = 5;
    6'b011011 : a22 = -5;
    6'b011101 : a22 = 16;
    6'b011111 : a22 = -16;
    6'b100001 : a22 = 26;
    6'b100011 : a22 = -26;
    6'b100101 : a22 = 35;
    6'b100111 : a22 = -35;
    6'b101001 : a22 = 43;
    6'b101011 : a22 = -43;
    6'b101101 : a22 = 48;
    6'b101111 : a22 = -48;
    6'b110001 : a22 = 50;
    6'b110011 : a22 = -50;
    6'b110101 : a22 = 49;
    6'b110111 : a22 = -49;
    6'b111001 : a22 = 45;
    6'b111011 : a22 = -45;
    6'b111101 : a22 = 38;
    6'b111111 : a22 = -38;
    default : a22 = 0;
  endcase

  case ({STAGE[4:1], INPUT[47:46]})
    6'b000001 : a23 = 11;
    6'b000011 : a23 = -11;
    6'b000101 : a23 = 16;
    6'b000111 : a23 = -16;
    6'b001001 : a23 = 20;
    6'b001011 : a23 = -20;
    6'b001101 : a23 = 22;
    6'b001111 : a23 = -22;
    6'b010001 : a23 = 23;
    6'b010011 : a23 = -23;
    6'b010101 : a23 = 22;
    6'b010111 : a23 = -22;
    6'b011001 : a23 = 19;
    6'b011011 : a23 = -19;
    6'b011101 : a23 = 15;
    6'b011111 : a23 = -15;
    6'b100001 : a23 = 9;
    6'b100011 : a23 = -9;
    6'b100101 : a23 = 2;
    6'b100111 : a23 = -2;
    6'b101001 : a23 = -4;
    6'b101011 : a23 = 4;
    6'b101101 : a23 = -12;
    6'b101111 : a23 = 12;
    6'b110001 : a23 = -19;
    6'b110011 : a23 = 19;
    6'b110101 : a23 = -25;
    6'b110111 : a23 = 25;
    6'b111001 : a23 = -30;
    6'b111011 : a23 = 30;
    6'b111101 : a23 = -33;
    6'b111111 : a23 = 33;
    default : a23 = 0;
  endcase

  case ({STAGE[4:1], INPUT[49:48]})
    6'b000001 : a24 = 9;
    6'b000011 : a24 = -9;
    6'b000101 : a24 = 4;
    6'b000111 : a24 = -4;
    6'b001101 : a24 = -5;
    6'b001111 : a24 = 5;
    6'b010001 : a24 = -10;
    6'b010011 : a24 = 10;
    6'b010101 : a24 = -14;
    6'b010111 : a24 = 14;
    6'b011001 : a24 = -18;
    6'b011011 : a24 = 18;
    6'b011101 : a24 = -20;
    6'b011111 : a24 = 20;
    6'b100001 : a24 = -21;
    6'b100011 : a24 = 21;
    6'b100101 : a24 = -20;
    6'b100111 : a24 = 20;
    6'b101001 : a24 = -18;
    6'b101011 : a24 = 18;
    6'b101101 : a24 = -15;
    6'b101111 : a24 = 15;
    6'b110001 : a24 = -11;
    6'b110011 : a24 = 11;
    6'b110101 : a24 = -5;
    6'b110111 : a24 = 5;
    6'b111101 : a24 = 6;
    6'b111111 : a24 = -6;
    default : a24 = 0;
  endcase

  case ({STAGE[4:1], INPUT[51:50]})
    6'b000001 : a25 = -14;
    6'b000011 : a25 = 14;
    6'b000101 : a25 = -14;
    6'b000111 : a25 = 14;
    6'b001001 : a25 = -12;
    6'b001011 : a25 = 12;
    6'b001101 : a25 = -9;
    6'b001111 : a25 = 9;
    6'b010001 : a25 = -6;
    6'b010011 : a25 = 6;
    6'b010101 : a25 = -1;
    6'b010111 : a25 = 1;
    6'b011001 : a25 = 2;
    6'b011011 : a25 = -2;
    6'b011101 : a25 = 6;
    6'b011111 : a25 = -6;
    6'b100001 : a25 = 10;
    6'b100011 : a25 = -10;
    6'b100101 : a25 = 14;
    6'b100111 : a25 = -14;
    6'b101001 : a25 = 17;
    6'b101011 : a25 = -17;
    6'b101101 : a25 = 18;
    6'b101111 : a25 = -18;
    6'b110001 : a25 = 19;
    6'b110011 : a25 = -19;
    6'b110101 : a25 = 18;
    6'b110111 : a25 = -18;
    6'b111001 : a25 = 16;
    6'b111011 : a25 = -16;
    6'b111101 : a25 = 13;
    6'b111111 : a25 = -13;
    default : a25 = 0;
  endcase

  case ({STAGE[4:1], INPUT[53:52]})
    6'b000001 : a26 = 6;
    6'b000011 : a26 = -6;
    6'b000101 : a26 = 8;
    6'b000111 : a26 = -8;
    6'b001001 : a26 = 10;
    6'b001011 : a26 = -10;
    6'b001101 : a26 = 11;
    6'b001111 : a26 = -11;
    6'b010001 : a26 = 11;
    6'b010011 : a26 = -11;
    6'b010101 : a26 = 10;
    6'b010111 : a26 = -10;
    6'b011001 : a26 = 9;
    6'b011011 : a26 = -9;
    6'b011101 : a26 = 7;
    6'b011111 : a26 = -7;
    6'b100001 : a26 = 4;
    6'b100011 : a26 = -4;
    6'b100101 : a26 = 1;
    6'b100111 : a26 = -1;
    6'b101001 : a26 = -2;
    6'b101011 : a26 = 2;
    6'b101101 : a26 = -5;
    6'b101111 : a26 = 5;
    6'b110001 : a26 = -8;
    6'b110011 : a26 = 8;
    6'b110101 : a26 = -11;
    6'b110111 : a26 = 11;
    6'b111001 : a26 = -13;
    6'b111011 : a26 = 13;
    6'b111101 : a26 = -14;
    6'b111111 : a26 = 14;
    default : a26 = 0;
  endcase

  case ({STAGE[4:1], INPUT[55:54]})
    6'b000001 : a27 = 4;
    6'b000011 : a27 = -4;
    6'b000101 : a27 = 2;
    6'b000111 : a27 = -2;
    6'b001101 : a27 = -3;
    6'b001111 : a27 = 3;
    6'b010001 : a27 = -5;
    6'b010011 : a27 = 5;
    6'b010101 : a27 = -7;
    6'b010111 : a27 = 7;
    6'b011001 : a27 = -9;
    6'b011011 : a27 = 9;
    6'b011101 : a27 = -10;
    6'b011111 : a27 = 10;
    6'b100001 : a27 = -10;
    6'b100011 : a27 = 10;
    6'b100101 : a27 = -10;
    6'b100111 : a27 = 10;
    6'b101001 : a27 = -9;
    6'b101011 : a27 = 9;
    6'b101101 : a27 = -7;
    6'b101111 : a27 = 7;
    6'b110001 : a27 = -4;
    6'b110011 : a27 = 4;
    6'b110101 : a27 = -2;
    6'b110111 : a27 = 2;
    6'b111101 : a27 = 3;
    6'b111111 : a27 = -3;
    default : a27 = 0;
  endcase

  case ({STAGE[4:1], INPUT[57:56]})
    6'b000001 : a28 = -8;
    6'b000011 : a28 = 8;
    6'b000101 : a28 = -7;
    6'b000111 : a28 = 7;
    6'b001001 : a28 = -6;
    6'b001011 : a28 = 6;
    6'b001101 : a28 = -5;
    6'b001111 : a28 = 5;
    6'b010001 : a28 = -3;
    6'b010011 : a28 = 3;
    6'b011001 : a28 = 1;
    6'b011011 : a28 = -1;
    6'b011101 : a28 = 3;
    6'b011111 : a28 = -3;
    6'b100001 : a28 = 5;
    6'b100011 : a28 = -5;
    6'b100101 : a28 = 7;
    6'b100111 : a28 = -7;
    6'b101001 : a28 = 9;
    6'b101011 : a28 = -9;
    6'b101101 : a28 = 9;
    6'b101111 : a28 = -9;
    6'b110001 : a28 = 10;
    6'b110011 : a28 = -10;
    6'b110101 : a28 = 9;
    6'b110111 : a28 = -9;
    6'b111001 : a28 = 8;
    6'b111011 : a28 = -8;
    6'b111101 : a28 = 6;
    6'b111111 : a28 = -6;
    default : a28 = 0;
  endcase

  case ({STAGE[4:1], INPUT[59:58]})
    6'b000001 : a29 = 4;
    6'b000011 : a29 = -4;
    6'b000101 : a29 = 5;
    6'b000111 : a29 = -5;
    6'b001001 : a29 = 6;
    6'b001011 : a29 = -6;
    6'b001101 : a29 = 6;
    6'b001111 : a29 = -6;
    6'b010001 : a29 = 6;
    6'b010011 : a29 = -6;
    6'b010101 : a29 = 6;
    6'b010111 : a29 = -6;
    6'b011001 : a29 = 5;
    6'b011011 : a29 = -5;
    6'b011101 : a29 = 4;
    6'b011111 : a29 = -4;
    6'b100001 : a29 = 2;
    6'b100011 : a29 = -2;
    6'b101001 : a29 = -1;
    6'b101011 : a29 = 1;
    6'b101101 : a29 = -3;
    6'b101111 : a29 = 3;
    6'b110001 : a29 = -5;
    6'b110011 : a29 = 5;
    6'b110101 : a29 = -6;
    6'b110111 : a29 = 6;
    6'b111001 : a29 = -7;
    6'b111011 : a29 = 7;
    6'b111101 : a29 = -8;
    6'b111111 : a29 = 8;
    default : a29 = 0;
  endcase

  case ({STAGE[4:1], INPUT[61:60]})
    6'b000001 : a30 = 2;
    6'b000011 : a30 = -2;
    6'b000101 : a30 = 1;
    6'b000111 : a30 = -1;
    6'b001101 : a30 = -2;
    6'b001111 : a30 = 2;
    6'b010001 : a30 = -3;
    6'b010011 : a30 = 3;
    6'b010101 : a30 = -4;
    6'b010111 : a30 = 4;
    6'b011001 : a30 = -5;
    6'b011011 : a30 = 5;
    6'b011101 : a30 = -6;
    6'b011111 : a30 = 6;
    6'b100001 : a30 = -6;
    6'b100011 : a30 = 6;
    6'b100101 : a30 = -6;
    6'b100111 : a30 = 6;
    6'b101001 : a30 = -5;
    6'b101011 : a30 = 5;
    6'b101101 : a30 = -4;
    6'b101111 : a30 = 4;
    6'b110001 : a30 = -2;
    6'b110011 : a30 = 2;
    6'b110101 : a30 = -1;
    6'b110111 : a30 = 1;
    6'b111101 : a30 = 2;
    6'b111111 : a30 = -2;
    default : a30 = 0;
  endcase

  case ({STAGE[4:1], INPUT[63:62]})
    6'b000001 : a31 = -5;
    6'b000011 : a31 = 5;
    6'b000101 : a31 = -4;
    6'b000111 : a31 = 4;
    6'b001001 : a31 = -4;
    6'b001011 : a31 = 4;
    6'b001101 : a31 = -3;
    6'b001111 : a31 = 3;
    6'b010001 : a31 = -1;
    6'b010011 : a31 = 1;
    6'b011001 : a31 = 1;
    6'b011011 : a31 = -1;
    6'b011101 : a31 = 2;
    6'b011111 : a31 = -2;
    6'b100001 : a31 = 3;
    6'b100011 : a31 = -3;
    6'b100101 : a31 = 4;
    6'b100111 : a31 = -4;
    6'b101001 : a31 = 5;
    6'b101011 : a31 = -5;
    6'b101101 : a31 = 6;
    6'b101111 : a31 = -6;
    6'b110001 : a31 = 6;
    6'b110011 : a31 = -6;
    6'b110101 : a31 = 5;
    6'b110111 : a31 = -5;
    6'b111001 : a31 = 5;
    6'b111011 : a31 = -5;
    6'b111101 : a31 = 3;
    6'b111111 : a31 = -3;
    default : a31 = 0;
  endcase

  case ({STAGE[4:1], INPUT[65:64]})
    6'b000001 : a32 = 2;
    6'b000011 : a32 = -2;
    6'b000101 : a32 = 3;
    6'b000111 : a32 = -3;
    6'b001001 : a32 = 4;
    6'b001011 : a32 = -4;
    6'b001101 : a32 = 4;
    6'b001111 : a32 = -4;
    6'b010001 : a32 = 4;
    6'b010011 : a32 = -4;
    6'b010101 : a32 = 4;
    6'b010111 : a32 = -4;
    6'b011001 : a32 = 3;
    6'b011011 : a32 = -3;
    6'b011101 : a32 = 2;
    6'b011111 : a32 = -2;
    6'b100001 : a32 = 1;
    6'b100011 : a32 = -1;
    6'b101001 : a32 = -1;
    6'b101011 : a32 = 1;
    6'b101101 : a32 = -2;
    6'b101111 : a32 = 2;
    6'b110001 : a32 = -3;
    6'b110011 : a32 = 3;
    6'b110101 : a32 = -4;
    6'b110111 : a32 = 4;
    6'b111001 : a32 = -5;
    6'b111011 : a32 = 5;
    6'b111101 : a32 = -5;
    6'b111111 : a32 = 5;
    default : a32 = 0;
  endcase

end

assign sum =  a0  + a1  + a2  + a3  + a4  + a5  + a6  + a7  + 
              a8  + a9  + a10 + a11 + a12 + a13 + a14 + a15 +
              a16 + a17 + a18 + a19 + a20 + a21 + a22 + a23 +
              a24 + a25 + a26 + a27 + a28 + a29 + a30 + a31 + 
              a32;

always @(posedge CLK)
  begin
    if (STAGE[0] == 0 && ENABLE)
    begin
      result_i <= sum[13:1];
      //$monitor ("%t Display OUTPUT_I : %h", $time, result_i);
    end
    else if (STAGE[0] == 1 && ENABLE)
    begin
      result_q <= sum[13:1];
     // $monitor ("%t Display OUTPUT_Q : %h", $time, result_q);
    end
  end

endmodule
