module tb_up_down_counter;

    reg clk;
    reg reset;
    reg up_down;
    wire [3:0] count;

    // Instantiate the counter
    up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        reset = 1; up_down = 1; // Reset and set to count up
        #20;
        reset = 0; // Release reset
        #50;
        up_down = 0; // Switch to count down
        #50;
        $stop; // End simulation
    end

endmodule