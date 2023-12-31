module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter S = 4'd0, S1 = 4'd1, S11 = 4'd2, S110 = 4'd3, 
    		  B0 = 4'd4, B1 = 4'd5, B2 = 4'd6, B3 = 4'd7, 
    		  count = 4'd8, waitS = 4'd9; 
    reg [3:0] state, next_state;
    
    always @(*) begin
        case(state)
            S: next_state = data ? S1: S;
            S1: next_state = data ? S11: S;
            S11: next_state = data ? S11: S110;
            S110: next_state = data ? B0: S;
            B0: next_state = B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = count;
            count: begin
                if(done_counting)
                    next_state = waitS;
                else
                    next_state = count;
            end
            waitS: begin
                if(ack)
                    next_state = S;
                else
                    next_state = waitS;    
            end
            
            default: next_state <= S;
            
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= S;
        else
            state <= next_state;
    end
    
    assign shift_ena = (state == B0 | state == B1 | state == B2 | state == B3);
    assign counting = (state == count);
    assign done = (state == waitS);
    
endmodule