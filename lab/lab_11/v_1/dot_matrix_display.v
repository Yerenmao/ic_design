module dot_matrix_display(clock, reset, kp_val, dot_row, dot_col);

input clock, reset;
input [15:0] kp_val;
output reg [7:0] dot_row, dot_col;

reg [2:0] count_row;

always @(posedge clock) begin
	count_row <= count_row + 1;
	case(count_row)
		3'd0: dot_row <= 8'b01111111;
		3'd1: dot_row <= 8'b10111111;
		3'd2: dot_row <= 8'b11011111;
		3'd3: dot_row <= 8'b11101111;
		3'd4: dot_row <= 8'b11110111;
		3'd5: dot_row <= 8'b11111011;
		3'd6: dot_row <= 8'b11111101;
		3'd7: dot_row <= 8'b11111110;
		default: dot_row <= 8'b11111111;
	endcase
    if(!reset) begin
        dot_col <= 8'b00000000;
    end
    else begin
        case(count_row)
        3'd0: dot_col <= {{2{keypad[15]}}, {2{keypad[14]}}, {2{keypad[13]}}, {2{keypad[12]}}};
        3'd1: dot_col <= {{2{keypad[15]}}, {2{keypad[14]}}, {2{keypad[13]}}, {2{keypad[12]}}};
        3'd2: dot_col <= {{2{keypad[11]}}, {2{keypad[10]}}, {2{keypad[9]}}, {2{keypad[8]}}};
        3'd3: dot_col <= {{2{keypad[11]}}, {2{keypad[10]}}, {2{keypad[9]}}, {2{keypad[8]}}};
        3'd4: dot_col <= {{2{keypad[7]}}, {2{keypad[6]}}, {2{keypad[5]}}, {2{keypad[4]}}};
        3'd5: dot_col <= {{2{keypad[7]}}, {2{keypad[6]}}, {2{keypad[5]}}, {2{keypad[4]}}};
        3'd6: dot_col <= {{2{keypad[3]}}, {2{keypad[2]}}, {2{keypad[1]}}, {2{keypad[0]}}};
        3'd7: dot_col <= {{2{keypad[3]}}, {2{keypad[2]}}, {2{keypad[1]}}, {2{keypad[0]}}};
        default: dot_col <= 8'b00000000;
        endcase
    end
end

endmodule
