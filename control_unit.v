
module ControlUnit (
    input [6:0] opcode,
    output reg branch, memory_read, memory_to_register, memory_write, alu_src, reg_write,
    output reg [1:0] alu_opcode
);

    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type -> Arithmetic and logic operations
                alu_src <= 0;
                memory_to_register <= 0;
                reg_write <= 1;
                memory_read <= 0;
                memory_write <= 0;
                branch <= 0;
                alu_opcode <= 2'b10;
            end
            7'b0000011: begin // I-type -> Load instructions
                alu_src <= 1;
                memory_to_register <= 1;
                reg_write <= 1;
                memory_read <= 1;
                memory_write <= 0;
                branch <= 0;
                alu_opcode <= 2'b00;
            end
            7'b0100011: begin // S-type -> Store instructions
                alu_src <= 1;
                memory_to_register <= 0;
                reg_write <= 0;
                memory_read <= 0;
                memory_write <= 1;
                branch <= 0;
                alu_opcode <= 2'b00;
            end
            7'b1100011: begin // SB-type -> Branch instructions
                alu_src <= 0;
                memory_to_register <= 0;
                reg_write <= 0;
                memory_read <= 0;
                memory_write <= 0;
                branch <= 1;
                alu_opcode <= 2'b01;
            end
            default: begin // R-type -> Arithmetic and logic operations
                alu_src <= 0;
                memory_to_register <= 0;
                reg_write <= 1;
                memory_read <= 0;
                memory_write <= 0;
                branch <= 0;
                alu_opcode <= 2'b10;
            end
        endcase
    end

endmodule
