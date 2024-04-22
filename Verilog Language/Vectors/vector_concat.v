module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    wire [31:0] buffer = {a,b,c,d,e,f,2'b11};
 
    assign w = buffer[31:24];
    assign x = buffer[23:16];
    assign y = buffer[15:8];
    assign z = buffer[7:0];
endmodule
