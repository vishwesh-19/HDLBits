module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire t;
    always @(posedge clk)   begin
        if(clk)
            Q <= L ? R : (E ? w : Q);
        else 
            Q <= 1'b0;
    end

endmodule
