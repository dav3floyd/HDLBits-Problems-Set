module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011;
    reg [2:0] state, next_state;
    
    always @(posedge clk) begin
        if(!resetn)
            state <= A;
        else
        	state <= next_state;    
    end
    
    always @(*) begin
        case(state)
            A: begin
                if(r == 3'b00)
                    next_state <= A; 
                else if(r[1])
                	next_state <= B;	    
                else if(r[2])  
                	next_state <= C;    
                else
                	next_state <= D; 
            end
            
            B: begin
                if(r[1])
                	next_state <= B;	    
                else
                	next_state <= A;      
            end
            
            C: begin
                if(r[2])
                	next_state <= C;	    
                else
                	next_state <= A;      
            end
            
            D: begin
                if(r[3])
                	next_state <= D;	    
                else  
                	next_state <= A;      
            end
            
            default: next_state <= A;
        endcase
    end
    
    assign g[1] = (state == B);
    assign g[2] = (state == C);
    assign g[3] = (state == D);

endmodule