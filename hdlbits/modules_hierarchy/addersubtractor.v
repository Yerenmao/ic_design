module top_module(a, b, sub, sum);

input [31:0] a, b;
input sub;
output [31:0] sum;

wire [31:0] new_b = b ^ {32{sub}};
wire [15:0] lower_sum, upper_sum;
wire lower_cout;

add16 (.a(a[15:0]), .b(new_b[15:0]), .cin(sub), .sum(lower_sum), .cout(lower_cout));
add16 (.a(a[31:16]), .b(new_b[31:16]), .cin(lower_cout), .sum(upper_sum));

assign sum = {upper_sum, lower_sum};

endmodule
