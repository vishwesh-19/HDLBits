module top_module (input a, input b, input c, output out);//

    //andgate inst1 ( a, b, c, out );
    wire out_b;
    andgate inst1(out_b, a, b, c, 1, 1);
    assign out = ~out_b;

endmodule
