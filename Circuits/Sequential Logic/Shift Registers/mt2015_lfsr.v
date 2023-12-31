module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
   
    mt2015_muxdff inst1(.r(SW), .clk(KEY[0]), .l(KEY[1]), .q(LEDR));  
    
endmodule

module mt2015_muxdff ( 
    input [2:0] r, 
    input clk, 
    input l, 
    output [2:0] q
);
    always @(posedge clk)
        begin
            q[0] <= l ? r[0] : q[2];
            q[1] <= l ? r[1] : q[0];
            q[2] <= l ? r[2] : (q[2] ^ q[1]);
        end
endmodule