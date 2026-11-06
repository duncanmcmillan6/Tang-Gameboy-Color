module alu8(
    input wire [7:0] i_a,
    input wire [7:0] i_b,
    input wire [4:0] i_operation,
    input wire [3:0] i_flags,
    input wire [2:0] i_bit_index,
    
    output reg [7:0] o_result,
    output reg [3:0] o_flags
);

    localparam [4:0]
        ALU_ADD = 5'd0,
        ALU_ADC = 5'd1,
        ALU_SUB = 5'd2,
        ALU_SBC = 5'd3,
        ALU_CP = 5'd4,
        ALU_INC = 5'd5,
        ALU_DEC = 5'd6,
        ALU_AND = 5'd7,
        ALU_OR = 5'd8,
        ALU_XOR = 5'd9,
        ALU_RLC = 5'd10,
        ALU_RL = 5'd11,
        ALU_RRC = 5'd12,
        ALU_RR = 5'd13,
        ALU_RLCA = 5'd14,
        ALU_RLA = 5'd15,
        ALU_RRCA = 5'd16,
        ALU_RRA = 5'd17,
        ALU_SLA = 5'd18,
        ALU_SRA = 5'd19,
        ALU_SRL = 5'd20,
        ALU_SWAP = 5'd21,
        ALU_BIT = 5'd22,
        ALU_SET = 5'd23,
        ALU_RES = 5'd24,
        ALU_DAA = 5'd25,
        ALU_CPL = 5'd26,
        ALU_SCF = 5'd27,
        ALU_CCF = 5'd28;

    reg [8:0] r_sum;
    reg [4:0] r_half_sum;

    always @(*) begin
        o_result = i_a;
        o_flags = i_flags;

        r_sum = 9'd0;
        r_half_sum = 5'd0;

        case(i_operation)
            ALU_ADD: begin
                r_sum = {1'b0, i_a} + {1'b0, i_b};
                r_half_sum = {1'b0, i_a[3:0]} + {1'b0, i_b[3:0]};
                o_result = r_sum[7:0];
                
                o_flags[3] = (o_result == 8'h00);
                o_flags[2] = 1'b0;
                o_flags[1]= r_half_sum[4];
                o_flags[0] = r_sum[8];
            end

            default: begin

            end

        endcase

    end

endmodule