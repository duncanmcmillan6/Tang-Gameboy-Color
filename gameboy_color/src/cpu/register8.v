module eightbit_reg (input wire i_clk, input wire i_enload, input wire i_reset, input wire [7:0] i_data, output reg [7:0] o_data);

        always @(posedge i_clk)
        begin
            if(i_reset == 1'b1)
            begin
                o_data <= 8'b0;
            end
            else if(i_enload == 1'b1)
            begin
                o_data <= i_data;
            end
        end

endmodule