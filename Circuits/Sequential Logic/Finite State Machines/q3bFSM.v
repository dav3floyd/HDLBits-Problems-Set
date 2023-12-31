module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter A = 1'd0, B = 1'd1, C = 2'd2, D = 2'd3, E = 3'd4;  
    reg[2:0] state, next_state;
    
    // State transition logic
    always @(*) begin
        case(state)
            A: next_state <= x ? B: A;
            B: next_state <= x ? E: B;
            C: next_state <= x ? B: C;
            D: next_state <= x ? C: B;
            E: next_state <= x ? E: D;
        endcase
    end
    
    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
        	state <= A;
        else
          	state <= next_state;  
    end
    
    // Output logic
    assign z = (state == D || state == E);
    
endmodule