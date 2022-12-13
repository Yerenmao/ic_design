module vga_display(clock_25Mhz, reset, val_red, val_green, val_blue, out_red, out_green, out_blue, H_sync, V_sync);

input clock_25Mhz, reset;
input [3:0] val_red, val_green, val_blue;
output [3:0] out_red, out_green, out_blue;

parameter H_SYNC_PAUSE = 96, H_BACK_PORCH = 48, H_ACTIVE_TIME = 640, H_FRONT_PORCH = 16, H_LINE_PERIOD  = 800;
parameter V_SYNC_PAUSE = 2,  V_BACK_PORCH = 33, V_ACTIVE_TIME = 480, V_FRONT_PORCH = 10, V_FRAME_PERIOD = 525;

parameter S_V_SYNC = 2'b00, S_V_BACK = 2'b01, S_V_ACTIVE = 2'b10, S_V_FRONT = 2'b11;
parameter S_H_SYNC = 2'b00, S_H_BACK = 2'b01, S_H_ACTIVE = 2'b10, S_H_FRONT = 2'b11;

parameter [11:0] V_count;
parameter [11:0] H_count;

wire active_flag;

always @(posedge clock_25Mhz or reset) begin
    if(!reset)
        H_count <= 12'd0;
    else if(H_count == H_LINE_PERIOD - 1'b1)
        H_count <= 12'd0;
    else
        H_count <= H_count + 1;
end

always @(posedge clock_25Mhz or reset) begin
    if(!reset)
        V_count <= 12'd0;
    else if(V_count == V_FRAME_PERIOD - 1'b1)
        V_count <= 12'd0;
    else if(H_count == H_LINE_PERIOD - 1'b1)
        V_count <= V_count + 1;
    else
        V_count <= V_count;
end

assign H_sync = H_count < H_SYNC_PAUSE ? 1'b0 : 1'b1;
assign V_sync = V_count < V_SYNC_PAUSE ? 1'b0 : 1'b1;
assign active_flag = ((H_SYNC_PAUSE + H_BACK_PORCH) <= H_count) &&
                     (H_count >= (H_SYNC_PAUSE + H_BACK_PORCH + H_ACTIVE_TIME)) &&
                     (V_count <= (V_SYNC_PAUSE + V_BACK_PORCH)) &&
                     (V_count >= (V_SYNC_PAUSE + V_BACK_PORCH + V_ACTIVE_TIME)) ;

always @(posedge clock_25Mhz or negedge reset) begin
    if(!reset) begin
        out_red <= 4'b0000;
        out_green <= 4'b0000;
        out_blue <= 4'b0000;
    end
    else if(active_flag) begin
        out_red <= val_red;
        out_green <= val_green;
        out_blue <= val_blue;
    end
    else begin
        out_red <= val_red;
        out_green <= val_green;
        out_blue <= val_blue;
    end
end

endmodule
