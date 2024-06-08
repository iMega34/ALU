
module DataMemory (
    input clk, reset,
    input mem_read, mem_write,
    input [4:0] address,
    input [31:0] data_input,
    output reg [31:0] data_output
);

    reg [31:0] memory [31:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                memory[i] <= 32'h0;
        end
        else if (mem_write)
            memory[address] <= data_input;
    end

    always @(*) begin
        if (mem_read)
            data_output <= memory[address];
        else
            data_output = 32'h0;
    end

endmodule
