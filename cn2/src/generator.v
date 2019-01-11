module generator(
  input clk,
  input reset,
  input enable,
  input [15:0] msg_length,
  input [7:0] ram_data,
  output valid, done, read_enable,
  output [9:0] ram_addr,
  output [3:0] data
);  

  parameter INITIAL = 3'd0;
  parameter PAD_BEFORE = 3'd1;
  parameter PREAMBLE = 3'd2;
  parameter LOAD = 3'd3;
  parameter DATA = 3'd4;
  parameter DATA_EXTRA = 3'd5;
  parameter PAD_AFTER = 3'd6;
  parameter DONE = 3'd7;

  parameter PAD_LENGTH = 16'd1500;
  parameter PREAMBLE_LENGTH = 16'd1535;

  reg [15:0] data_cntr = 0;
  reg [15:0] preamble_cntr = 0;
  reg [15:0] pad_cntr = 0;
  reg [2:0] state = INITIAL;
  reg [3:0] spread_cntr;
  reg data_valid = 1'b0;
  reg output_data;
  reg ram_read_enable = 1'b0;
  reg [3:0] scramble_data = 4'b0;
  wire [3:0] data_preamble;
  wire [1:0] scramble_code;
  wire preamble_valid, scrambler_valid;

  always @(posedge clk)
  begin
    if (reset) begin
      preamble_cntr <= 0;
      data_cntr <= 0;
      spread_cntr <= 0;
      state <= INITIAL;
    end
    else if (enable)
    begin
      if (state == INITIAL)
      begin
        state <= PAD_BEFORE;
        data_cntr <= 0;
        preamble_cntr <= 0;
        pad_cntr <= 0;
      end
      if (state == PAD_BEFORE)
      begin
        pad_cntr <= pad_cntr + 1;
        if (pad_cntr == PAD_LENGTH)
        begin
          state <= PREAMBLE;
        end
      end
      if (state == PREAMBLE)
      begin
        preamble_cntr <= preamble_cntr + 1;
        if (preamble_cntr == PREAMBLE_LENGTH)
        begin
          preamble_cntr <= 0;
          state <= LOAD;
        end
      end
      if (state == DATA)
      begin
        spread_cntr <= spread_cntr + 1;
        if (spread_cntr < 15) begin
        end else if (data_cntr == msg_length) begin
          state <= PAD_AFTER;
          pad_cntr <= 0;
        end else if (data_cntr[2:0] == 3'b111) begin
          state <= DATA_EXTRA;
          data_cntr <= data_cntr + 1;
        end else if (data_cntr[2:0] == 3'b011) begin
          state <= LOAD;
          data_cntr <= data_cntr + 1;
        end else begin
          data_cntr <= data_cntr + 1;
        end
      end
      if (state == DATA_EXTRA)
      begin
        spread_cntr <= spread_cntr + 1;
        if (spread_cntr == 15)
        begin
          state <= LOAD;
        end
      end
      if (state == PAD_AFTER)
      begin
        pad_cntr <= pad_cntr + 1;
        if (pad_cntr == PAD_LENGTH)
        begin
          state <= DONE;
        end
      end
      if (state == DONE)
      begin
        state <= INITIAL;
      end
    end
    if (state == LOAD)
    begin
      state <= DATA;
      spread_cntr <= 0;
    end
  end

  wire [1:0] ram_data1 =
    (data_cntr[1:0] == 2'b00) ? ram_data[7:6] :
    (data_cntr[1:0] == 2'b01) ? ram_data[5:4] :
    (data_cntr[1:0] == 2'b10) ? ram_data[3:2] : ram_data[1:0];

  always @(ram_data1 or scramble_code or state)
  begin
    scramble_data = 0;
    case ({state == DATA_EXTRA ? 2'b11 : ram_data1, scramble_code})
      4'b0000 : scramble_data = 4'b0101;
      4'b0001 : scramble_data = 4'b0111;
      4'b0010 : scramble_data = 4'b1101;
      4'b0011 : scramble_data = 4'b1111;
      4'b0100 : scramble_data = 4'b0111;
      4'b0101 : scramble_data = 4'b1111;
      4'b0110 : scramble_data = 4'b0101;
      4'b0111 : scramble_data = 4'b1101;
      4'b1000 : scramble_data = 4'b1101;
      4'b1001 : scramble_data = 4'b0101;
      4'b1010 : scramble_data = 4'b1111;
      4'b1011 : scramble_data = 4'b0111;
      4'b1100 : scramble_data = 4'b1111;
      4'b1101 : scramble_data = 4'b1101;
      4'b1110 : scramble_data = 4'b0111;
      4'b1111 : scramble_data = 4'b0101;
    endcase
  end

  always @(state or preamble_valid or scrambler_valid)
  begin
    if (state == PREAMBLE)
      data_valid = preamble_valid;
    else if (state == DATA || state == DATA_EXTRA)
      data_valid = scrambler_valid;
    else if (state == PAD_BEFORE || state == PAD_AFTER)
      data_valid = 1'b1;
    else
      data_valid = 1'b0;
  end

  preamble p0(
    .clk(clk),
    .reset(reset),
    .enable(state == PREAMBLE && enable),
    .valid(preamble_valid),
    .preamble(data_preamble)
  );

  scrambler s0(
    .clk(clk),
    .reset(reset),
    .enable((state == DATA || state == DATA_EXTRA) && enable),
    .valid(scrambler_valid),
    .out(scramble_code));

  assign data =
    (state == PREAMBLE) ? data_preamble :
    (state == DATA) ? scramble_data :
    (state == DATA_EXTRA) ? scramble_data : 0;

  assign ram_addr = data_cntr[11:2];
  assign valid = data_valid;
  assign read_enable = state == LOAD;
  assign done = (state == DONE);

endmodule