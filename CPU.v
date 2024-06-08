
module CPU (
    input clk, reset
);

    wire [31:0] w_pc, w_pc_next, w_instruction,
                w_read_data1, w_read_data2, w_to_alu,
                w_alu_control, w_alu_result, w_data_output,
                w_write_back_reg_file, w_offset, w_dest_address;
    wire w_alu_zero, w_alu_negative, w_alu_carry, w_alu_overflow,
         w_reg_write, w_mem_read, w_mem_write, w_mem_to_reg, w_branch, w_alu_src;
    wire [1:0] w_alu_opcode;
    wire [4:0] w_mem_address;
    wire w_is_lw, w_is_sw;

    // Sumador de 4 para PC
    NextPC NextPC (
        .from_pc(w_pc),
        .next_to_pc(w_pc_next)
    );

    // Program Counter
    PC PC (
        .clk(clk),
        .reset(reset),
        .pc_input(w_pc_next),
        .pc_output(w_pc)
    );

    // Memoria de instrucciones
    InstructionMemory InstructionMemory (
        .clk(clk),
        .reset(reset),
        .read_address(w_pc),
        .instruction(w_instruction)
    );

    // Banco de registros (32 registros de 32 bits)
    RegisterFile RegisterFile (
        .clk(clk),
        .reset(reset),
        .write_enable(w_reg_write),
        .reg_src1(w_instruction[19:15]),
        .reg_src2(w_instruction[24:20]),
        .reg_dest(w_instruction[11:7]),
        .data_input(w_write_back_reg_file),
        .read_data1(w_read_data1),
        .read_data2(w_read_data2)
    );

    // ALU
    ALU ALU (
        .a(w_read_data1),
        .b(w_alu_src ? {{20{w_instruction[31]}}, w_instruction[31:20]} : w_read_data2),
        .opcode(w_alu_control),
        .result(w_alu_result),
        .negative(w_alu_negative),
        .zero(w_alu_zero),
        .carry(w_alu_carry),
        .overflow(w_alu_overflow)
    );

    // Unidad de control de la ALU
    ALUControl ALUControl (
        .alu_opcode(w_alu_opcode),
        .func7(w_instruction[30]),
        .func3(w_instruction[14:12]),
        .alu_control(w_alu_control)
    );

    assign w_mem_address = (w_instruction[6:0] == 7'b0110011) ? w_alu_result[4:0] : // R-type -> Arithmetic and logic operations
                           (w_instruction[6:0] == 7'b0000011) ? w_instruction[19:15] + w_instruction[31:20] : // I-type -> Load instructions
                           (w_instruction[6:0] == 7'b0100011) ? w_instruction[19:15] + {w_instruction[31:25], w_instruction[11:7]} : // S-type -> Store instructions
                           0; // Default memory location

    // Memoria de datos
    DataMemory DataMemory (
        .clk(clk),
        .reset(reset),
        .mem_read(w_mem_read),
        .mem_write(w_mem_write),
        .address(w_mem_address),
        .data_input(w_read_data2),
        .data_output(w_data_output)
    );

    // MUX2 -> Selecciona el origen de la entrada 'data_input' del banco de registros
    MUX MUX2 (
        .a(w_data_output),
        .b(w_alu_result),
        .select(w_mem_to_reg),
        .mux_output(w_write_back_reg_file)
    );

    // Unidad de control
    ControlUnit ControlUnit (
        .opcode(w_instruction[6:0]),
        .branch(),
        .memory_read(w_mem_read),
        .memory_to_register(w_mem_to_reg),
        .memory_write(w_mem_write),
        .alu_src(w_alu_src),
        .reg_write(w_reg_write),
        .alu_opcode(w_alu_opcode)
    );

endmodule
