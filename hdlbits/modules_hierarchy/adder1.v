module top_module(
    a, b, sum
);

input [31:0] a, b;
output [31:0] sum;

wire cout, none;
wire [15:0] lower_sum;
wire [15:0] upper_sum;

add16(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(lower_sum), .cout(cout));
add16(.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(upper_sum), .cout(none));

assign sum = {upper_sum, lower_sum};

endmodule
