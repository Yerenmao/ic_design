module vga_display(clock_25Mhz, reset, val_red, val_green, val_blue, out_red, out_green, out_blue, H_sync, V_sync);

input clock_25Mhz, reset;
input [3:0] val_red, val_green, val_blue;
output [3:0] out_red, out_green, out_blue;

parameter H_SYNC_PAUSE = 96, H_BACK_PORCH = 48, H_ACTIVE_TIME = 640, H_FRONT_PORCH = 16, H_LINE_PERIOD  = 800;
parameter V_SYNC_PAUSE = 2,  V_BACK_PORCH = 33, V_ACTIVE_TIME = 480, V_FRONT_PORCH = 10, V_FRAME_PERIOD = 525;

parameter S_V_SYNC = 2'b00, S_V_BACK = 2'b01, S_V_ACTIVE = 2'b10, S_V_FRONT = 2'b11;
parameter S_H_SYNC = 2'b00, S_H_BACK = 2'b01, S_H_ACTIVE = 2'b10, S_H_FRONT = 2'b11;

reg [1:0] V_state;
reg [1:0] H_state;
reg [11:0] V_count;
reg [11:0] H_count;

wire active_flag;

always @(posedge clock_25Mhz or negedge reset) begin
    if(!reset) begin
        V_count <= 12'd0;
        H_count <= 12'd0;
    end
    else begin
        case(S_V_SYNC)
            
        endcase
        case(S_V_BACK)

        endcase
        case(S_V_ACTIVE)

        endcase
        case(S_V_FRONT)

        endcase
    end
end