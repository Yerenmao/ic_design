module button_value_counter(reset, btn_red, btn_green, btn_blue, val_red, val_green, val_blue);

input reset, btn_red, btn_green, btn_blue;
output reg [3:0] val_red, val_green, val_blue;

always @(posedge btn_red or negedge reset) begin
    if(!reset)
        val_red <= 0;
    else
        val_red <= val_red + 1;
end

always @(posedge btn_green or negedge reset) begin
    if(!reset)
        val_green <= 0;
    else
        val_green <= val_green + 1;
end

always @(posedge btn_blue or negedge reset) begin
    if(!reset)
        val_blue <= 0;
    else
        val_blue <= val_blue + 1;
end

endmodule
