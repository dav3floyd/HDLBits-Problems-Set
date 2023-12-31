module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire q1,q2;
    assign q1 = (E) ? w:Q;
    assign q2 = (L) ? R:q1;
    
    always @ (posedge clk) begin
    	Q <= q2;	   
    end
   
endmodule