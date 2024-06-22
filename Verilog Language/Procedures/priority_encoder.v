// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    always @(*) begin
        if(in[0]==1)
            pos = 0;
        else if(in[1]==1 && in[0]==0)
            pos = 1;
        else if(in[2]==1 && in[1]==0 && in[0]==0)
            pos = 2;
        else if(in == 4'b1000)
            pos = 3;
        else 
            pos = 0;
    end
endmodule
