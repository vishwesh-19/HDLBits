module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] count;
    
    always @(posedge clk or posedge areset)  begin
        if(areset)
            count <= 2'b01;
        else
            case({train_valid, train_taken})
            2'b11: begin
                if(count<3)
                    count = count+1;
            end
            2'b10: begin
                if(count>0)
                    count = count-1;
            end
            default: count = count;
        endcase
    end

    assign state = count;
endmodule
