module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0, B=1;
    reg state, next_state;
    
    always @(*) begin
    	case(state)
            A: begin
                if(x)
                    next_state = B;
                else
                    next_state = A;
            end    

            B: next_state = B;
            
          	default: next_state = A; 
    	endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    
    assign z = (state == A) ? x:(~x);
    
endmodule