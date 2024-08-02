module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    localparam [1:0] idle=0, one=1, one_z=2;
    reg [1:0] state, next;
    
    always @(*)    begin
        case(state)
            idle: begin 
                next = x? one:idle;
                   z = 0;
            end
            one : begin
               next = x? one:one_z;
                  z = 0;
            end
            one_z : begin
               next = x? one:idle;
                  z = x ? 1:0;
            end
        endcase
    end
    
    always @(posedge clk or negedge aresetn)   begin
        if(~aresetn)
            state <= idle;
        else
            state <= next;
    end
endmodule
