module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    full_adder add0(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    genvar i;
    generate  begin
        for(i=1; i<100; i=i+1)  begin: gen
            full_adder add1(.a(a[i]), .b(b[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
        end: gen
    end
    endgenerate
endmodule

module full_adder(input a, 
                  input b, 
                  input cin, 
                  output sum,
                  output cout);
    assign {cout, sum} = a+b+cin;
endmodule
