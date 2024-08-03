module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    localparam [6:1] A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000;
    
    assign Y2 = ~w & y[1];
    assign Y4 = w & (y[2] | y[3] | y[5] | y[6]);

endmodule
