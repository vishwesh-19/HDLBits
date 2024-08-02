module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    localparam [3:0] IDLE=0, BIT1=1, BIT2=2, BIT3=3, BIT4=4, 
                     BIT5=5, BIT6=6, discard=7, flg=8, error=9;
    
    reg [3:0] state, next;
    
    always @(*)  begin
        case(state)
            IDLE   : next = in? BIT1:IDLE;
            BIT1   : next = in? BIT2:IDLE;
            BIT2   : next = in? BIT3:IDLE;
            BIT3   : next = in? BIT4:IDLE;
            BIT4   : next = in? BIT5:IDLE;
            BIT5   : next = in? BIT6:discard;
            BIT6   : next = in? error:flg;
            discard: next = in? BIT1:IDLE;
            flg    : next = in? BIT1:IDLE;
            error  : next = in? error:IDLE;
        endcase
    end
    
    always @(posedge clk)   begin
        if(reset)
            state <= IDLE;
        else
            state <= next;
    end
    
    assign disc = (state == discard);
    assign flag = (state == flg);
    assign err = (state == error);
endmodule
