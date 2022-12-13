module top_module(clock, reset, btn_red, btn_green, btn_blue, red, green, blue, Hsync, Vsync);

input clock, reset, btn_red, btn_green, btn_blue;
output [4:0] red;
output [5:0] green;
output [4:0] blue;
output Hsync, Vsync;

wire clock_25Mhz;

freq_div_25Mhz (clock, reset, clock_25Mhz);
vga_display(clock, reset, btn_red, btn_green, btn_blue, red, green, blue, Hsync, Vsync);

endmodule
