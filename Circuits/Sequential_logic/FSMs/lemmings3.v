module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    parameter left=0, right=1, fall_l=2, fall_r=3, dig_l=4, dig_r=5;
    reg [2:0] state, next_state;
    
    always @(*)    begin
        case(state)
            left:  begin
                if(~ground)
                    next_state <= fall_l;
                else if(ground & dig)
                    next_state <= dig_l;
                else if(bump_left)
                     next_state <= right;
                else
                     next_state <= left;
                
            end
            right:  begin
                if(~ground)
                    next_state <= fall_r;
                else if(ground & dig)
                    next_state <= dig_r;
                else if(bump_right)
                    next_state <= left;
                else
                    next_state <= right;
            end
            fall_l:  begin
                if(ground)
                    next_state <= left;
                else
                    next_state <= fall_l;
            end
            fall_r:  begin
                if(ground)
                    next_state <= right;
                else
                    next_state <= fall_r;
            end
            dig_l: begin
                if(~ground)
                    next_state <= fall_l;
                else
                    next_state <= dig_l;
            end
            dig_r:    begin
                if(~ground)
                    next_state <= fall_r;
                else
                    next_state <= dig_r;
            end
                
        endcase
    end
    
    always @(posedge clk or posedge areset)   begin
        if(areset)
            state <= left;
        else
            state <= next_state;
    end
    
    assign walk_left = (state==left);
    assign walk_right = (state==right);
    assign aaah = (state==fall_l)|(state==fall_r);
    assign digging = (state==dig_l)|(state==dig_r);
endmodule
