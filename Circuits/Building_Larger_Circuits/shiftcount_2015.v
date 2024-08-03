module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    reg [3:0] q_out;
    
    always @(posedge clk)   begin
        if(shift_ena)  begin
            q_out = q_out<<1;
            q_out[0] = data;
            
        end
        else if(count_ena)   begin
            if(q_out==4'b0000)
                q_out <= 4'b1111;
            else
                q_out <= q_out-1;
        end
    end

    assign q = q_out;
endmodule
