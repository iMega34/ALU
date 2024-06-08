
module ALU_tb;

    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] op_code;
    wire [31:0] result;
    wire [1:0] comp;
    wire carry;

    operaciones_alu DUT (
        .a(a),
        .b(b),
        .op_code(op_code),
        .result(result),
        .comp(comp),
        .carry(carry)
    );

    initial begin
        // Test case 1: ADCS -> Add with carry
        a = 35;
        b = 25;
        op_code = 4'b0000;
        #10;
        $display("ADCS: a = %d, b = %d, result = %d, carry = %b", a, b, result, carry);

        // Test case 2: ADD -> Add without carry
        op_code = 4'b0001;
        #10;
        $display("ADD: a = %d, b = %d, result = %d", a, b, result);

        // Test case 3: SBCS -> Subtract with carry
        op_code = 4'b0010;
        #10;
        $display("SBCS: a = %d, b = %d, result = %d, carry = %b", a, b, result, carry);

        // Test case 4: SUBS -> Subtract without carry
        op_code = 4'b0011;
        #10;
        $display("SUBS: a = %d, b = %d, result = %d", a, b, result);

        // Test case 5: RSBS -> Reverse subtract
        op_code = 4'b0100;
        #10;
        $display("RSBS: a = %d, b = %d, result = %d", a, b, result);

        // Test case 6: MULS -> Multiply
        op_code = 4'b0101;
        #10;
        $display("MULS: a = %d, b = %d, result = %d", a, b, result);

        // Test case 7: ANDS -> Logical AND
        op_code = 4'b0110;
        #10;
        $display("ANDS: a = %d, b = %d, result = %d", a, b, result);

        // Test case 8: ORRS -> Logical OR
        op_code = 4'b0111;
        #10;
        $display("ORRS: a = %d, b = %d, result = %d", a, b, result);

        // Test case 9: CMP -> Compare greater than, less than or equal
        op_code = 4'b1000;
        #10;
        $display("CMP: a = %d, b = %d, comp = %b", a, b, comp);
    end

endmodule