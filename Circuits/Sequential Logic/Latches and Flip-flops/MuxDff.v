module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire q;
    
    always @ (posedge clk) begin
    	Q <= q;	   
    end
    
    assign q = (L) ? r_in:q_in;

endmodule