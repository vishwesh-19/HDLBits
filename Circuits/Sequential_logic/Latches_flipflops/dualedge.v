module top_module (
    input clk,
    input d,
    output q
);
    reg s_p, s_n;
    always @(posedge clk)  begin
        s_p <= d;
    end
    
    always @(negedge clk)  begin
       s_n <= d;
    end

    assign q = clk? s_p:s_n; 
endmodule
