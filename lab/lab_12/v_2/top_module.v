module top_module(clock, reset, btn_red, btn_green, btn_blue, out_red, out_green, out_blue, H_sync, V_sync);

input clock, reset, btn_red, btn_green, btn_blue;
output [3:0] out_red, out_green, out_blue;
output H_sync, V_sync;
output clock_25Mhz;

wire val_red, val_green, val_blue;

freq_div_25Mhz (clock, reset, clock_25Mhz);
button_value_counter (reset, btn_red, btn_green, btn_blue);
vga_display (clock_25Mhz, reset, btn_red, btn_green, btn_blue);

endmodule
