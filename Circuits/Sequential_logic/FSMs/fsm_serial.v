module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    localparam [2:0] IDLE = 3'b000,
                     START = 3'b001,
                     TRANSMIT = 3'b010,
                     WAIT = 3'b011,
                     STOP = 3'b100;
               
    reg [2:0] state, next_state;
    reg [3:0] i;
    
    always @(*)  begin
        case(state)
            IDLE : next_state = in? IDLE:START;
            START: next_state = TRANSMIT;
            TRANSMIT: begin
                if(i==8)   begin
                    if(in)
                        next_state = STOP;
                    else
                        next_state = WAIT;
                end
                else
                    next_state = TRANSMIT;
            end
            WAIT : next_state = in? IDLE : WAIT;
            STOP : next_state = in? IDLE : START;
        endcase
    end
    
    always @(posedge clk)   begin
        if(reset)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always @(posedge clk)  begin
        if(reset)  begin
           done <= 0;
            i <= 0;
        end
        else     begin
            case(next_state)
                TRANSMIT: begin
                   done <= 0;
                    i <= i+1;
                end
                STOP:  begin
                   done <= 1;
                   i <= 0;
                end
                default:  begin
                    done <= 0;
                    i <= 0;
                end
            endcase
        end
    end

endmodule
