module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
	initial begin
        clk = 0;
        in = 0;
        s = 3'b010;
        
        #10 s = 3'b110;
        #10 in = 1'b1;
        	s = 3'b010;
        #10 in = 1'b0;
        	s = 3'b111;
        #10 in = 1'b1;
        	s = 3'b000;
        #30 in = 1'b0;    
    end
    
    always #5 clk = ~clk;
    
    q7 inst1(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out)
    );
    
endmodule