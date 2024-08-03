module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    localparam [2:0] IDLE=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0] state, next;
    
    always @(*)  begin
        case(state)
            IDLE: next = reset? S1:IDLE;
            S1  : next = S2;
            S2  : next = S3;
            S3  : next = S4;
            S4  : next = IDLE;
        endcase
    end
    
    always @(posedge clk)  begin
       state <= next;
    end

    assign shift_ena = (state!=IDLE);
endmodule
