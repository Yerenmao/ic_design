`define count_max 25000000

module freq_div_1hz(clock, reset, clk_div_1hz);

input clock, reset;
output reg clk_div_1hz;

reg [31:0] count;

always@(posedge clock or negedge reset) begin

	if(!reset) begin
		count <= 0;
	end
	else begin
		if(count >= `count_max) begin
			count <= 0;
			clk_div_1hz = ~clk_div_1hz;
		end
		else 
			count <= count + 1;
	end

end

endmodule 