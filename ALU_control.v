
module ALUControl (
    input [1:0] alu_opcode,
    input func7,
    input [2:0] func3,
    output reg [3:0] alu_control
);

    always @(*) begin
        case (alu_opcode)
            2'b00: alu_control <= 0; // I-type -> Load instructions
            2'b01: alu_control <= 1; // SB-type -> Branch instructions
            2'b10: // R-type -> Arithmetic and logic operations
                case ({func7, func3})
                    6'b0_000: alu_control <= 0; // ADCS -> Add with carry
                    6'b1_000: alu_control <= 1; // ADD -> Add without carry
                    6'b0_001: alu_control <= 2; // SBCS -> Substract with carry
                    6'b1_001: alu_control <= 3; // SUBS -> Substract without carry
                    6'b1_010: alu_control <= 4; // RSBS -> Reverse substract
                    6'b1_011: alu_control <= 5; // MULS -> Multiply
                    6'b0_111: alu_control <= 6; // ANDS -> Logical AND
                    6'b0_110: alu_control <= 7; // ORRS -> Logical OR
                    6'b1_111: alu_control <= 8; // CMP -> Compare greater than, less than or equal
                    default: alu_control <= 0; // ADCS -> Add with carry
                endcase
            default: alu_control <= 0; // I-type -> Load instructions
        endcase
    end

endmodule
