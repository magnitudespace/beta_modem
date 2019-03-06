module SPI_Slave_top (
  input  i_sys_clk,  
  input  i_mosi,      
  input  i_ssn,       
  input  i_sclk,
  output o_miso,      
  input  [7:0]  i_data,
  output o_wr,
  output o_rd,
  output [7:0] o_data,
  output [9:0] o_addr
);

  parameter DATA_SIZE = 8;
  parameter WRITE_MODE = 0;
  parameter READ_MODE = 1;

  //Clock SPI signals, first to sync signal 
  reg i_sclk_d, i_ssn_d, i_mosi_d;
  reg i_sclk_dd, i_ssn_dd; 
  wire pe_sclk, ne_sclk, pe_ssn, ne_ssn;

  always @ (posedge i_sys_clk) 
  begin
    i_sclk_d <= i_sclk;
    i_ssn_d <= i_ssn;
    i_mosi_d <= i_mosi;
  end

  always @ (posedge i_sys_clk) 
  begin
    i_sclk_dd <= i_sclk_d;
    i_ssn_dd <= i_ssn_d;
  end

  assign pe_sclk = ~i_ssn_d & i_sclk_d & ~i_sclk_dd; //positive edge detection
  assign ne_sclk = ~i_ssn_d & ~i_sclk_d & i_sclk_dd; //negative edge detection
  assign pe_ssn = i_ssn_d & ~i_ssn_dd; //positive edge detection
  assign ne_ssn = ~i_ssn_d & i_ssn_dd; //negative edge detection    
   
  reg [7:0] mosi_shift_d;
 
  //shift regiser to get spi data 
  always @(posedge i_sys_clk) 
    if (!i_ssn_d && pe_sclk)
      mosi_shift_d <= { mosi_shift_d[6:0], i_mosi_d };

  reg [2:0] bit_cnt;

  //count spi bit per one cs cycle
  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      bit_cnt <= 0;
    else if (pe_sclk)
      bit_cnt <= bit_cnt + 1;
  end 
  
  reg eof_byte;
  reg eof_byte_d,eof_byte_dd;
  reg [10:0] data_byte_cnt;//1024 bytes of data
  reg [1:0] serv_byte_cnt;//2 bytes of service info: address,mode

  //end of byte
  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      eof_byte <=0;  
    else if (pe_sclk && bit_cnt==7)
      eof_byte <= 1'b1;
    else
      eof_byte <= 1'b0;
  end 

  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      eof_byte_d <= 0;  
    else
      eof_byte_d <= eof_byte;
  end 

  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      eof_byte_dd <= 0;  
    else
      eof_byte_dd <= eof_byte_d;
  end 

  //Count bytes within one CS
  wire data_en, read_en;
  wire service_data_en;
  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      serv_byte_cnt <= 0;
    else if (service_data_en)
      serv_byte_cnt <= serv_byte_cnt + 1'b1;
  end

  //Count bytes within one CS
  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn)
      data_byte_cnt <= 0;
    else if (data_en)
      data_byte_cnt <= data_byte_cnt + 1'b1;
  end

  assign data_en = eof_byte_d && (serv_byte_cnt == 2); //should be one clock long, otherwise data_byte_cnt will overcount
  assign service_data_en = eof_byte_d && (serv_byte_cnt < 2); //should be one clock long, otherwise data_byte_cnt will overcount

  reg [7:0] data;
  reg [9:0] addr;
  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn) 
      data <= 0;
    else if (eof_byte)
      data <= mosi_shift_d;
    else
      data <= 0;
  end

  reg [13:0] spi_ram_addr;// come from uC
  reg [1:0] spi_mode;// come from uC
  reg data_en_d;

  always @(posedge i_sys_clk) 
  begin 
    if (ne_ssn) begin 
      spi_ram_addr <= 0;
      spi_mode <= 0;
    end else if (service_data_en && serv_byte_cnt == 0) begin
      spi_ram_addr[13:8] <= data[5:0];
      spi_mode <= data[7:6];
    end
    else if (service_data_en && serv_byte_cnt == 1) begin
      spi_ram_addr[7:0] <= data[7:0];
    end
  end    

  always @(spi_ram_addr or data_byte_cnt) 
  begin
    addr = spi_ram_addr + data_byte_cnt;
  end

  reg [7:0] miso_d;

  //mosi output
  always @(posedge i_sys_clk) 
  begin
    if (ne_ssn || data_en_neg)
      miso_d <= i_data;
    else if (ne_sclk)
      miso_d <= { miso_d[6:0], 1'b0 };
  end

  reg [2:0] ne_bit_cnt;
  reg data_en_hold, data_en_neg, service_data_en_d;

  always @(posedge i_sys_clk)
    service_data_en_d <= service_data_en;

  always @(posedge i_sys_clk)
  begin
    if (ne_ssn)
    begin
      data_en_hold <= 1'b0;
      data_en_neg <= 1'b0;
    end
    else if (eof_byte_d)
      data_en_hold <= 1'b1;
    else if (ne_sclk && data_en_hold)
    begin
      data_en_hold <= 1'b0;
      data_en_neg <= 1'b1;
    end
    else begin
      data_en_neg <= 1'b0;
    end

  end

  wire wr_en;
  assign wr_en = data_en && (spi_mode == 2'b10);
  assign o_data = data;
  //assign o_data[7:0] = mosi_shift_d & {8{wr_en}};
  assign o_wr = wr_en;
  assign o_rd = ~wr_en & ~ne_ssn;
  assign o_addr = addr;
  assign o_miso = miso_d[7];

endmodule
