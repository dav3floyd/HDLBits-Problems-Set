module top_module (
    input clk,
    input reset,
    output [9:0] q);

    reg [9:0] q1;

    always @(posedge clk) begin
        if(reset)
            q1 <= 1'b0;
        else begin
            if( q1 == 10'b1111100111)
            	q1 <= 1'b0;
            else
                q1 <= q1 + 1'b1;   
        end
   	end
            
    assign q = q1;
    
endmodule