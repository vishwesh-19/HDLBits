module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    wire [511:0] q_left;
    wire [511:0] q_right;
    
    assign q_left = q>>1;
    assign q_right = q<<1;
    
    always @(posedge clk)    begin
        if(load)
            q <= data;
        else      begin
            q <= (q ^ q_right)|(q & ~q_left);
        end
    end

endmodule
