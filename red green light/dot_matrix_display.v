module dot_matrix_display(clk_div_10000hz, state, dot_row, dot_col);

input clk_div_10000hz;
input [1:0] state;
output reg [7:0] dot_row, dot_col;

reg [2:0] count_row;

parameter [1:0] RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, NONE = 2'b11;

always @(posedge clk_div_10000hz) begin
	
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
	if(state == GREEN) begin
		case(count_row)
			3'd0: dot_col <= 8'b00001100;
			3'd1: dot_col <= 8'b00001100;
			3'd2: dot_col <= 8'b00011001;
			3'd3: dot_col <= 8'b01111110;
			3'd4: dot_col <= 8'b10011000;
			3'd5: dot_col <= 8'b00011000;
			3'd6: dot_col <= 8'b00101000;
			3'd7: dot_col <= 8'b01001000;
			default: dot_col <= 8'b00000000;
		endcase
	end
	if(state == YELLOW) begin
		case(count_row)
			3'd0: dot_col <= 8'b00000000;
			3'd1: dot_col <= 8'b00100100;
			3'd2: dot_col <= 8'b00111100;
			3'd3: dot_col <= 8'b10111101;
			3'd4: dot_col <= 8'b11111111;
			3'd5: dot_col <= 8'b00111100;
			3'd6: dot_col <= 8'b00111100;
			3'd7: dot_col <= 8'b00000000;
			default: dot_col <= 8'b00000000;
		endcase
	end
	if(state == RED) begin
		case(count_row)
			3'd0: dot_col <= 8'b00011000;
			3'd1: dot_col <= 8'b00011000;
			3'd2: dot_col <= 8'b00111100;
			3'd3: dot_col <= 8'b00111100;
			3'd4: dot_col <= 8'b01011010;
			3'd5: dot_col <= 8'b00011000;
			3'd6: dot_col <= 8'b00011000;
			3'd7: dot_col <= 8'b00100100;
			default: dot_col <= 8'b00000000;
		endcase
	end
	
end

endmodule
