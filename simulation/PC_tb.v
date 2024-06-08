
module PC_tb;
    reg rst_n_a, clk, pc_write;
    reg [31:0] pc_next;
    wire [31:0] pc_result;

    PC dut (
        .rst_n_a(rst_n_a),
        .clk(clk),
        .pc_write(pc_write),
        .pc_next(pc_next),
        .pc_result(pc_result)
    );

    initial begin
        // Test case 1: Reset
        rst_n_a = 0;
        clk = 0;
        pc_write = 0;
        pc_next = 32'h1234;
        #10;
        rst_n_a = 1;
        #10;

        // Test case 2: Write
        rst_n_a = 1;
        clk = 0;
        pc_write = 1;
        pc_next = 32'h5678;
        #10;
        clk = 1;
        #10;

        // Test case 3: No write
        rst_n_a = 1;
        clk = 0;
        pc_write = 0;
        pc_next = 32'h9abc;
        #10;
        clk = 1;
        #10;

    end

endmodule
