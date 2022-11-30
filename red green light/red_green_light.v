module red_green_light(clk_div_1hz, reset, count_time, state);

input clk_div_1hz, reset;
output reg [1:0] state;
output reg [3:0] count_time;

parameter [1:0] RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, NONE = 2'b11;

always@(posedge clk_div_1hz or negedge reset) begin
	
	if(!reset) begin
		state <= GREEN;
		count_time <= 4'hf;
	end
	else begin
		if(count_time == 4'b0000) begin
			case(state)
				RED: 		begin state <= GREEN; count_time <= 4'd15; end
				YELLOW: 	begin state <= RED; count_time <= 4'd10; 	 end
				GREEN: 	begin state <= YELLOW; count_time <= 4'd5; end
				default: begin state <= GREEN; count_time <= 4'd15; end
			endcase
		end
		else begin
			state <= state;
			count_time <= count_time - 1;
		end
	end
end

endmodule
