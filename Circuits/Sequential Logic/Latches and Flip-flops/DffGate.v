module top_module (
    input clk,
    input in, 
    output out);
	wire q;
    
    always @ (posedge clk) begin
    	out <= q;	   
    end
    
    assign q = in ^ out;
    
endmodule