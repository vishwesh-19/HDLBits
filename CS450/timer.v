module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] count;
    
    always @(posedge clk)  begin
        if(load)
            count <= data;
        else  begin
            if(count > 0)
                count <= count-1;
        end
    end
    
    assign tc = (count==0);

endmodule
