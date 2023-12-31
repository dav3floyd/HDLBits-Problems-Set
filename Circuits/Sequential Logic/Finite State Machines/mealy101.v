module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter s0 = 0, s1 = 1, s2 = 2; 
    reg [1:0] state, next_state;  
    
    always @(*) begin
        case(state)
            s0: next_state = x ? s1:s0;
            s1: next_state = x ? s1:s2;
            s2: next_state = x ? s1:s0;
            default: next_state = s0;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) begin
        if(!aresetn)
            state <= s0;
        else
            state <= next_state;
    end
    
    assign z = x & (state == s2);  
    
endmodule