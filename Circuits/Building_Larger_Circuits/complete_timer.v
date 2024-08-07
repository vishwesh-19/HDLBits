module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    localparam [2:0] S=0, S1=1, S11=2, S110=3, SHIFT=4 , COUNT=5, DONE=6;
    reg [2:0] state, next;
    reg [1:0] i; // For indexing of delay value
    reg [3:0] delay;
    reg [9:0] k_count; // mod 1000 counter
    
    always @(*)   begin
        case(state)
            S    : next = data? S1:S;
            S1   : next = data? S11:S;
            S11  : next = data? S11:S110;
            S110 : next = data? SHIFT:S;
            SHIFT: next = (i==0)? COUNT:SHIFT;
            COUNT: next = (delay==0 & k_count==999)? DONE:COUNT;
            DONE : next = ack? S:DONE;
        endcase
    end
        always @(posedge clk)  begin
            if(reset)
                state <= S;
            else
                state <= next;
        end
        
        always @(posedge clk)   begin
            case(state)
                SHIFT: begin
                    if(i>0)
                        i<=i-1;
                    else
                        i<=3;
                    delay[i] <= data;
                    k_count <= 0;
                end
                COUNT: begin
                    if(k_count<999)
                        k_count <= k_count+1;
                    else  begin
                        k_count <= 0;
                        delay <= (delay>0)? delay-1:0;
                    end
                end
                default: begin
                    i <= 3;
                    k_count <= 0;
                    delay <= 0;
                end
            endcase
        end
        
        // Next state logic for loading count_val using delay value
        assign done = (state==DONE);
        assign counting = (state==COUNT);
        assign count = delay;
        
    
endmodule
