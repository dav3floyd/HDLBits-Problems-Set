module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter A=0, B=1, C=2;
    reg [1:0] state, next_state;
    
    always @(*) begin
        next_state = A;
    	case(state)
            A: next_state = x ? B:A;
            B: next_state = C;
            C: next_state = C;
          	default: next_state = A; 
    	endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            z <= 1'b0;
        else
        	case(next_state)
            	A: z <= 1'b0;
            	B: z <= 1'b1;
           		C: z <= ~x;
    		endcase
    	end
    
endmodule