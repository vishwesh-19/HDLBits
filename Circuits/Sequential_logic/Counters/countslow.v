module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk)   begin
        if(reset)
            q <= 4'b0000;
        
        else      begin
            if(slowena)
                q <= (q==4'd9) ? 4'd0 : q+1;
            else
                q <= q;
        end
    end

endmodule
