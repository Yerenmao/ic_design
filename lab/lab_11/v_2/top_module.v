module top_module(clock, reset, kp_col, kp_row, dot_row, dot_col);

input clock, reset;
input [3:0] kp_col;
output [3:0] kp_row;
output [7:0] dot_row, dot_col;

wire clk_100hz, clk_10000hz;
wire [3:0] kp_buf;

freq_div_100hz (clock, reset, clk_100hz);
freq_div_10000hz (clock, reset, clk_10000hz);
checkkeypad (clk_100hz, reset, kp_col, kp_row, kp_buf);
dot_matrix_display (clk_10000hz, reset, kp_buf, dot_row, dot_col);

endmodule
