module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B (input x, input y, output z);
    assign z = (x == y) ? 1 : 0;
endmodule

module top_module (input x, input y, output z);
	wire gate_one, gate_two, z1, z2, z3, z4;
    
    A IA1(x, y, z1);
    B IB1(x, y, z2);
    A IA2(x, y, z3); 
    B IB2(x, y, z4);
    
    assign gate_one = z1 | z2;
    assign gate_two = z3 & z4;
    assign z = gate_one ^ gate_two; 
endmodule