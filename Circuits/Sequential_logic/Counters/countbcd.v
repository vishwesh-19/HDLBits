module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena = {q[11:8]==4'd9 & q[7:4]==4'd9 & q[3:0]==4'd9,
                     q[7:4]==4'd9 & q[3:0]==4'd9,
                     q[3:0]==4'd9};
    bcd_count bcd0(clk, reset, 1'b1, q[3:0]);
    bcd_count bcd1(clk, reset, ena[1], q[7:4]);
    bcd_count bcd2(clk, reset, ena[2], q[11:8]);
    bcd_count bcd3(clk, reset, ena[3], q[15:12]);
   
endmodule

module bcd_count(input clk, reset, ena,
                 output [3:0] q);
    
    always @(posedge clk)    begin
        if(reset)
            q <= 4'b0000;
        else   begin
            if(ena)  begin
                if(q==4'd9)
                    q <= 4'd0;
                else
                    q <= q+1;
            end
        end
    end
endmodule
