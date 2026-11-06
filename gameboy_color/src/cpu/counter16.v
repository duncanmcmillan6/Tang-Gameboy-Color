module sixteenbit_counter(input wire i_clk, input wire i_reset, input wire i_increment, input wire i_load, input wire [15:0] i_address, output reg [15:0] o_counter);

    always @(posedge i_clk)
    begin
        if(i_reset == 1'b1)
        begin
            o_counter <= 16'b0;
        end
        else if(i_load == 1'b1)
        begin
            o_counter <= i_address;
        end
        else if(i_increment == 1'b1)
        begin
            o_counter <= o_counter + 16'd1;
        end
    end

endmodule