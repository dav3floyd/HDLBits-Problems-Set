module top_module (
    input clk,
    input d,
    output q
);
	reg p, n;
    
    always @(posedge clk)
        p <= d;
    
    always @(negedge clk) 
        n <= d;

    assign q = (p & clk) | (n & ~clk);
    
endmodule