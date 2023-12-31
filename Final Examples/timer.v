module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] count;
    
    always @(posedge clk) begin
        if(load)
            count <= data;
        else begin
            if(count == 0)
                count <= 0;
            else
                count <= count - 1'b1;
        end    
    end
    
    assign tc = (count == 0) ? 1'b1:1'b0;
    	
endmodule