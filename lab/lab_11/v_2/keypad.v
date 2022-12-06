module keypad(clock, reset, kp_col, kp_row, kp_buf);

input clock, reset;
input [3:0] kp_row;
output reg [3:0] kp_row, kp_buf;

always @(posedge clock) begin
    if(!reset) begin
        kp_row <= 4'b1110;
        kp_buf <= 0;
    end
    else begin
        case({kp_row, kp_col})
            8'b1110_1110 : keypadBuf <= 4'h7;
            8'b1110_1101 : keypadBuf <= 4'h4;
            8'b1110_1011 : keypadBuf <= 4'h1;
            8'b1110_0111 : keypadBuf <= 4'h0;
            8'b1101_1110 : keypadBuf <= 4'h8;
            8'b1101_1101 : keypadBuf <= 4'h5;
            8'b1101_1011 : keypadBuf <= 4'h2;
            8'b1101_0111 : keypadBuf <= 4'ha;
            8'b1011_1110 : keypadBuf <= 4'h9;
            8'b1011_1101 : keypadBuf <= 4'h6;
            8'b1011_1011 : keypadBuf <= 4'h3;
            8'b1011_0111 : keypadBuf <= 4'hb;
            8'b0111_1110 : keypadBuf <= 4'hc;
            8'b0111_1101 : keypadBuf <= 4'hd;
            8'b0111_1011 : keypadBuf <= 4'he;
            8'b0111_0111 : keypadBuf <= 4'hf;
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
