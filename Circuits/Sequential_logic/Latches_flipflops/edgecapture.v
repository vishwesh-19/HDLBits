module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_last;
    
    always @(posedge clk)      begin
        d_last <= in;
        if(reset)    begin
            out <= 32'd0;
        end
        else    begin
            for(int i=0; i<32; i=i+1)   begin
                if({d_last[i], in[i]} == 2'b10)
                    out[i] <= 1'b1; 
                
                else
                    out[i] <= out[i];
            end
        end
    end
endmodule
