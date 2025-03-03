module up_down_counter (
    input wire clk,          // Clock signal
    input wire reset,       // Reset signal
    input wire up_down,     // Control signal: 1 for up, 0 for down
    output reg [3:0] count  // 4-bit counter output
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;   // Reset counter to 0
    else if (up_down)
        count <= count + 1; // Count up
    else
        count <= count - 1; // Count down
end

endmodule