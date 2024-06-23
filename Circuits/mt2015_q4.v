module top_module (input x, input y, output z);

    wire t1,t2,t3,t4,t5,t6;
    A a1(x,y,t1);
    B b1(x,y,t2);
    A a2(x,y,t3);
    B b2(x,y,t4);
    
    or(t5,t1,t2);
    and(t6,t3,t4);
    xor(z,t5,t6);
endmodule

module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B (input x, input y, output z);
    xnor(z,x,y);
endmodule
