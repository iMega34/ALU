
module CPU_tb;

    reg clk, reset;

    CPU dut (
        .clk(clk),
        .reset(reset)
    );

    initial begin
        // Initialize inputs
        clk = 0;
    end

    always begin
        #50 clk = ~clk;
    end

    initial begin
        // Reset
        reset = 1;
        #50 reset = 0;
        #3200;
        $stop;
    end

endmodule


