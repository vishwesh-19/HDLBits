module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);

    always @(negedge clk)    begin
        if(~reset)
            q <= d;
        else
            q <= 7'b0110100;
    end
endmodule
