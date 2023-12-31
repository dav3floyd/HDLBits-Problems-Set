module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    parameter A = 1'd0, B = 1'd1, C = 2'd2, D = 2'd3, E = 3'd4; 
    reg [2:0] state, next_state;

    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
        	state <= next_state;    
    end
    
    always @(*) begin
        case(state)
            A: next_state <= B;
            B: next_state <= C;
            C: next_state <= D;
            D: next_state <= E;
        endcase
    end
    
    assign shift_ena = (state != E);
    
endmodule