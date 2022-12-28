module vga_driver(
    input clk,
    input rst,
    input game_clk,
    input [9:0] x,
    input [9:0] y,
    input [5:0] map [99:0],
    output hsync,
    output vsync,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);

wire enable_vcounter;
wire [9:0] hcounter, vcounter;
wire [3:0] val_red, val_green, val_blue;
wire active;

horizontal_counter (clk, enable_vcounter, hcounter);
vertical_counter (clk, enable_vcounter, vcounter);
color_control (hcounter, vcounter, x, y, map, val_red, val_green, val_blue);

assign hsync = (hcounter < 92) ? 1'b1 : 1'b0;
assign vsync = (vcounter < 2) ? 1'b1 : 1'b0;
assign active = 143 < hcounter && hcounter < 784 && 34 < vcounter && vcounter < 515;

assign red = active ? val_red : 4'h0;
assign green = active ? val_green : 4'h0;
assign blue = active ? val_blue : 4'h0;

endmodule
