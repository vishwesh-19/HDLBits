module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    localparam [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    reg [1:0] state, next;
    reg g1, g2, g3;
    
    always @(*)  begin
        case(state)
            A: begin
                if(r==3'b000)
                    next = A;
                else if(r[1])
                    next = B;
                else if(r[2] & ~r[1])
                    next = C;
                else if(r==3'b100)
                    next = D;
                g1=0;
                g2=0;
                g3=0;
            end
            B: begin
                next = r[1]? B:A;
                g1=1;
                g2=0;
                g3=0;
            end
            C: begin
                next = r[2]? C:A;
                g1=0;
                g2=1;
                g3=0;
            end
            D: begin
                next = r[3]? D:A;
                g1=0;
                g2=0;
                g3=1;
            end
        endcase
    end
    
    always @(posedge clk)  begin
        if(~resetn)
            state <= A;
        else
            state <= next;
    end

    assign g = {g3,g2,g1};
endmodule
