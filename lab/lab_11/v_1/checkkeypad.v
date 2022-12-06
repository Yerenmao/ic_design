// get button information from keypad
module checkkeypad(clock, reset, kp_col, kp_row, kp_val);

input clock, reset;
input [3:0] kp_col;
output reg [3:0] kp_row;
output reg [15:0] kp_val;

always @(posedge clock) begin
    if(!reset) begin
        kp_row <= 4'b1110;
        kp_buffer <= 4'b0000;
    end
    else begin
        case({kp_row, kp_col})
            8'b1110_0111: kp_val <= 16'h0001;
            8'b1110_1011: kp_val <= 16'h0002;
            8'b1110_1101: kp_val <= 16'h0004;
            8'b1110_1110: kp_val <= 16'h0008;
            8'b1101_0111: kp_val <= 16'h0010;
            8'b1101_1011: kp_val <= 16'h0020;
            8'b1101_1101: kp_val <= 16'h0040;
            8'b1101_1110: kp_val <= 16'h0080;
            8'b1011_0111: kp_val <= 16'h0100;
            8'b1011_1011: kp_val <= 16'h0200;
            8'b1011_1101: kp_val <= 16'h0400;
            8'b1011_1110: kp_val <= 16'h0800;
            8'b0111_0111: kp_val <= 16'h1000;
            8'b0111_1011: kp_val <= 16'h2000;
            8'b0111_1101: kp_val <= 16'h4000;
            8'b0111_1110: kp_val <= 16'h8000;
            default: kp_val <= kp_val;
        endcase
        case(kp_row)
            4'b1110: kp_row <= 4'b1101;
            4'b1101: kp_row <= 4'b1011;
            4'b1011: kp_row <= 4'b0111;
            4'b0111: kp_row <= 4'b1110;
            default: kp_row <= 4'b1110;
        endcase
    end
end

endmodule