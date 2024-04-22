module top_module( 
    input a, 
    input b, 
    output out );
    wire x, y;
    and(x, ~a, ~b);
    and(y, a, b);
    or(out, x, y);
endmodule
