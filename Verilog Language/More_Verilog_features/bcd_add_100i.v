module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire carry[99:1];
    genvar i;
    generate
        for(i=0;i<100;i=i+1)    begin: gen
            bcd_fadd b_X(.a({a[4*i + 3], a[4*i + 2], a[4*i + 1], a[4*i]}), 
                    .b({b[4*i + 3], b[4*i + 2], b[4*i + 1], b[4*i]}), 
                    .cin(i==0 ? cin: carry[i]),
                    .cout(i==99 ? cout : carry[i+1]),
                    .sum({sum[4*i + 3], sum[4*i + 2], sum[4*i + 1], sum[4*i]}));
        end: gen
    endgenerate

endmodule
