module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    wire in0, in1, in2;
    assign in0 = (in[0] == 1'b1) ? 1 : 0;
    assign in1 = (in[1] == 1'b1) ? 1 : 0;
    assign in2 = (in[2] == 1'b1) ? 1 : 0;
    
    always @(*) begin
        if(in0 & in1 & in2)
        	out = 2'b11;    
        else if (in0 & in1 | in0 & in2 | in1 & in2)
        	out = 2'b10;   
        else if (in0 | in1 | in2)
        	out = 2'b01;   
        else
        	out = 2'b00;     
    end
    
endmodule