module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    reg [3:0] q1;

    always @(posedge clk) begin
        if(reset)
            q1 <= 1'b0;
        else if(slowena) begin
       		if( q1 == 4'b1001)
            	q1 <= 1'b0;
            else
                q1 <= q1 + 1'b1;   
        	end
    end
            
    assign q = q1;
    
endmodule