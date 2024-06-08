
module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] opcode,
    output reg [31:0] result,
    output reg negative,
    output reg zero,
    output reg carry,
    output reg overflow
);

    wire [31:0] add_result;
    wire [31:0] sub_result;
    wire [31:0] mul_result;
    wire add_carry;
    wire sub_carry;

    n_bit_adder ADDER(
        .a(a),
        .b(b),
        .result(add_result),
        .carry_out(add_carry)
    );

    n_bit_adder SUBSTRACTOR(
        .a(a),
        .b(~b + 1),
        .result(sub_result),
        .carry_out(sub_cary)
    );

    multiplier MULTIPLIER(
        .a(a),
        .b(b),
        .result(mul_result)
    );

    initial begin
        result = 32'h0;
        negative = 0;
        zero = 0;
        carry = 0;
        overflow = 0;
    end

    always @(opcode or a or b) begin
        case (opcode)
            0: // ADCS -> Add with carry
                begin
                    result = add_result;
                    carry = add_carry;
                    negative = add_result[31];
                end

            1: // ADD -> Add without carry
                begin
                    result = add_result;
                    negative = add_result[31];
                end

            2: // SBCS -> Subtract with carry
                begin
                    result = sub_result;
                    carry = ~sub_carry;
                    negative = sub_result[31];
                end

            3 : // SUBS -> Substract without carry
                begin
                    result = sub_result;
                    negative = sub_result[31];
                end

            4: // RSBS -> Reverse substract
                begin
                    result = ~sub_result + 1;
                    negative = sub_result[31];
                end

            5: // MULS -> Multiply
                result = mul_result[31:0];

            6: // ANDS -> Logical AND
                result = a & b;

            7: // ORRS -> Logical OR
                result = a | b;

            8: // CMP -> Compare greater than, less than or equal
                begin
                    if (a == b) begin
                        zero = 1;
                        negative = 0;
                    end
                    else if (a < b) begin
                        zero = 0;
                        negative = 1;
                    end
                    else begin
                        zero = 0;
                        negative = 0;
                    end
                end
        endcase
    end

endmodule
