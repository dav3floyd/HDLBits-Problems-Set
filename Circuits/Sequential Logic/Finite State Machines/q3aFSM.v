module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 1'b0, B = 1'b1;
    reg state, next_state;
    
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
       case(state)
            A: next_state = s? B:A;
            B: next_state = B;
            default: next_state = A;
       endcase
    end
    
    reg [1:0] w_count;
    always @(posedge clk) begin
        if(reset)
            w_count <= 0;
        else if(w_count == 2'd2)
            w_count <= 0;
        else if(state == B)
            w_count <= w_count + 1'b1;
    end
    
    reg [1:0] bit1_count;
    always @(posedge clk) begin
        if(reset)
            bit1_count <= 0;
        else if(w_count == 2'd0 && w == 0)
            bit1_count <= 0;
        else if(w_count == 2'd0 && w == 1)
            bit1_count <= 1'b1;
        else if(state == B && w == 1)
            bit1_count <=  bit1_count + 1'b1;
    end
    
    assign z = (state == B && bit1_count == 2 && w_count == 0);
    
endmodule