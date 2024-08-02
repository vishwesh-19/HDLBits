module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    localparam [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
    reg [2:0] state, next;
    
    always @(*)  begin
        case(state)
            A: next = x? B:A;
            B: next = x? E:B;
            C: next = x? B:C;
            D: next = x? C:B;
            E: next = x? E:D;
        endcase
    end
    
    always @(posedge clk)   begin
        if(reset)
            state <= A;
        else
            state <= next;
    end
    
    assign z = (state==D || state==E);
endmodule
