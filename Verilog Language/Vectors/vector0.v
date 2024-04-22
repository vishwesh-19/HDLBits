module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    
    wire x0 = vec[0];
    wire x1 = vec[1];
    wire x2 = vec[2];
    
    assign outv = vec;
    assign o0 = x0;
    assign o1 = x1;
    assign o2 = x2;
    
endmodule
