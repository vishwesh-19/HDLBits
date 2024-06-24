module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF d3(KEY[0], KEY[1], KEY[2], KEY[3], SW[3], LEDR[3]);
    MUXDFF d2(KEY[0], KEY[1], KEY[2], LEDR[3], SW[2], LEDR[2]);
    MUXDFF d1(KEY[0], KEY[1], KEY[2], LEDR[2], SW[1], LEDR[1]);
    MUXDFF d0(KEY[0], KEY[1], KEY[2], LEDR[1], SW[0], LEDR[0]);
    
endmodule

module MUXDFF(input clk,e,l,w,r,
              output q);
    
    wire temp[1:0];
    assign temp[0] = e? w:q;
    assign temp[1] = l? r:temp[0];
    
    always @(posedge clk)  begin
        q <= temp[1]; 
    end
endmodule
