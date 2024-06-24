module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always @(posedge clk)    begin
        if(reset)
            q <= 4'b0000;
        else      begin
            if(q == 4'b1111)
                q <= 4'b0000;
            else
                q <= q+1;
        end
    end

endmodule
