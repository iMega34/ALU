
module multiplier #(parameter N = 16) (
    input [N - 1:0] a, b,
    output reg[2*N - 1:0] result
);

    integer i;
    reg [2*N - 1:0] temp_product;

    always @(*) begin
        temp_product = 0;
        for (i = 0; i < N; i = i + 1) begin
            if (b[i])
                temp_product = temp_product + (a << i);
        end

        result = temp_product;
    end
endmodule
