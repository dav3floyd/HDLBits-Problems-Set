module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] min2, min3;
    assign min2 = (a < b) ? a : b;
    assign min3 = (min2 < c) ? min2 : c;
    assign min = (min3 < d) ? min3 : d;

endmodule