/* Verilog netlist generated by SCUBA Diamond (64-bit) 3.9.0.99.2 */
/* Module Version: 5.8 */
/* /usr/local/diamond/3.9_x64/ispfpga/bin/lin64/scuba -w -n DDR_RECEIVE -lang verilog -synth lse -bus_exp 7 -bb -arch xo3c00a -type iol -mode in -io_type LVDS25 -width 1 -freq_in 64 -gear 1 -clk sclk -del 32  */
/* Mon Dec 31 12:53:05 2018 */


`timescale 1 ns / 1 ps
module DDR_RECEIVE (clk, reset, sclk, datain, q)/* synthesis NGD_DRC_MASK=1 */;
    input wire clk;
    input wire reset;
    input wire [0:0] datain;
    output wire sclk;
    output wire [1:0] q;

    wire qb0;
    wire qa0;
    wire sclk_t;
    wire dataini_t0;
    wire buf_clk;
    wire buf_dataini0;

    IDDRXE Inst3_IDDRXE0 (.D(dataini_t0), .SCLK(sclk_t), .RST(reset), .Q0(qa0), 
        .Q1(qb0));

    defparam udel_dataini0.DEL_VALUE = "DELAY0" ;
    defparam udel_dataini0.DEL_MODE = "SCLK_CENTERED" ;
    DELAYE udel_dataini0 (.A(buf_dataini0), .Z(dataini_t0));

    IB Inst2_IB (.I(clk), .O(buf_clk))
             /* synthesis IO_TYPE="LVDS25" */;

    IB Inst1_IB0 (.I(datain[0]), .O(buf_dataini0))
             /* synthesis IO_TYPE="LVDS25" */;

    assign sclk = sclk_t;
    assign q[1] = qb0;
    assign q[0] = qa0;
    assign sclk_t = buf_clk;


    // exemplar begin
    // exemplar attribute Inst2_IB IO_TYPE LVDS25
    // exemplar attribute Inst1_IB0 IO_TYPE LVDS25
    // exemplar end

endmodule