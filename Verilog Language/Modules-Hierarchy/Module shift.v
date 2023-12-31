module top_module ( input clk, input d, output q );
	wire q2,q3;
    
    my_dff inst1(
        .clk(clk), 
        .d(d),
        .q(q2)
    );
    
    my_dff inst2(
        .clk(clk), 
        .d(q2),
        .q(q3)
    );
    
    my_dff inst3(
        .clk(clk), 
        .d(q3),
        .q(q)
    );
    
endmodule