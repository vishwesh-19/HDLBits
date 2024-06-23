module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    reg [1:0] count;
    always @(*)   begin
        count = 3'b000;
        for(int i=0;i<3;i=i+1)  begin
            if(in[i]==1'b1)
                count = count+1;
            else
                count = count;
        end
    end
    
    assign out = count;

endmodule
