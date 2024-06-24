module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @(posedge clk)    begin
        if(~clk)
            Q <= 1'b0;
        else  begin
           Q <= L ? r_in:q_in;  
        end
    end
endmodule
