`timescale 1ns/1ps

module alu8_tb;

reg [7:0] r_a;
reg [7:0] r_b;
reg [4:0] r_operation;
reg [3:0] r_flags;
reg [2:0] r_bit_index;

wire [7:0] w_outresult;
wire [3:0] w_outflags;

alu8 UUT(
    .i_a(r_a),
    .i_b(r_b),
    .i_operation(r_operation),
    .i_flags(r_flags),
    .i_bit_index(r_bit_index),
    .o_result(w_outresult),
    .o_flags(w_outflags)
);

initial begin
    $dumpfile("alu8_add_wave.vcd");
    $dumpvars(0, alu8_tb);
end

initial begin
    r_a = 8'h05;
    r_b = 8'h03;
    r_operation = 5'd0;
    r_flags = 4'd0;
    r_bit_index = 3'd0;

    #1;
    if (w_outresult !== 8'h08 || w_outflags !== 4'b0000) begin
        $display("FAIL: 0x05 + 0x03 | Result: %h | Flags: %b", w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0x05 + 0x03");
    end

    #40;
    r_a = 8'h0F;
    r_b = 8'h01;
    r_operation = 5'd0;
    r_flags = 4'd0;
    r_bit_index = 3'd0;

    #1;
    if (w_outresult !== 8'h10 || w_outflags !== 4'b0010) begin
        $display("FAIL: 0x0F + 0x01 | Result: %h | Flags: %b", w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0x0F + 0x01");
    end

    #40;
    r_a = 8'hFF;
    r_b = 8'h01;
    r_operation = 5'd0;
    r_flags = 4'd0;
    r_bit_index = 3'd0;
    
    #1;
    if (w_outresult !== 8'h00 || w_outflags !== 4'b1011) begin
        $display("FAIL: 0xFF + 0x01 | Result: %h | Flags: %b", w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0xFF + 0x01");
    end
    
    #40;
    r_a = 8'h80;
    r_b = 8'h80;
    r_operation = 5'd0;
    r_flags = 4'd0;
    r_bit_index = 3'd0;

    #1;
    if (w_outresult !== 8'h00 || w_outflags !== 4'b1001) begin
        $display("FAIL: 0x80 + 0x80 | Result: %h | Flags: %b", w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0x80 + 0x80");
    end

    #40;
    r_a = 8'h00;
    r_b = 8'h00;
    r_operation = 5'd0;
    r_flags = 4'd0;
    r_bit_index = 3'd0;

    #1;
    if (w_outresult !== 8'h00 || w_outflags !== 4'b1000) begin
        $display("FAIL: 0x00 + 0x00 | Result: %h | Flags: %b", w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0x00 + 0x00");
    end

    #40;
    r_a = 8'h01;
    r_b = 8'h01;
    r_operation = 5'd0;
    r_flags = 4'b1111;
    r_bit_index = 3'd0;

    #1;
    if (w_outresult !== 8'h02 || w_outflags !== 4'b0000) begin
        $display("FAIL: 0x01 + 0x01 | Result: %h | Flags: %b",
                 w_outresult, w_outflags);
    end
    else begin
        $display("PASS: 0x01 + 0x01 | Incoming flags cleared");
    end

    #40;
    $finish;

end

endmodule