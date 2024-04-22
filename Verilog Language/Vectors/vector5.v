module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... }; 
    wire [4:0] x = {a,b,c,d,e};
    wire [4:0] x_a = {5{a}};
    wire [4:0] x_b = {5{b}};
    wire [4:0] x_c = {5{c}};
    wire [4:0] x_d = {5{d}};
    wire [4:0] x_e = {5{e}};
    assign out = ~{5{x}}^{x_a,x_b,x_c,x_d,x_e};

endmodule
