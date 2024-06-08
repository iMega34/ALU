
module n_bit_adder #(parameter N = 32) (
    input [N - 1:0] a, b,
    output [N - 1:0] result,
    output wire carry_out
);

    wire [N - 1:0] carry;
    genvar i;

    generate
        for (i = 0; i < N; i = i + 1) begin : adder
            if (i == 0)
                half_adder ha(a[0], b[0], result[0], carry[0]);
            else
                full_adder fa(a[i], b[i], carry[i - 1], result[i], carry[i]);
        end

        assign carry_out = carry[N - 1];
    endgenerate

endmodule

module half_adder (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder (
    input a, b, cin,
    output sum, carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule