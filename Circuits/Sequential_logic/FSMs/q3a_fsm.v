module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    localparam [1:0] A=2'b00, B=2'b01;
    reg [1:0] state, next;
    reg [1:0] cycle, count;
    
    always @(*) begin
        case(state)
            A: next = s? B:A;
            B: next = B;
        endcase
    end
    
    always @(posedge clk)  begin
        if(reset)  begin
            state <= A;
            count <= 0;
            cycle <= 0;
        end
        else  begin
            state <= next;
            if(state==B)  begin
                if(cycle==3) begin
                    count = 0;
                    cycle = 0;
                end
                cycle = cycle+1;
                if(w)
                    count = count+1;
            end
        end
    end
    
    assign z = (cycle==3)&(count==2);
    
endmodule
