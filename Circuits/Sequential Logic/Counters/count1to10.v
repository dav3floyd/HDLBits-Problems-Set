module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

	reg [3:0] q1;
    
    always @(posedge clk) begin
        if(q1 == 4'b1010 | reset)
        	q <= 1'b1; 
        else
            q <= q1 + 1'b1;   
    end
    
    assign q1 = q;
    
endmodule