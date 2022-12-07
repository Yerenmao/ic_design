module dot_matrix_display(clock, reset, kp_buf, dot_row, dot_col);

input clock, reset;
input [3:0] kp_buf;
output reg [7:0] dot_row, dot_col;
reg [2:0] count_row;

always @(posedge clock or negedge reset) begin 
    if(!reset) begin
        dot_row <= 8'b11111111;
        dot_col <= 8'b00000000;
        count_row <= 3'd0;
    end
    else begin
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
        endcase
        case(kp_buf)
            4'h0: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b11000000;
            3'd7: dot_col <= 8'b11000000;
					endcase
				end
            4'h1: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00110000;
            3'd7: dot_col <= 8'b00110000;
					endcase
            end
            4'h4: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00001100;
            3'd7: dot_col <= 8'b00001100;
					endcase
            end
            4'h7: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000011;
            3'd7: dot_col <= 8'b00000011;
					endcase
            end
            4'ha: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b11000000;
            3'd5: dot_col <= 8'b11000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h2: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00110000;
            3'd5: dot_col <= 8'b00110000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h5: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00001100;
            3'd5: dot_col <= 8'b00001100;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h8: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000011;
            3'd5: dot_col <= 8'b00000011;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'hb: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b11000000;
            3'd3: dot_col <= 8'b11000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h3: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00110000;
            3'd3: dot_col <= 8'b00110000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h6: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00001100;
            3'd3: dot_col <= 8'b00001100;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'h9: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000000;
            3'd1: dot_col <= 8'b00000000;
            3'd2: dot_col <= 8'b00000011;
            3'd3: dot_col <= 8'b00000011;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'hf: begin
                case(count_row)
            3'd0: dot_col <= 8'b11000000;
            3'd1: dot_col <= 8'b11000000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'he: begin
                case(count_row)
            3'd0: dot_col <= 8'b00110000;
            3'd1: dot_col <= 8'b00110000;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'hd: begin
                case(count_row)
            3'd0: dot_col <= 8'b00001100;
            3'd1: dot_col <= 8'b00001100;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
            4'hc: begin
                case(count_row)
            3'd0: dot_col <= 8'b00000011;
            3'd1: dot_col <= 8'b00000011;
            3'd2: dot_col <= 8'b00000000;
            3'd3: dot_col <= 8'b00000000;
            3'd4: dot_col <= 8'b00000000;
            3'd5: dot_col <= 8'b00000000;
            3'd6: dot_col <= 8'b00000000;
            3'd7: dot_col <= 8'b00000000;
					endcase
            end
			endcase
    end
end

endmodule
