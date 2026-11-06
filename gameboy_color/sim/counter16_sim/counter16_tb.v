`timescale 1ns/1ps

module counter16_tb;

reg [15:0] r_inaddress_tb;
reg r_increment_tb;
reg r_clk_tb;
reg r_reset_tb;
reg r_load_tb;
wire [15:0] w_outcounter_tb;

sixteenbit_counter UUT(
    .i_clk(r_clk_tb),
    .i_reset(r_reset_tb),
    .i_load(r_load_tb),
    .i_increment(r_increment_tb),
    .i_address(r_inaddress_tb),
    .o_counter(w_outcounter_tb)
);

initial begin
    $dumpfile("counter16_wave.vcd");
    $dumpvars(0, counter16_tb);
end

initial begin
    r_clk_tb = 1'b0;
    forever #5 r_clk_tb = ~r_clk_tb;
end

initial begin
    r_reset_tb = 1'b1;
    r_load_tb = 1'b0;
    r_increment_tb = 1'b0;
    r_inaddress_tb = 16'h0000;

    #40;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b0;
    r_increment_tb = 1'b1;

    #30;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b0;
    r_increment_tb = 1'b0;

    #40;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b1;
    r_increment_tb = 1'b0;
    r_inaddress_tb = 16'h0150;

    #40;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b1;
    r_increment_tb = 1'b1;
    r_inaddress_tb = 16'h0200;

    #40;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b1;
    r_increment_tb = 1'b0;
    r_inaddress_tb = 16'hFFFF;

    #40;
    r_reset_tb = 1'b0;
    r_load_tb = 1'b0;
    r_increment_tb = 1'b1;
    
    #10;
    $finish;
end
endmodule