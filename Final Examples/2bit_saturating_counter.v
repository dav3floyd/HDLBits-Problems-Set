module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);

    parameter [1:0] snt = 0, wnt = 1, wt = 2, st = 3; 
    
    always @(posedge clk, posedge areset) begin 
        if(areset)
            state <= wnt;
        else begin
            case(state)
                snt: begin   
                    if(train_valid && train_taken)
                        state <= wnt;
                    else if(train_valid && ~train_taken)
                    	state <= snt;    
                    else
                    	state <= snt;   
                end
                
                wnt: begin   
                    if(train_valid && train_taken)
                        state <= wt;
                    else if(train_valid && ~train_taken)
                    	state <= snt;    
                    else
                    	state <= wnt;   
                end
                
                wt: begin   
                    if(train_valid && train_taken)
                        state <= st;
                    else if(train_valid && ~train_taken)
                    	state <= wnt;    
                    else
                    	state <= wt;   
                end
                    
                st: begin   
                    if(train_valid && train_taken)
                        state <= st;
                    else if(train_valid && ~train_taken)
                    	state <= wt;    
                    else
                    	state <= st;   
                end    
            endcase
        end
    end

endmodule