module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] a1 = a[15:0];
    wire [15:0] a2 = a[31:16];
    wire [15:0] b1 = b[15:0];
    wire [15:0] b2 = b[31:16];
    wire [15:0] sum1, sum2;
    wire cout1, cin2, cout2;
    
    add16 inst1(
        .a(a1),
        .b(b1),
        .cin(0),
        .sum(sum1),
        .cout(cout1)
    );
    
    add16 inst2(
        .a(a2),
        .b(b2),
        .cin(cout1),
        .sum(sum2),
        .cout(cout2)
    );
    
    assign sum = {sum2, sum1};

endmodule
