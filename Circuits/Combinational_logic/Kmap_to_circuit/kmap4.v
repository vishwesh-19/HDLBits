module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    xor(out, a,b,c,d);
endmodule
