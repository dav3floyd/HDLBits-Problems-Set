module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    reg [23:0] data;
    
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            A: next_state <= in[3] ? 1:0;
            B: next_state <= C;
            C: next_state <= D;
            D: next_state <= in[3] ? 1:0; 
        endcase
    end
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    // Output logic
    assign done = (state == D);

    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
        if (reset)
            data <= 24'd0;
        else begin
            data[23:16] <= data[15:8];
            data[15:8] <= data[7:0];
            data[7:0]  <= in;
        end
    end

    assign out_bytes = (done) ? data : 24'd0;

endmodule