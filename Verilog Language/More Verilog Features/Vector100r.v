module top_module( 
    input [99:0] in,
    output [99:0] out
);

    generate
    genvar i;
    	for(i=0;i<100; i=i+1) begin: reversal
        	assign out[99-i] = in[i];
	end
    endgenerate
    
endmodule