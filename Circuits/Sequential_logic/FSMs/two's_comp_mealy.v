module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    localparam A=0, B=1;
    reg [1:0] state, next;
    
    always @(*)   begin
        case(state)
            A: begin
                if(x)  begin
                   next = B;
                   z = 1;
                end
                else   begin
                   next = A;
                    z = 0;
                end
            end
            B: begin
               next = B;
                if(x)
                    z = 0;
                else
                    z = 1;
            end
        endcase
    end

    always @(posedge clk or posedge areset)   begin
        if(areset)
            state <= A;
        else
            state <= next;
    end
endmodule
