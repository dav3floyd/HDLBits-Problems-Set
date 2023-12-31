module top_module ();
    reg clk;
    reg reset ;
    reg t;
    wire q;
    
    initial begin
        clk = 0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        reset = 1;
        t = 0;
        #10 reset = 0;
        t = 1;
    end
    
    tff inst1(
        .clk(clk), 
        .reset(reset),  
        .t(t),
        .q(q)
    );
    
endmodule