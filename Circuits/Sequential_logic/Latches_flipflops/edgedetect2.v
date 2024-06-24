module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] d_last;
    always @(posedge clk)   begin
        d_last <= in;
        for(int i=0;i<8;i=i+1)  begin
            if(d_last[i] ^ in[i])
                anyedge[i] <= 1'b1;
            else
                anyedge[i] <= 1'b0;
        end
    end

endmodule
