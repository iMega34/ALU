
module RAM_tb;
    reg clk;
    reg [31:0] data_in;
    reg [7:0] address;
    reg write_enable;
    wire [31:0] data_out;

    RAM dut (
        .data_out(data_out),
        .address(address),
        .data_in(data_in),
        .write_enable(write_enable),
        .clk(clk)
    );

    always #5 clk = ~clk; // Generate continuous clock signal

    initial begin
        // Initialize inputs
        address = 8'h00;
        data_in = 32'h12345678;
        write_enable = 1'b1;
        clk = 1'b0;

        // Apply inputs
        #10 address = 8'h0A;
        #10 data_in = 32'hABCDEF01;
        #10 write_enable = 1'b1;
        #10; // Wait for one clock cycle

        // Read data_out
        #10 address = 8'h0A; // Read from the same address
        #10 write_enable = 1'b0;
        #20; // Wait for two clock cycles

    end

endmodule