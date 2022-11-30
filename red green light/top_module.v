module top_module(clock, reset1, reset2, freq_1hz, seven_out, count_time, dot_row, dot_col);

input clock, reset1, reset2;
output freq_1hz;
output [6:0] seven_out;
output [3:0] count_time;
output [7:0] dot_row, dot_col;

wire clk_div_1hz;
wire clk_div_10000hz;
wire [1:0] state;

freq_div_1hz fd1 (clock, reset1, clk_div_1hz);

freq_div_10000hz fd10000 (clock, reset2, clk_div_10000hz);

red_green_light rgl (clk_div_1hz, reset1, count_time, state);

seven_display (count_time, seven_out);

dot_matrix_display(clk_div_10000hz, state, dot_row, dot_col);

assign freq_1hz = clk_div_1hz;

endmodule 