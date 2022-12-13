module vga_display(clock_25Mhz, reset, btn_red, btn_green, btn_blue, red, green, blue, Hsync, Vsync);

input clock_25Mhz, reset, btn_red, btn_green, btn_blue;
output reg [4:0] red;
output reg [5:0] green;
output reg [4:0] blue;

parameter H_SYNC_PAUSE = 96, H_BACK_PORCH = 48, H_ACTIVE_TIME = 640, H_FRONT_PORCH = 16, H_LINE_PERIOD  = 800;
parameter V_SYNC_PAUSE = 2,  V_BACK_PORCH = 33, V_ACTIVE_TIME = 480, V_FRONT_PORCH = 10, V_FRAME_PERIOD = 525;

reg [11:0] H_count, V_count;
reg [4:0] red_cnt;
reg [5:0] green_cnt;
reg [4:0] blue_cnt;

wire H_active, V_active, active_flag;

always@(posedge clock_25Mhz or negedge reset) begin
    if(!reset)
        H_count <= 12'd0;
    else begin
        if(H_count == H_LINE_PERIOD - 1)
            H_count <= 12'd0;
        else
            H_count <= H_count + 1;
    end
end

assign Hsync = H_count < H_SYNC_PAUSE ? 1'b0 : 1'b1;

always @(posedge clock_25Mhz or negedge reset) begin
    if(!reset)
        V_count <= 12'd0;
    else begin
        if(V_count == V_FRAME_PERIOD - 1)
            V_count <= 12'd0;
        else if(V_count == H_LINE_PERIOD - 1)
            V_count <= V_count + 1;
        else
            V_count <= V_count;
    end
end

assign Vsync = V_count < V_SYNC_PAUSE ? 1'b0 : 1'b1;


assign H_active = (H_SYNC_PAUSE + H_BACK_PORCH <= H_count) && (H_count >= H_SYNC_PAUSE + H_BACK_PORCH + H_ACTIVE_TIME);
assign V_active = (V_SYNC_PAUSE + V_BACK_PORCH <= V_count) && (V_count >= V_SYNC_PAUSE + V_BACK_PORCH + V_ACTIVE_TIME);
assign active_flag = H_active && V_active;

always @(posedge btn_red or negedge reset) begin
    if(!reset)
        red_cnt <= 5'b0;
    else begin
        if(red_cnt == 5'b11111)
            red_cnt <= red_cnt;
        else
            red_cnt <= red_cnt + 1;
    end
end
always @(posedge btn_green or negedge reset) begin
    if(!reset)
        green_cnt <= 6'd0;
    else begin
        if(green_cnt == 6'b111111)
            green_cnt <= green_cnt;
        else
            green_cnt <= green_cnt + 1;
    end
end
always @(posedge btn_blue or negedge reset) begin
    if(!reset)
        blue_cnt <= 5'b0
    else begin
        if(blue_cnt == 5'b11111)
            blue_cnt <= blue_cnt + 1;
        else
            blue_cnt <= blue_cnt + 1;
    end
end

always @(posedge clock_25Mhz or negedge reset) begin
    if(!reset) begin
        red <= 5'd0;
        green <= 6'd0;
        blue <= 5'd0;
    end
    else if(active_flag) begin
        red <= red_cnt;
        green <= green_cnt;
        blue <= blue_cnt;
    end
    else begin
        red <= 5'd0;
        green <= 6'd0;
        blue <= 5'd0;
    end
end

endmodule
