module vga_driver(clk, Hsynq, Vsynq, Red, Green, Blue, btn_red, btn_green, btn_blue, reset);

input clk, reset, btn_red, btn_green, btn_blue;
output Hsynq, Vsynq;
output [3:0] Red, Green, Blue;

wire clk_25Mhz;
wire enable_V_Counter;
wire [15:0] H_Count_Value, V_Count_Value;
wire [3:0] val_red, val_green, val_blue;
wire active;


clock_divider (clk, clk_25Mhz);
horizontal_counter (clk_25Mhz, enable_V_Counter, H_Count_Value);
vertical_counter (clk_25Mhz, enable_V_Counter, V_Count_Value);
color_control (btn_red, btn_green, btn_blue, val_red, val_green, val_blue, reset);

assign Hsynq = (H_Count_Value < 92) ? 1'b1 : 1'b0;
assign Vsynq = (V_Count_Value < 2) ? 1'b1 : 1'b0;

assign active = 143 < H_Count_Value && H_Count_Value < 784 && 34 < V_Count_Value && V_Count_Value < 515;

assign Red = active ? val_red : 4'h0;
assign Green = active ? val_green : 4'h0;
assign Blue = active ? val_blue : 4'h0;

endmodule
