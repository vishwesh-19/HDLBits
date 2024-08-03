module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    localparam [2:0] IDLE=3'd0, A=3'd1, B=3'd2, C=3'd3, FINAL=3'd4;
    reg [2:0] state, next;
    
    always @(data)  begin
        case(state)
            IDLE : next = data? A:IDLE;
            A    : next = data? B:IDLE;
            B    : next = data? B:C;
            C    : next = data? FINAL:IDLE;
            FINAL: next = FINAL;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= IDLE;
        else
            state <= next;
    end
    
    assign start_shifting = (state==FINAL);
endmodule
