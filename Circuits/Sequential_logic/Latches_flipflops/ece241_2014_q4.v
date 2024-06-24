module top_module (
    input clk,
    input x,
    output z
); 
    reg q0=1'b0, q1=1'b0, q2=1'b0, q0b=1'b1, q1b=1'b1, q2b=1'b1;
    always @(posedge clk)   begin
        if(clk)   begin
            q0 <= x ^ q0;
            q0b <= ~(x ^ q0);
            
            q1 <= x & q1b;
            q1b <= ~(x & q1b);
            
            q2 <= x | q2b;
            q2b <= ~(x | q2b);
        end
        
        else    begin
            q0 <= q0;
            q1 <= q1;
            q2 <= q2;
            
            q0b <= q0b;
            q1b <= q1b;
            q2b <= q2b;
        end
    end
    
    assign z = ~(q0|q1|q2);
    endmodule
