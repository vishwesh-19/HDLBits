module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [2:0] buff;
    
    always @(posedge clk)    begin
        if(resetn)   begin
            buff[2] <= in;
            buff[1] <= buff[2];
            buff[0] <= buff[1];
            out <= buff[0];
        end
        
        else   begin
            buff <= 3'b0;
            out <= 1'b0;
        end
    end

endmodule
