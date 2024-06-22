module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] int_res1 = a<b ? a:b;
    wire [7:0] int_res2 = c<d ? c:d;
    
    assign min = int_res1<int_res2 ? int_res1:int_res2;

endmodule
