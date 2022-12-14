module color_control(btn_red, btn_green, btn_blue, val_red, val_green, val_blue, reset);

input btn_red, btn_green, btn_blue, reset;
output reg [3:0] val_red = 0, val_green = 0, val_blue = 0;

always @(posedge btn_red or negedge reset) begin
    if(!reset) begin
        val_red <= 0;
    end
    else begin
        val_red <= val_red + 1;
    end
end

always @(posedge btn_green or negedge reset) begin
    if(!reset) begin
        val_green <= 0;
    end
    else begin
        val_green <= val_green + 1;
    end
end

always @(posedge btn_blue or negedge reset) begin
    if(!reset) begin
        val_blue <= 0;
    end
    else begin
        val_blue <= val_blue + 1;
    end
end

endmodule
