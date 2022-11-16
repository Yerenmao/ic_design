module top_module(a, b, sum);

input [31:0] a, b;
output [31:0] sum;

wire lower_cout;
wire [15:0] lower_sum, upper_sum_0, upper_sum_1;

add16 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(lower_sum), .cout(lower_cout));
add16 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(upper_sum_0));
add16 (.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(upper_sum_1));

assign sum = {(lower_cout?upper_sum_1:upper_sum_0), lower_sum};

endmodule
