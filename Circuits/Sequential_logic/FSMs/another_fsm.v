module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    localparam [3:0] A=0, B=1, C=2, X1=3, X10=4, X101=5, Y1=6, Y0=7, END=8;
    reg [3:0] state, next;
    
    always @(*)   begin
        case(state)
            A: next = B;
            B: begin
               //f=1;
               next = C;
            end
            C: next = x? X1:C;
            X1: next = x? X1:X10;
            X10: next = x? X101:C;
            X101: next = y? Y1:Y0;
            Y0: begin
                //g = 1;
                next = y? Y1:END;
            end
            Y1: begin 
                next = Y1;
            end
            END: next = END;
        endcase
    end
    
    always @(posedge clk)  begin
        if(!resetn)
            state <= A;
        else
            state <= next;
    end

    assign f = state==B;
    assign g = (state== X101 | state==Y0 | state==Y1);
    
endmodule
