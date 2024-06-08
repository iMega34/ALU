
module MUX (
    input select,
    input [31:0] a, b,
    output [31:0] mux_output
);

    assign mux_output = select ? a : b;

endmodule
