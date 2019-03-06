module filter8(
  input CLK,
  input ENABLE,
  input [3:0] STAGE,//should be parametrized size 
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

  a0 = 0;
  case ({STAGE[3:1], INPUT[1:0]})
    5'b00000 : a0 = 0;
    5'b00001 : a0 = -3;
    5'b00010 : a0 = 0;
    5'b00011 : a0 = 3;
    5'b00100 : a0 = 0;
    5'b00101 : a0 = 0;
    5'b00110 : a0 = 0;
    5'b00111 : a0 = 0;
    5'b01000 : a0 = 0;
    5'b01001 : a0 = 0;
    5'b01010 : a0 = 0;
    5'b01011 : a0 = 0;
    5'b01100 : a0 = 0;
    5'b01101 : a0 = 0;
    5'b01110 : a0 = 0;
    5'b01111 : a0 = 0;
    5'b10000 : a0 = 0;
    5'b10001 : a0 = 0;
    5'b10010 : a0 = 0;
    5'b10011 : a0 = 0;
    5'b10100 : a0 = 0;
    5'b10101 : a0 = 0;
    5'b10110 : a0 = 0;
    5'b10111 : a0 = 0;
    5'b11000 : a0 = 0;
    5'b11001 : a0 = 0;
    5'b11010 : a0 = 0;
    5'b11011 : a0 = 0;
    5'b11100 : a0 = 0;
    5'b11101 : a0 = 0;
    5'b11110 : a0 = 0;
    5'b11111 : a0 = 0;
  endcase

  a1 = 0;
  case ({STAGE[3:1], INPUT[3:2]})
    5'b00000 : a1 = 0;
    5'b00001 : a1 = 0;
    5'b00010 : a1 = 0;
    5'b00011 : a1 = 0;
    5'b00100 : a1 = 0;
    5'b00101 : a1 = 2;
    5'b00110 : a1 = 0;
    5'b00111 : a1 = -2;
    5'b01000 : a1 = 0;
    5'b01001 : a1 = 3;
    5'b01010 : a1 = 0;
    5'b01011 : a1 = -3;
    5'b01100 : a1 = 0;
    5'b01101 : a1 = 3;
    5'b01110 : a1 = 0;
    5'b01111 : a1 = -3;
    5'b10000 : a1 = 0;
    5'b10001 : a1 = 2;
    5'b10010 : a1 = 0;
    5'b10011 : a1 = -2;
    5'b10100 : a1 = 0;
    5'b10101 : a1 = 0;
    5'b10110 : a1 = 0;
    5'b10111 : a1 = 0;
    5'b11000 : a1 = 0;
    5'b11001 : a1 = -1;
    5'b11010 : a1 = 0;
    5'b11011 : a1 = 1;
    5'b11100 : a1 = 0;
    5'b11101 : a1 = -2;
    5'b11110 : a1 = 0;
    5'b11111 : a1 = 2;
  endcase

  a2 = 0;
  case ({STAGE[3:1], INPUT[5:4]})
    5'b00000 : a2 = 0;
    5'b00001 : a2 = 4;
    5'b00010 : a2 = 0;
    5'b00011 : a2 = -4;
    5'b00100 : a2 = 0;
    5'b00101 : a2 = 3;
    5'b00110 : a2 = 0;
    5'b00111 : a2 = -3;
    5'b01000 : a2 = 0;
    5'b01001 : a2 = 1;
    5'b01010 : a2 = 0;
    5'b01011 : a2 = -1;
    5'b01100 : a2 = 0;
    5'b01101 : a2 = 0;
    5'b01110 : a2 = 0;
    5'b01111 : a2 = 0;
    5'b10000 : a2 = 0;
    5'b10001 : a2 = -2;
    5'b10010 : a2 = 0;
    5'b10011 : a2 = 2;
    5'b10100 : a2 = 0;
    5'b10101 : a2 = -3;
    5'b10110 : a2 = 0;
    5'b10111 : a2 = 3;
    5'b11000 : a2 = 0;
    5'b11001 : a2 = -3;
    5'b11010 : a2 = 0;
    5'b11011 : a2 = 3;
    5'b11100 : a2 = 0;
    5'b11101 : a2 = -2;
    5'b11110 : a2 = 0;
    5'b11111 : a2 = 2;
  endcase

  a3 = 0;
  case ({STAGE[3:1], INPUT[7:6]})
    5'b00000 : a3 = 0;
    5'b00001 : a3 = 0;
    5'b00010 : a3 = 0;
    5'b00011 : a3 = 0;
    5'b00100 : a3 = 0;
    5'b00101 : a3 = -3;
    5'b00110 : a3 = 0;
    5'b00111 : a3 = 3;
    5'b01000 : a3 = 0;
    5'b01001 : a3 = -4;
    5'b01010 : a3 = 0;
    5'b01011 : a3 = 4;
    5'b01100 : a3 = 0;
    5'b01101 : a3 = -4;
    5'b01110 : a3 = 0;
    5'b01111 : a3 = 4;
    5'b10000 : a3 = 0;
    5'b10001 : a3 = -3;
    5'b10010 : a3 = 0;
    5'b10011 : a3 = 3;
    5'b10100 : a3 = 0;
    5'b10101 : a3 = -1;
    5'b10110 : a3 = 0;
    5'b10111 : a3 = 1;
    5'b11000 : a3 = 0;
    5'b11001 : a3 = 1;
    5'b11010 : a3 = 0;
    5'b11011 : a3 = -1;
    5'b11100 : a3 = 0;
    5'b11101 : a3 = 3;
    5'b11110 : a3 = 0;
    5'b11111 : a3 = -3;
  endcase

  a4 = 0;
  case ({STAGE[3:1], INPUT[9:8]})
    5'b00000 : a4 = 0;
    5'b00001 : a4 = -6;
    5'b00010 : a4 = 0;
    5'b00011 : a4 = 6;
    5'b00100 : a4 = 0;
    5'b00101 : a4 = -5;
    5'b00110 : a4 = 0;
    5'b00111 : a4 = 5;
    5'b01000 : a4 = 0;
    5'b01001 : a4 = -2;
    5'b01010 : a4 = 0;
    5'b01011 : a4 = 2;
    5'b01100 : a4 = 0;
    5'b01101 : a4 = 0;
    5'b01110 : a4 = 0;
    5'b01111 : a4 = 0;
    5'b10000 : a4 = 0;
    5'b10001 : a4 = 3;
    5'b10010 : a4 = 0;
    5'b10011 : a4 = -3;
    5'b10100 : a4 = 0;
    5'b10101 : a4 = 5;
    5'b10110 : a4 = 0;
    5'b10111 : a4 = -5;
    5'b11000 : a4 = 0;
    5'b11001 : a4 = 4;
    5'b11010 : a4 = 0;
    5'b11011 : a4 = -4;
    5'b11100 : a4 = 0;
    5'b11101 : a4 = 2;
    5'b11110 : a4 = 0;
    5'b11111 : a4 = -2;
  endcase

  a5 = 0;
  case ({STAGE[3:1], INPUT[11:10]})
    5'b00000 : a5 = 0;
    5'b00001 : a5 = 0;
    5'b00010 : a5 = 0;
    5'b00011 : a5 = 0;
    5'b00100 : a5 = 0;
    5'b00101 : a5 = 4;
    5'b00110 : a5 = 0;
    5'b00111 : a5 = -4;
    5'b01000 : a5 = 0;
    5'b01001 : a5 = 6;
    5'b01010 : a5 = 0;
    5'b01011 : a5 = -6;
    5'b01100 : a5 = 0;
    5'b01101 : a5 = 6;
    5'b01110 : a5 = 0;
    5'b01111 : a5 = -6;
    5'b10000 : a5 = 0;
    5'b10001 : a5 = 4;
    5'b10010 : a5 = 0;
    5'b10011 : a5 = -4;
    5'b10100 : a5 = 0;
    5'b10101 : a5 = 1;
    5'b10110 : a5 = 0;
    5'b10111 : a5 = -1;
    5'b11000 : a5 = 0;
    5'b11001 : a5 = -2;
    5'b11010 : a5 = 0;
    5'b11011 : a5 = 2;
    5'b11100 : a5 = 0;
    5'b11101 : a5 = -5;
    5'b11110 : a5 = 0;
    5'b11111 : a5 = 5;
  endcase

  a6 = 0;
  case ({STAGE[3:1], INPUT[13:12]})
    5'b00000 : a6 = 0;
    5'b00001 : a6 = 8;
    5'b00010 : a6 = 0;
    5'b00011 : a6 = -8;
    5'b00100 : a6 = 0;
    5'b00101 : a6 = 7;
    5'b00110 : a6 = 0;
    5'b00111 : a6 = -7;
    5'b01000 : a6 = 0;
    5'b01001 : a6 = 3;
    5'b01010 : a6 = 0;
    5'b01011 : a6 = -3;
    5'b01100 : a6 = 0;
    5'b01101 : a6 = -1;
    5'b01110 : a6 = 0;
    5'b01111 : a6 = 1;
    5'b10000 : a6 = 0;
    5'b10001 : a6 = -5;
    5'b10010 : a6 = 0;
    5'b10011 : a6 = 5;
    5'b10100 : a6 = 0;
    5'b10101 : a6 = -7;
    5'b10110 : a6 = 0;
    5'b10111 : a6 = 7;
    5'b11000 : a6 = 0;
    5'b11001 : a6 = -6;
    5'b11010 : a6 = 0;
    5'b11011 : a6 = 6;
    5'b11100 : a6 = 0;
    5'b11101 : a6 = -3;
    5'b11110 : a6 = 0;
    5'b11111 : a6 = 3;
  endcase

  a7 = 0;
  case ({STAGE[3:1], INPUT[15:14]})
    5'b00000 : a7 = 0;
    5'b00001 : a7 = 0;
    5'b00010 : a7 = 0;
    5'b00011 : a7 = 0;
    5'b00100 : a7 = 0;
    5'b00101 : a7 = -6;
    5'b00110 : a7 = 0;
    5'b00111 : a7 = 6;
    5'b01000 : a7 = 0;
    5'b01001 : a7 = -10;
    5'b01010 : a7 = 0;
    5'b01011 : a7 = 10;
    5'b01100 : a7 = 0;
    5'b01101 : a7 = -10;
    5'b01110 : a7 = 0;
    5'b01111 : a7 = 10;
    5'b10000 : a7 = 0;
    5'b10001 : a7 = -7;
    5'b10010 : a7 = 0;
    5'b10011 : a7 = 7;
    5'b10100 : a7 = 0;
    5'b10101 : a7 = -2;
    5'b10110 : a7 = 0;
    5'b10111 : a7 = 2;
    5'b11000 : a7 = 0;
    5'b11001 : a7 = 3;
    5'b11010 : a7 = 0;
    5'b11011 : a7 = -3;
    5'b11100 : a7 = 0;
    5'b11101 : a7 = 7;
    5'b11110 : a7 = 0;
    5'b11111 : a7 = -7;
  endcase

  a8 = 0;
  case ({STAGE[3:1], INPUT[17:16]})
    5'b00000 : a8 = 0;
    5'b00001 : a8 = -13;
    5'b00010 : a8 = 0;
    5'b00011 : a8 = 13;
    5'b00100 : a8 = 0;
    5'b00101 : a8 = -11;
    5'b00110 : a8 = 0;
    5'b00111 : a8 = 11;
    5'b01000 : a8 = 0;
    5'b01001 : a8 = -5;
    5'b01010 : a8 = 0;
    5'b01011 : a8 = 5;
    5'b01100 : a8 = 0;
    5'b01101 : a8 = 2;
    5'b01110 : a8 = 0;
    5'b01111 : a8 = -2;
    5'b10000 : a8 = 0;
    5'b10001 : a8 = 8;
    5'b10010 : a8 = 0;
    5'b10011 : a8 = -8;
    5'b10100 : a8 = 0;
    5'b10101 : a8 = 11;
    5'b10110 : a8 = 0;
    5'b10111 : a8 = -11;
    5'b11000 : a8 = 0;
    5'b11001 : a8 = 10;
    5'b11010 : a8 = 0;
    5'b11011 : a8 = -10;
    5'b11100 : a8 = 0;
    5'b11101 : a8 = 5;
    5'b11110 : a8 = 0;
    5'b11111 : a8 = -5;
  endcase

  a9 = 0;
  case ({STAGE[3:1], INPUT[19:18]})
    5'b00000 : a9 = 0;
    5'b00001 : a9 = 1;
    5'b00010 : a9 = 0;
    5'b00011 : a9 = -1;
    5'b00100 : a9 = 0;
    5'b00101 : a9 = 10;
    5'b00110 : a9 = 0;
    5'b00111 : a9 = -10;
    5'b01000 : a9 = 0;
    5'b01001 : a9 = 16;
    5'b01010 : a9 = 0;
    5'b01011 : a9 = -16;
    5'b01100 : a9 = 0;
    5'b01101 : a9 = 16;
    5'b01110 : a9 = 0;
    5'b01111 : a9 = -16;
    5'b10000 : a9 = 0;
    5'b10001 : a9 = 11;
    5'b10010 : a9 = 0;
    5'b10011 : a9 = -11;
    5'b10100 : a9 = 0;
    5'b10101 : a9 = 3;
    5'b10110 : a9 = 0;
    5'b10111 : a9 = -3;
    5'b11000 : a9 = 0;
    5'b11001 : a9 = -5;
    5'b11010 : a9 = 0;
    5'b11011 : a9 = 5;
    5'b11100 : a9 = 0;
    5'b11101 : a9 = -11;
    5'b11110 : a9 = 0;
    5'b11111 : a9 = 11;
  endcase

  a10 = 0;
  case ({STAGE[3:1], INPUT[21:20]})
    5'b00000 : a10 = 0;
    5'b00001 : a10 = 24;
    5'b00010 : a10 = 0;
    5'b00011 : a10 = -24;
    5'b00100 : a10 = 0;
    5'b00101 : a10 = 19;
    5'b00110 : a10 = 0;
    5'b00111 : a10 = -19;
    5'b01000 : a10 = 0;
    5'b01001 : a10 = 9;
    5'b01010 : a10 = 0;
    5'b01011 : a10 = -9;
    5'b01100 : a10 = 0;
    5'b01101 : a10 = -3;
    5'b01110 : a10 = 0;
    5'b01111 : a10 = 3;
    5'b10000 : a10 = 0;
    5'b10001 : a10 = -13;
    5'b10010 : a10 = 0;
    5'b10011 : a10 = 13;
    5'b10100 : a10 = 0;
    5'b10101 : a10 = -18;
    5'b10110 : a10 = 0;
    5'b10111 : a10 = 18;
    5'b11000 : a10 = 0;
    5'b11001 : a10 = -16;
    5'b11010 : a10 = 0;
    5'b11011 : a10 = 16;
    5'b11100 : a10 = 0;
    5'b11101 : a10 = -9;
    5'b11110 : a10 = 0;
    5'b11111 : a10 = 9;
  endcase

  a11 = 0;
  case ({STAGE[3:1], INPUT[23:22]})
    5'b00000 : a11 = 0;
    5'b00001 : a11 = -3;
    5'b00010 : a11 = 0;
    5'b00011 : a11 = 3;
    5'b00100 : a11 = 0;
    5'b00101 : a11 = -21;
    5'b00110 : a11 = 0;
    5'b00111 : a11 = 21;
    5'b01000 : a11 = 0;
    5'b01001 : a11 = -32;
    5'b01010 : a11 = 0;
    5'b01011 : a11 = 32;
    5'b01100 : a11 = 0;
    5'b01101 : a11 = -32;
    5'b01110 : a11 = 0;
    5'b01111 : a11 = 32;
    5'b10000 : a11 = 0;
    5'b10001 : a11 = -22;
    5'b10010 : a11 = 0;
    5'b10011 : a11 = 22;
    5'b10100 : a11 = 0;
    5'b10101 : a11 = -6;
    5'b10110 : a11 = 0;
    5'b10111 : a11 = 6;
    5'b11000 : a11 = 0;
    5'b11001 : a11 = 9;
    5'b11010 : a11 = 0;
    5'b11011 : a11 = -9;
    5'b11100 : a11 = 0;
    5'b11101 : a11 = 20;
    5'b11110 : a11 = 0;
    5'b11111 : a11 = -20;
  endcase

  a12 = 0;
  case ({STAGE[3:1], INPUT[25:24]})
    5'b00000 : a12 = 0;
    5'b00001 : a12 = -55;
    5'b00010 : a12 = 0;
    5'b00011 : a12 = 55;
    5'b00100 : a12 = 0;
    5'b00101 : a12 = -44;
    5'b00110 : a12 = 0;
    5'b00111 : a12 = 44;
    5'b01000 : a12 = 0;
    5'b01001 : a12 = -21;
    5'b01010 : a12 = 0;
    5'b01011 : a12 = 21;
    5'b01100 : a12 = 0;
    5'b01101 : a12 = 6;
    5'b01110 : a12 = 0;
    5'b01111 : a12 = -6;
    5'b10000 : a12 = 0;
    5'b10001 : a12 = 27;
    5'b10010 : a12 = 0;
    5'b10011 : a12 = -27;
    5'b10100 : a12 = 0;
    5'b10101 : a12 = 37;
    5'b10110 : a12 = 0;
    5'b10111 : a12 = -37;
    5'b11000 : a12 = 0;
    5'b11001 : a12 = 32;
    5'b11010 : a12 = 0;
    5'b11011 : a12 = -32;
    5'b11100 : a12 = 0;
    5'b11101 : a12 = 16;
    5'b11110 : a12 = 0;
    5'b11111 : a12 = -16;
  endcase

  a13 = 0;
  case ({STAGE[3:1], INPUT[27:26]})
    5'b00000 : a13 = 0;
    5'b00001 : a13 = 16;
    5'b00010 : a13 = 0;
    5'b00011 : a13 = -16;
    5'b00100 : a13 = 0;
    5'b00101 : a13 = 65;
    5'b00110 : a13 = 0;
    5'b00111 : a13 = -65;
    5'b01000 : a13 = 0;
    5'b01001 : a13 = 90;
    5'b01010 : a13 = 0;
    5'b01011 : a13 = -90;
    5'b01100 : a13 = 0;
    5'b01101 : a13 = 87;
    5'b01110 : a13 = 0;
    5'b01111 : a13 = -87;
    5'b10000 : a13 = 0;
    5'b10001 : a13 = 59;
    5'b10010 : a13 = 0;
    5'b10011 : a13 = -59;
    5'b10100 : a13 = 0;
    5'b10101 : a13 = 18;
    5'b10110 : a13 = 0;
    5'b10111 : a13 = -18;
    5'b11000 : a13 = 0;
    5'b11001 : a13 = -21;
    5'b11010 : a13 = 0;
    5'b11011 : a13 = 21;
    5'b11100 : a13 = 0;
    5'b11101 : a13 = -47;
    5'b11110 : a13 = 0;
    5'b11111 : a13 = 47;
  endcase

  a14 = 0;
  case ({STAGE[3:1], INPUT[29:28]})
    5'b00000 : a14 = 0;
    5'b00001 : a14 = 234;
    5'b00010 : a14 = 0;
    5'b00011 : a14 = -234;
    5'b00100 : a14 = 0;
    5'b00101 : a14 = 180;
    5'b00110 : a14 = 0;
    5'b00111 : a14 = -180;
    5'b01000 : a14 = 0;
    5'b01001 : a14 = 85;
    5'b01010 : a14 = 0;
    5'b01011 : a14 = -85;
    5'b01100 : a14 = 0;
    5'b01101 : a14 = -12;
    5'b01110 : a14 = 0;
    5'b01111 : a14 = 12;
    5'b10000 : a14 = 0;
    5'b10001 : a14 = -82;
    5'b10010 : a14 = 0;
    5'b10011 : a14 = 82;
    5'b10100 : a14 = 0;
    5'b10101 : a14 = -108;
    5'b10110 : a14 = 0;
    5'b10111 : a14 = 108;
    5'b11000 : a14 = 0;
    5'b11001 : a14 = -90;
    5'b11010 : a14 = 0;
    5'b11011 : a14 = 90;
    5'b11100 : a14 = 0;
    5'b11101 : a14 = -42;
    5'b11110 : a14 = 0;
    5'b11111 : a14 = 42;
  endcase

  a15 = 0;
  case ({STAGE[3:1], INPUT[31:30]})
    5'b00000 : a15 = 0;
    5'b00001 : a15 = -585;
    5'b00010 : a15 = 0;
    5'b00011 : a15 = 585;
    5'b00100 : a15 = 0;
    5'b00101 : a15 = -857;
    5'b00110 : a15 = 0;
    5'b00111 : a15 = 857;
    5'b01000 : a15 = 0;
    5'b01001 : a15 = -865;
    5'b01010 : a15 = 0;
    5'b01011 : a15 = 865;
    5'b01100 : a15 = 0;
    5'b01101 : a15 = -686;
    5'b01110 : a15 = 0;
    5'b01111 : a15 = 686;
    5'b10000 : a15 = 0;
    5'b10001 : a15 = -414;
    5'b10010 : a15 = 0;
    5'b10011 : a15 = 414;
    5'b10100 : a15 = 0;
    5'b10101 : a15 = -134;
    5'b10110 : a15 = 0;
    5'b10111 : a15 = 134;
    5'b11000 : a15 = 0;
    5'b11001 : a15 = 85;
    5'b11010 : a15 = 0;
    5'b11011 : a15 = -85;
    5'b11100 : a15 = 0;
    5'b11101 : a15 = 209;
    5'b11110 : a15 = 0;
    5'b11111 : a15 = -209;
  endcase

  a16 = 0;
  case ({STAGE[3:1], INPUT[33:32]})
    5'b00000 : a16 = 0;
    5'b00001 : a16 = 6272;
    5'b00010 : a16 = 0;
    5'b00011 : a16 = -6272;
    5'b00100 : a16 = 0;
    5'b00101 : a16 = 6040;
    5'b00110 : a16 = 0;
    5'b00111 : a16 = -6040;
    5'b01000 : a16 = 0;
    5'b01001 : a16 = 5378;
    5'b01010 : a16 = 0;
    5'b01011 : a16 = -5378;
    5'b01100 : a16 = 0;
    5'b01101 : a16 = 4382;
    5'b01110 : a16 = 0;
    5'b01111 : a16 = -4382;
    5'b10000 : a16 = 0;
    5'b10001 : a16 = 3193;
    5'b10010 : a16 = 0;
    5'b10011 : a16 = -3193;
    5'b10100 : a16 = 0;
    5'b10101 : a16 = 1971;
    5'b10110 : a16 = 0;
    5'b10111 : a16 = -1971;
    5'b11000 : a16 = 0;
    5'b11001 : a16 = 865;
    5'b11010 : a16 = 0;
    5'b11011 : a16 = -865;
    5'b11100 : a16 = 0;
    5'b11101 : a16 = -8;
    5'b11110 : a16 = 0;
    5'b11111 : a16 = 8;
  endcase

  a17 = 0;
  case ({STAGE[3:1], INPUT[35:34]})
    5'b00000 : a17 = 0;
    5'b00001 : a17 = -585;
    5'b00010 : a17 = 0;
    5'b00011 : a17 = 585;
    5'b00100 : a17 = 0;
    5'b00101 : a17 = -8;
    5'b00110 : a17 = 0;
    5'b00111 : a17 = 8;
    5'b01000 : a17 = 0;
    5'b01001 : a17 = 865;
    5'b01010 : a17 = 0;
    5'b01011 : a17 = -865;
    5'b01100 : a17 = 0;
    5'b01101 : a17 = 1971;
    5'b01110 : a17 = 0;
    5'b01111 : a17 = -1971;
    5'b10000 : a17 = 0;
    5'b10001 : a17 = 3193;
    5'b10010 : a17 = 0;
    5'b10011 : a17 = -3193;
    5'b10100 : a17 = 0;
    5'b10101 : a17 = 4382;
    5'b10110 : a17 = 0;
    5'b10111 : a17 = -4382;
    5'b11000 : a17 = 0;
    5'b11001 : a17 = 5378;
    5'b11010 : a17 = 0;
    5'b11011 : a17 = -5378;
    5'b11100 : a17 = 0;
    5'b11101 : a17 = 6040;
    5'b11110 : a17 = 0;
    5'b11111 : a17 = -6040;
  endcase

  a18 = 0;
  case ({STAGE[3:1], INPUT[37:36]})
    5'b00000 : a18 = 0;
    5'b00001 : a18 = 234;
    5'b00010 : a18 = 0;
    5'b00011 : a18 = -234;
    5'b00100 : a18 = 0;
    5'b00101 : a18 = 209;
    5'b00110 : a18 = 0;
    5'b00111 : a18 = -209;
    5'b01000 : a18 = 0;
    5'b01001 : a18 = 85;
    5'b01010 : a18 = 0;
    5'b01011 : a18 = -85;
    5'b01100 : a18 = 0;
    5'b01101 : a18 = -134;
    5'b01110 : a18 = 0;
    5'b01111 : a18 = 134;
    5'b10000 : a18 = 0;
    5'b10001 : a18 = -414;
    5'b10010 : a18 = 0;
    5'b10011 : a18 = 414;
    5'b10100 : a18 = 0;
    5'b10101 : a18 = -686;
    5'b10110 : a18 = 0;
    5'b10111 : a18 = 686;
    5'b11000 : a18 = 0;
    5'b11001 : a18 = -865;
    5'b11010 : a18 = 0;
    5'b11011 : a18 = 865;
    5'b11100 : a18 = 0;
    5'b11101 : a18 = -857;
    5'b11110 : a18 = 0;
    5'b11111 : a18 = 857;
  endcase

  a19 = 0;
  case ({STAGE[3:1], INPUT[39:38]})
    5'b00000 : a19 = 0;
    5'b00001 : a19 = 16;
    5'b00010 : a19 = 0;
    5'b00011 : a19 = -16;
    5'b00100 : a19 = 0;
    5'b00101 : a19 = -42;
    5'b00110 : a19 = 0;
    5'b00111 : a19 = 42;
    5'b01000 : a19 = 0;
    5'b01001 : a19 = -90;
    5'b01010 : a19 = 0;
    5'b01011 : a19 = 90;
    5'b01100 : a19 = 0;
    5'b01101 : a19 = -108;
    5'b01110 : a19 = 0;
    5'b01111 : a19 = 108;
    5'b10000 : a19 = 0;
    5'b10001 : a19 = -82;
    5'b10010 : a19 = 0;
    5'b10011 : a19 = 82;
    5'b10100 : a19 = 0;
    5'b10101 : a19 = -12;
    5'b10110 : a19 = 0;
    5'b10111 : a19 = 12;
    5'b11000 : a19 = 0;
    5'b11001 : a19 = 85;
    5'b11010 : a19 = 0;
    5'b11011 : a19 = -85;
    5'b11100 : a19 = 0;
    5'b11101 : a19 = 180;
    5'b11110 : a19 = 0;
    5'b11111 : a19 = -180;
  endcase

  a20 = 0;
  case ({STAGE[3:1], INPUT[41:40]})
    5'b00000 : a20 = 0;
    5'b00001 : a20 = -55;
    5'b00010 : a20 = 0;
    5'b00011 : a20 = 55;
    5'b00100 : a20 = 0;
    5'b00101 : a20 = -47;
    5'b00110 : a20 = 0;
    5'b00111 : a20 = 47;
    5'b01000 : a20 = 0;
    5'b01001 : a20 = -21;
    5'b01010 : a20 = 0;
    5'b01011 : a20 = 21;
    5'b01100 : a20 = 0;
    5'b01101 : a20 = 18;
    5'b01110 : a20 = 0;
    5'b01111 : a20 = -18;
    5'b10000 : a20 = 0;
    5'b10001 : a20 = 59;
    5'b10010 : a20 = 0;
    5'b10011 : a20 = -59;
    5'b10100 : a20 = 0;
    5'b10101 : a20 = 87;
    5'b10110 : a20 = 0;
    5'b10111 : a20 = -87;
    5'b11000 : a20 = 0;
    5'b11001 : a20 = 90;
    5'b11010 : a20 = 0;
    5'b11011 : a20 = -90;
    5'b11100 : a20 = 0;
    5'b11101 : a20 = 65;
    5'b11110 : a20 = 0;
    5'b11111 : a20 = -65;
  endcase

  a21 = 0;
  case ({STAGE[3:1], INPUT[43:42]})
    5'b00000 : a21 = 0;
    5'b00001 : a21 = -3;
    5'b00010 : a21 = 0;
    5'b00011 : a21 = 3;
    5'b00100 : a21 = 0;
    5'b00101 : a21 = 16;
    5'b00110 : a21 = 0;
    5'b00111 : a21 = -16;
    5'b01000 : a21 = 0;
    5'b01001 : a21 = 32;
    5'b01010 : a21 = 0;
    5'b01011 : a21 = -32;
    5'b01100 : a21 = 0;
    5'b01101 : a21 = 37;
    5'b01110 : a21 = 0;
    5'b01111 : a21 = -37;
    5'b10000 : a21 = 0;
    5'b10001 : a21 = 27;
    5'b10010 : a21 = 0;
    5'b10011 : a21 = -27;
    5'b10100 : a21 = 0;
    5'b10101 : a21 = 6;
    5'b10110 : a21 = 0;
    5'b10111 : a21 = -6;
    5'b11000 : a21 = 0;
    5'b11001 : a21 = -21;
    5'b11010 : a21 = 0;
    5'b11011 : a21 = 21;
    5'b11100 : a21 = 0;
    5'b11101 : a21 = -44;
    5'b11110 : a21 = 0;
    5'b11111 : a21 = 44;
  endcase

  a22 = 0;
  case ({STAGE[3:1], INPUT[45:44]})
    5'b00000 : a22 = 0;
    5'b00001 : a22 = 24;
    5'b00010 : a22 = 0;
    5'b00011 : a22 = -24;
    5'b00100 : a22 = 0;
    5'b00101 : a22 = 20;
    5'b00110 : a22 = 0;
    5'b00111 : a22 = -20;
    5'b01000 : a22 = 0;
    5'b01001 : a22 = 9;
    5'b01010 : a22 = 0;
    5'b01011 : a22 = -9;
    5'b01100 : a22 = 0;
    5'b01101 : a22 = -6;
    5'b01110 : a22 = 0;
    5'b01111 : a22 = 6;
    5'b10000 : a22 = 0;
    5'b10001 : a22 = -22;
    5'b10010 : a22 = 0;
    5'b10011 : a22 = 22;
    5'b10100 : a22 = 0;
    5'b10101 : a22 = -32;
    5'b10110 : a22 = 0;
    5'b10111 : a22 = 32;
    5'b11000 : a22 = 0;
    5'b11001 : a22 = -32;
    5'b11010 : a22 = 0;
    5'b11011 : a22 = 32;
    5'b11100 : a22 = 0;
    5'b11101 : a22 = -21;
    5'b11110 : a22 = 0;
    5'b11111 : a22 = 21;
  endcase

  a23 = 0;
  case ({STAGE[3:1], INPUT[47:46]})
    5'b00000 : a23 = 0;
    5'b00001 : a23 = 1;
    5'b00010 : a23 = 0;
    5'b00011 : a23 = -1;
    5'b00100 : a23 = 0;
    5'b00101 : a23 = -9;
    5'b00110 : a23 = 0;
    5'b00111 : a23 = 9;
    5'b01000 : a23 = 0;
    5'b01001 : a23 = -16;
    5'b01010 : a23 = 0;
    5'b01011 : a23 = 16;
    5'b01100 : a23 = 0;
    5'b01101 : a23 = -18;
    5'b01110 : a23 = 0;
    5'b01111 : a23 = 18;
    5'b10000 : a23 = 0;
    5'b10001 : a23 = -13;
    5'b10010 : a23 = 0;
    5'b10011 : a23 = 13;
    5'b10100 : a23 = 0;
    5'b10101 : a23 = -3;
    5'b10110 : a23 = 0;
    5'b10111 : a23 = 3;
    5'b11000 : a23 = 0;
    5'b11001 : a23 = 9;
    5'b11010 : a23 = 0;
    5'b11011 : a23 = -9;
    5'b11100 : a23 = 0;
    5'b11101 : a23 = 19;
    5'b11110 : a23 = 0;
    5'b11111 : a23 = -19;
  endcase

  a24 = 0;
  case ({STAGE[3:1], INPUT[49:48]})
    5'b00000 : a24 = 0;
    5'b00001 : a24 = -13;
    5'b00010 : a24 = 0;
    5'b00011 : a24 = 13;
    5'b00100 : a24 = 0;
    5'b00101 : a24 = -11;
    5'b00110 : a24 = 0;
    5'b00111 : a24 = 11;
    5'b01000 : a24 = 0;
    5'b01001 : a24 = -5;
    5'b01010 : a24 = 0;
    5'b01011 : a24 = 5;
    5'b01100 : a24 = 0;
    5'b01101 : a24 = 3;
    5'b01110 : a24 = 0;
    5'b01111 : a24 = -3;
    5'b10000 : a24 = 0;
    5'b10001 : a24 = 11;
    5'b10010 : a24 = 0;
    5'b10011 : a24 = -11;
    5'b10100 : a24 = 0;
    5'b10101 : a24 = 16;
    5'b10110 : a24 = 0;
    5'b10111 : a24 = -16;
    5'b11000 : a24 = 0;
    5'b11001 : a24 = 16;
    5'b11010 : a24 = 0;
    5'b11011 : a24 = -16;
    5'b11100 : a24 = 0;
    5'b11101 : a24 = 10;
    5'b11110 : a24 = 0;
    5'b11111 : a24 = -10;
  endcase

  a25 = 0;
  case ({STAGE[3:1], INPUT[51:50]})
    5'b00000 : a25 = 0;
    5'b00001 : a25 = 0;
    5'b00010 : a25 = 0;
    5'b00011 : a25 = 0;
    5'b00100 : a25 = 0;
    5'b00101 : a25 = 5;
    5'b00110 : a25 = 0;
    5'b00111 : a25 = -5;
    5'b01000 : a25 = 0;
    5'b01001 : a25 = 10;
    5'b01010 : a25 = 0;
    5'b01011 : a25 = -10;
    5'b01100 : a25 = 0;
    5'b01101 : a25 = 11;
    5'b01110 : a25 = 0;
    5'b01111 : a25 = -11;
    5'b10000 : a25 = 0;
    5'b10001 : a25 = 8;
    5'b10010 : a25 = 0;
    5'b10011 : a25 = -8;
    5'b10100 : a25 = 0;
    5'b10101 : a25 = 2;
    5'b10110 : a25 = 0;
    5'b10111 : a25 = -2;
    5'b11000 : a25 = 0;
    5'b11001 : a25 = -5;
    5'b11010 : a25 = 0;
    5'b11011 : a25 = 5;
    5'b11100 : a25 = 0;
    5'b11101 : a25 = -11;
    5'b11110 : a25 = 0;
    5'b11111 : a25 = 11;
  endcase

  a26 = 0;
  case ({STAGE[3:1], INPUT[53:52]})
    5'b00000 : a26 = 0;
    5'b00001 : a26 = 8;
    5'b00010 : a26 = 0;
    5'b00011 : a26 = -8;
    5'b00100 : a26 = 0;
    5'b00101 : a26 = 7;
    5'b00110 : a26 = 0;
    5'b00111 : a26 = -7;
    5'b01000 : a26 = 0;
    5'b01001 : a26 = 3;
    5'b01010 : a26 = 0;
    5'b01011 : a26 = -3;
    5'b01100 : a26 = 0;
    5'b01101 : a26 = -2;
    5'b01110 : a26 = 0;
    5'b01111 : a26 = 2;
    5'b10000 : a26 = 0;
    5'b10001 : a26 = -7;
    5'b10010 : a26 = 0;
    5'b10011 : a26 = 7;
    5'b10100 : a26 = 0;
    5'b10101 : a26 = -10;
    5'b10110 : a26 = 0;
    5'b10111 : a26 = 10;
    5'b11000 : a26 = 0;
    5'b11001 : a26 = -10;
    5'b11010 : a26 = 0;
    5'b11011 : a26 = 10;
    5'b11100 : a26 = 0;
    5'b11101 : a26 = -6;
    5'b11110 : a26 = 0;
    5'b11111 : a26 = 6;
  endcase

  a27 = 0;
  case ({STAGE[3:1], INPUT[55:54]})
    5'b00000 : a27 = 0;
    5'b00001 : a27 = 0;
    5'b00010 : a27 = 0;
    5'b00011 : a27 = 0;
    5'b00100 : a27 = 0;
    5'b00101 : a27 = -3;
    5'b00110 : a27 = 0;
    5'b00111 : a27 = 3;
    5'b01000 : a27 = 0;
    5'b01001 : a27 = -6;
    5'b01010 : a27 = 0;
    5'b01011 : a27 = 6;
    5'b01100 : a27 = 0;
    5'b01101 : a27 = -7;
    5'b01110 : a27 = 0;
    5'b01111 : a27 = 7;
    5'b10000 : a27 = 0;
    5'b10001 : a27 = -5;
    5'b10010 : a27 = 0;
    5'b10011 : a27 = 5;
    5'b10100 : a27 = 0;
    5'b10101 : a27 = -1;
    5'b10110 : a27 = 0;
    5'b10111 : a27 = 1;
    5'b11000 : a27 = 0;
    5'b11001 : a27 = 3;
    5'b11010 : a27 = 0;
    5'b11011 : a27 = -3;
    5'b11100 : a27 = 0;
    5'b11101 : a27 = 7;
    5'b11110 : a27 = 0;
    5'b11111 : a27 = -7;
  endcase

  a28 = 0;
  case ({STAGE[3:1], INPUT[57:56]})
    5'b00000 : a28 = 0;
    5'b00001 : a28 = -6;
    5'b00010 : a28 = 0;
    5'b00011 : a28 = 6;
    5'b00100 : a28 = 0;
    5'b00101 : a28 = -5;
    5'b00110 : a28 = 0;
    5'b00111 : a28 = 5;
    5'b01000 : a28 = 0;
    5'b01001 : a28 = -2;
    5'b01010 : a28 = 0;
    5'b01011 : a28 = 2;
    5'b01100 : a28 = 0;
    5'b01101 : a28 = 1;
    5'b01110 : a28 = 0;
    5'b01111 : a28 = -1;
    5'b10000 : a28 = 0;
    5'b10001 : a28 = 4;
    5'b10010 : a28 = 0;
    5'b10011 : a28 = -4;
    5'b10100 : a28 = 0;
    5'b10101 : a28 = 6;
    5'b10110 : a28 = 0;
    5'b10111 : a28 = -6;
    5'b11000 : a28 = 0;
    5'b11001 : a28 = 6;
    5'b11010 : a28 = 0;
    5'b11011 : a28 = -6;
    5'b11100 : a28 = 0;
    5'b11101 : a28 = 4;
    5'b11110 : a28 = 0;
    5'b11111 : a28 = -4;
  endcase

  a29 = 0;
  case ({STAGE[3:1], INPUT[59:58]})
    5'b00000 : a29 = 0;
    5'b00001 : a29 = 0;
    5'b00010 : a29 = 0;
    5'b00011 : a29 = 0;
    5'b00100 : a29 = 0;
    5'b00101 : a29 = 2;
    5'b00110 : a29 = 0;
    5'b00111 : a29 = -2;
    5'b01000 : a29 = 0;
    5'b01001 : a29 = 4;
    5'b01010 : a29 = 0;
    5'b01011 : a29 = -4;
    5'b01100 : a29 = 0;
    5'b01101 : a29 = 5;
    5'b01110 : a29 = 0;
    5'b01111 : a29 = -5;
    5'b10000 : a29 = 0;
    5'b10001 : a29 = 3;
    5'b10010 : a29 = 0;
    5'b10011 : a29 = -3;
    5'b10100 : a29 = 0;
    5'b10101 : a29 = 0;
    5'b10110 : a29 = 0;
    5'b10111 : a29 = 0;
    5'b11000 : a29 = 0;
    5'b11001 : a29 = -2;
    5'b11010 : a29 = 0;
    5'b11011 : a29 = 2;
    5'b11100 : a29 = 0;
    5'b11101 : a29 = -5;
    5'b11110 : a29 = 0;
    5'b11111 : a29 = 5;
  endcase

  a30 = 0;
  case ({STAGE[3:1], INPUT[61:60]})
    5'b00000 : a30 = 0;
    5'b00001 : a30 = 4;
    5'b00010 : a30 = 0;
    5'b00011 : a30 = -4;
    5'b00100 : a30 = 0;
    5'b00101 : a30 = 3;
    5'b00110 : a30 = 0;
    5'b00111 : a30 = -3;
    5'b01000 : a30 = 0;
    5'b01001 : a30 = 1;
    5'b01010 : a30 = 0;
    5'b01011 : a30 = -1;
    5'b01100 : a30 = 0;
    5'b01101 : a30 = -1;
    5'b01110 : a30 = 0;
    5'b01111 : a30 = 1;
    5'b10000 : a30 = 0;
    5'b10001 : a30 = -3;
    5'b10010 : a30 = 0;
    5'b10011 : a30 = 3;
    5'b10100 : a30 = 0;
    5'b10101 : a30 = -4;
    5'b10110 : a30 = 0;
    5'b10111 : a30 = 4;
    5'b11000 : a30 = 0;
    5'b11001 : a30 = -4;
    5'b11010 : a30 = 0;
    5'b11011 : a30 = 4;
    5'b11100 : a30 = 0;
    5'b11101 : a30 = -3;
    5'b11110 : a30 = 0;
    5'b11111 : a30 = 3;
  endcase

  a31 = 0;
  case ({STAGE[3:1], INPUT[63:62]})
    5'b00000 : a31 = 0;
    5'b00001 : a31 = 0;
    5'b00010 : a31 = 0;
    5'b00011 : a31 = 0;
    5'b00100 : a31 = 0;
    5'b00101 : a31 = -2;
    5'b00110 : a31 = 0;
    5'b00111 : a31 = 2;
    5'b01000 : a31 = 0;
    5'b01001 : a31 = -3;
    5'b01010 : a31 = 0;
    5'b01011 : a31 = 3;
    5'b01100 : a31 = 0;
    5'b01101 : a31 = -3;
    5'b01110 : a31 = 0;
    5'b01111 : a31 = 3;
    5'b10000 : a31 = 0;
    5'b10001 : a31 = -2;
    5'b10010 : a31 = 0;
    5'b10011 : a31 = 2;
    5'b10100 : a31 = 0;
    5'b10101 : a31 = 0;
    5'b10110 : a31 = 0;
    5'b10111 : a31 = 0;
    5'b11000 : a31 = 0;
    5'b11001 : a31 = 1;
    5'b11010 : a31 = 0;
    5'b11011 : a31 = -1;
    5'b11100 : a31 = 0;
    5'b11101 : a31 = 3;
    5'b11110 : a31 = 0;
    5'b11111 : a31 = -3;
  endcase

  a32 = 0;
  case ({STAGE[3:1], INPUT[65:64]})
    5'b00000 : a32 = 0;
    5'b00001 : a32 = -3;
    5'b00010 : a32 = 0;
    5'b00011 : a32 = 3;
    5'b00100 : a32 = 0;
    5'b00101 : a32 = -2;
    5'b00110 : a32 = 0;
    5'b00111 : a32 = 2;
    5'b01000 : a32 = 0;
    5'b01001 : a32 = -1;
    5'b01010 : a32 = 0;
    5'b01011 : a32 = 1;
    5'b01100 : a32 = 0;
    5'b01101 : a32 = 0;
    5'b01110 : a32 = 0;
    5'b01111 : a32 = 0;
    5'b10000 : a32 = 0;
    5'b10001 : a32 = 2;
    5'b10010 : a32 = 0;
    5'b10011 : a32 = -2;
    5'b10100 : a32 = 0;
    5'b10101 : a32 = 3;
    5'b10110 : a32 = 0;
    5'b10111 : a32 = -3;
    5'b11000 : a32 = 0;
    5'b11001 : a32 = 3;
    5'b11010 : a32 = 0;
    5'b11011 : a32 = -3;
    5'b11100 : a32 = 0;
    5'b11101 : a32 = 2;
    5'b11110 : a32 = 0;
    5'b11111 : a32 = -2;
  endcase

end

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