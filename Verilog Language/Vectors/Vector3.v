module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//
	
    wire [31:0] mainArr = {a,b,c,d,e,f,2'b11};
    assign w = mainArr[31:24];
    assign x = mainArr[23:16];
    assign y = mainArr[15:8];
    assign z = mainArr[7:0];

endmodule