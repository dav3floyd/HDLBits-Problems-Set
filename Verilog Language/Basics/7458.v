module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire and1 = p2a & p2b;
wire and2 = p1a & p1b & p1c;
wire and3 = p2c & p2d;
wire and4 = p1d & p1e & p1f;
wire or1 = and1 | and3;
wire or2 = and2 | and4;
    
assign p1y = or2;
assign p2y = or1;

endmodule