module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    localparam [1:0] ZERO=2'b00, ONE=2'b01, TWO=2'b10;
    reg [1:0] state, next;
    
    always @(posedge clk or posedge areset)  begin
        if(areset)
            state <= ZERO;
        else
            state <= next;
    end
    
    always @(*)  begin
        case(state)
            ZERO: next = x? ONE:ZERO;
            ONE : next = x? TWO:ONE;
            TWO : next = x? TWO:ONE;
            default: next = ZERO;
        endcase
    end

    assign z = (state==ONE);
    
endmodule
