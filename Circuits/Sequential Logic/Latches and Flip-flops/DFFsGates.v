module top_module (
    input clk,
    input x,
    output z
); 
  
    wire xorl, andl, orl;
	wire q1, q2, q3;
	wire qn1, qn2, qn3;
	assign xorl = x ^ q1;
	assign andl = x & qn2;
	assign orl  = x | qn3;
	
    my_dff dff1 (.clk(clk), .d(xorl), .q(q1), .qn(qn1));
    my_dff dff2 (.clk(clk), .d(andl), .q(q2), .qn(qn2));
    my_dff dff3 (.clk(clk), .d(orl),  .q(q3), .qn(qn3));
	
    assign z = ~(q1 | q2 | q3);

endmodule

module my_dff(
	input clk,
	input d,
	output reg q,
	output reg qn
);

	always @(posedge clk) begin
		q <= d;
	end
    
    assign qn = ~q;
    
endmodule