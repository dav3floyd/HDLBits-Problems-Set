`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

wire w1 = a&b;
wire w2 = c&d;
wire w3 = w1|w2;    
    
assign out = w3;
assign out_n = ~w3;
    
endmodule