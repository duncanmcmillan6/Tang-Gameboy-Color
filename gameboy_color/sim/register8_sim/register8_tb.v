`timescale 1ns/1ps

module register8_tb;

reg [7:0] r_indata_tb;
reg r_clk_tb;
reg r_enload_tb;
reg r_reset_tb;
wire [7:0] w_outdata_tb;

eightbit_reg UUT(
    .i_clk(r_clk_tb),
    .i_enload(r_enload_tb),
    .i_reset(r_reset_tb),
    .i_data(r_indata_tb),
    .o_data(w_outdata_tb)
);

initial begin
    $dumpfile("register8_wave.vcd");
    $dumpvars(0, register8_tb);
end

initial begin
    r_clk_tb = 1'b0;

    forever begin
        #5 r_clk_tb = ~r_clk_tb;
    end
end

initial begin
    r_reset_tb = 1'b1;
    r_enload_tb = 1'b0;
    r_indata_tb = 8'b0;

    #40;
    r_reset_tb = 1'b0;
    r_enload_tb = 1'b1;
    r_indata_tb = 8'b01000010;

    #40;
    r_reset_tb = 1'b0;
    r_enload_tb = 1'b0;
    r_indata_tb = 8'b10011001;

    #40;
    r_reset_tb = 1'b1;
    r_enload_tb = 1'b1;
    r_indata_tb = 8'b11111111;

    #40;
    $finish;

end

endmodule
