`define count_max 2500

module freq_div_10000hz(clock, reset, clock_div_10000hz);

input clock, reset;
output reg clock_div_10000hz;

reg [15:0] count;

always @(posedge clock) begin
	if(!reset)
		count <= 0;
	else begin
		if(count >= `count_max) begin
			count <= 0;
			clock_div_10000hz <= ~clock_div_10000hz;
		end
		else 
			count <= count + 1;
	end
end

endmodule 