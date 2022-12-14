module vga_driver(clk, Hsynq, Vsynq, Red, Green, Blue);

input clk;
output Hsynq, Vsynq;
output [3:0] Red, Green, Blue;

wire clk_25Mhz;
wire enable_V_Counter;
wire [15:0] H_Count_Value, V_Count_Value;

clock_divider (clk, clk_25Mhz);
horizontal_counter (clk_25Mhz, enable_V_Counter, H_Count_Value);
vertical_counter (clk_25Mhz, enable_V_Counter, V_Count_Value);

assign Hsynq = (H_Count_Value < 92) ? 1'b1 : 1'b0;
assign Vsynq = (V_Count_Value < 2) ? 1'b1 : 1'b0;

assign Red = (143 < H_Count_Value && H_Count_Value < 784 && 34 < V_Count_Value && V_Count_Value < 515) ? 4'hF : 4'h0;
assign Green = (143 < H_Count_Value && H_Count_Value < 784 && 34 < V_Count_Value && V_Count_Value < 515) ? 4'hF : 4'h0;
assign Blue = (143 < H_Count_Value && H_Count_Value < 784 && 34 < V_Count_Value && V_Count_Value < 515) ? 4'hF : 4'h0;

endmodule
