module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 q0(.clk(clk), .in(in), .s(s), .out(out));
    
    initial begin
        in=0;
        s=2;
        clk=0;
        
        #10
        in=0;
        s=6;
        
        #10
        in=1;
        s=2;
        
        #10
        in=2;
        s=7;
        
        #10
        in=1;
        s=0;
        
        #30
        in=0;
        s=0;
    end
    
    always begin
       #5 clk = ~clk; 
    end
endmodule
