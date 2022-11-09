`define TimeExpire 32'd25000000

module Lab7(clock, reset, Up_Down, out);

input clock, reset, Up_Down;
output [0:6] out;
wire [0:3] num;
wire clock_div;

clk_div(clock, reset, clock_div);
up_down_counter(clock_div, reset, Up_Down, num);
seven_display(num, out);

endmodule

///////////////// clock divider /////////////////////////////
module clk_div(clk, reset, div_clk);
input clk, reset;
output div_clk;

reg div_clk;
reg [31:0] count;

always@(posedge clk)
begin
	if(reset) // reset == 1
	begin 
		if(count == `TimeExpire)
		begin
			count <= 32'd0;
			div_clk <= ~div_clk;
		end
		else
		begin
			count <= count + 32'd1;
		end
	end
	else // reset == 0
	begin
		count <= 32'd0;
		div_clk <= 1'b0;
	end
end
endmodule

//////////////////// up down counter ///////////////////////
module up_down_counter(clock_div, reset, Up_Down, count, temp);
input clock_div, reset, Up_Down;
output reg [0:3] count ;
reg [0:3] temp;

always@(clock_div or reset or Up_Down)
begin
	if(reset) // reset == 1
	begin
		if(Up_Down) // Up_Down == 1
		begin
			count <= count+1;
		end
		else // Up_Down == 0
		begin
			count <= count-1;
		end
	end
	else // reset == 0
	begin
		//temp <= count;
		count <= 4'b0000;
	end
end
endmodule

/////////////////////// 7 display //////////////////////////////////
module seven_display(num, out);
input [0:3]num;
output reg [0:6] out;

always@(num)
begin
	case(num)
						  //abcdefg
		4'b0000: {out} = 7'b0000001; //0
		4'b0001: {out} = 7'b1001111; //1
		4'b0010: {out} = 7'b0010010; //2
		4'b0011: {out} = 7'b0000110; //3
		4'b0100: {out} = 7'b1001100; //4
		4'b0101: {out} = 7'b0100100; //5
		4'b0110: {out} = 7'b0100000; //6
		4'b0111: {out} = 7'b0001111; //7
		4'b1000: {out} = 7'b0000000; //8
		4'b1001: {out} = 7'b0000100; //9
		4'b1010: {out} = 7'b0001000; //10
		4'b1011: {out} = 7'b1100000; //11
		4'b1100: {out} = 7'b0110001; //12
		4'b1101: {out} = 7'b1000010; //13
		4'b1110: {out} = 7'b0110000; //14
		4'b1111: {out} = 7'b0111000; //15
	endcase
end
endmodule
