
module InstructionMemory (
    input clk, reset,
    input [31:0] read_address,
    output [31:0] instruction
);
    reg [31:0] memory [31:0];
    integer i;

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                memory[i] <= 32'h0;
            end
        end
        else begin
            /*
            Algoritmo de prueba -> Serie de Fibonacci

            Valores iniciales:
                a = 0
                b = 1
                Resultado de la sumatoria = 0

            Formato de las instrucciones:
            R-Type:
                | Func7 Bits[31:25] | Register Source2 Bits[24:20] | Register Source1 Bits[19:15] | Func3 Bits[14:12] | Register Destination Bits[11:7] | Opcode Bits[6:0] |
            I-Type:
                | Offset Bits[31:20] | Memory Location Bits[19:15] | Func3 Bits[14:12] | Register Destination Bits[11:7] | Opcode Bits[6:0] |
            S-Type:
                | Offset2 Bits[31:25] | Register Source Bits[24:20] | Memory Location Bits[19:15] | Func3 Bits[14:12] | Offset1 Bits[11:7] | Opcode Bits[6:0] |
            */

            // Primera instrucción -> Suma el registro x0 con el registro x1
            memory[1] <= 32'b0000000_00001_00000_000_00010_0110011; // add x2, x1, x0 -> 0 + 1 = 1

            // Programa principal como un "bucle", obtiene hasta 13er término de la serie de Fibonacci
            // 1ra iteración -> 1 + 0 = 2
            memory[2] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 1 + 1 = 2
            memory[3] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[4] <= 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
            // 2da iteración -> 1 + 1 = 3
            memory[5] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 1 + 2 = 3
            memory[6] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[7] <= 32'b000000000000_00000_010_00010_0000011; // lw x2, 0(x0)
            // 3ra iteración -> 2 + 1 = 5
            memory[8] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 2 + 3 = 5
            memory[9] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[10] <= 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
            // 4ta iteración -> 3 + 2 = 8
            memory[11] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 3 + 5 = 8
            memory[12] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[13] <= 32'b000000000000_00000_010_00010_0000011; // lw x2, 0(x0)
            // 5ta iteración -> 5 + 3 = 13
            memory[14] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 5 + 8 = 13
            memory[15] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[16] <= 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
            // 6ta iteración -> 8 + 5 = 21
            memory[17] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 8 + 13 = 21
            memory[18] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[19] <= 32'b000000000000_00000_010_00010_0000011; // lw x2, 0(x0)
            // 7ma iteración -> 13 + 8 = 34
            memory[20] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 13 + 21 = 34
            memory[21] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[22] <= 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
            // 8va iteración -> 21 + 13 = 55
            memory[23] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 21 + 34 = 55
            memory[24] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[25] <= 32'b000000000000_00000_010_00010_0000011; // lw x2, 0(x0)
            // 9na iteración -> 34 + 21 = 89
            memory[26] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 34 + 55 = 89
            memory[27] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[28] <= 32'b000000000000_00000_010_00001_0000011; // lw x1, 0(x0)
            // 10ma iteración -> 55 + 34 = 144
            memory[29] <= 32'b0000000_00010_00001_000_00011_0110011; // add x3, x2, x1 -> 55 + 89 = 144
            memory[30] <= 32'b0000000_00011_00000_000_00000_0100011; // sw x3, 0(x0)
            memory[31] <= 32'b000000000000_00000_010_00010_0000011; // lw x2, 0(x0)

            /* Programa de prueba de operaciones lógicas y aritméticas */
            // memory[1] <= 32'b0000000_00000_00001_000_00010_0110011; // adcs x0, x1, x2
            // memory[2] <= 32'b0000000_00010_00101_001_11010_0110011; // sbcs x2, x5, x26
            // memory[3] <= 32'b0100000_00110_01000_010_10010_0110011; // rsbs x6, x8, x18
            // memory[4] <= 32'b0100000_00101_01011_011_11100_0110011; // muls x5, x11, x28
            // memory[5] <= 32'b0100000_00011_00010_010_00101_0100011; // sw x5, 3(x2) -> store word in memory at x2 + 3
            // memory[6] <= 32'b0000000_00011_00010_010_00111_0000011; // lw x7, 3(x2) -> load word from memory at x2 + 3 into x7
            // memory[7] <= 32'b0000000_10000_00111_000_01000_0110011; // adcs x16, x7, x8 -> sum x7 with x8 and store in x16
            // memory[8] <= 32'b0000000_00110_01110_111_11110_0110011; // ands x6, x14, x30
            // memory[9] <= 32'b0100000_00100_10001_111_01001_0110011; // cmp x9, x17, x4
        end
    end

    assign instruction = memory[read_address];

endmodule
