module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    reg [2:0] enable;
    assign enable = {(ena && (mm == 8'h59) && (ss == 8'h59)), (ena && (ss == 8'h59)), ena};
    //assign enable = {(ena && (mm==8'59) && (ss==8'h59)), (ena && (ss==8'h59))};
    count60 sec(clk, reset, ena, ss);
    count60 min(clk, reset, enable[1], mm);
    
    always @(posedge clk)   begin
        if(reset)   begin
            hh <= 8'h12;
            pm <= 1'b0;
        end
        
        else   begin
            if(enable[2])   begin
                
                if(hh==8'h12)
                    hh <= 8'h1;
                
                else if(hh==8'h11)  begin
                    hh[3:0] <= hh[3:0] + 1;
                    pm <= ~pm;
                end
                else   begin
                    if(hh[3:0] == 4'h9)  begin
                        hh[3:0] <= 4'h0;
                        hh[7:4] <= hh[7:4] +1;
                    end
                    else
                        hh[3:0] <= hh[3:0]+1;
                end
            end
            
            else     hh <= hh;
        end
    end
    
endmodule

module count60(input clk, reset, ena,
               output [7:0] q);
    
    always @(posedge clk)  begin
        if(reset)
            q <= 8'd0;
        else    begin
            if(ena)    begin  
                //q <= (q==8'd60)? 8'd0 : q+1;
                q[3:0] <= (q[3:0]==4'b1001)? 4'd0 : q[3:0]+1;
                q[7:4] <= (q[3:0]==4'b1001)? (q[7:4]==4'b0101 ? 4'd0: q[7:4]+1): q[7:4];
            end
            else
                q <= q;
        end
    end
endmodule
