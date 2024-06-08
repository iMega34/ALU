
module RegisterFile (
    input clk, reset,
    input write_enable,
    input [4:0] reg_src1, reg_src2, reg_dest,
    input [31:0] data_input,
    output reg [31:0] read_data1, read_data2
);

    reg [31:0] registers [31:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'h0;
            registers[1] <= 1;
        end
        else if (write_enable)
            registers[reg_dest] <= data_input;
    end

    always @(*) begin
        read_data1 = registers[reg_src1];
        read_data2 = registers[reg_src2];
    end

endmodule
