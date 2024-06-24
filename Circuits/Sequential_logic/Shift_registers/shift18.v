module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @(posedge clk)    begin
        if(load)
            q <= data;
        
        else       begin
            if(ena)   begin
                if(amount==2'b00)   begin
                    q[0] <= 1'b0;
                    for(int i=0; i<63; i=i+1)
                        q[i+1] <= q[i]; 
                end
                
                else if(amount==2'b01)    begin
                    q[7:0] <= 8'd0;
                    for(int i=8; i<64; i=i+1)
                        q[i] <= q[i-4'd8];
                end
                
                else if(amount==2'b10)    begin
                    for(int i=0; i<63; i=i+1)
                        q[i] <= q[i+1];
                end
                
                else if(amount==2'b11)  begin
                    q[63:56] <= {8{q[63]}};
                    for(int i=0; i<56; i=i+1)
                        q[i] <= q[i+4'd8];
                end
            end
            
            else
                q <= q;
        end
    end

endmodule
