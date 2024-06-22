module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    wire [99:0] buff;
    
    always @(*)   begin
        for(i=0;i<100;i=i+1)  begin
            buff[i] = in[99-i]; 
        end
    end
    
    assign out = buff;
endmodule
