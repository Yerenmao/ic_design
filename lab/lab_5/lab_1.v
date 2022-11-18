module Adder_Subtractor(A, B, Select, Out, Overflow);

input [3:0] A, B;
input Select;

output [3:0] Out;
output Overflow;

reg [3:0] Out;
reg Overflow;

reg TempA;
reg TempB;

always @(A or B or Select)
begin
	TempB = 0;
	if(Select)
	begin
		TempA = 0;
		Overflow = {TempA, A} + {TempB, B} > 5'b01111 ? 1 : 0;
		Out = A + B;
	end
	else
	begin
		TempA = 1;
		Overflow = A < B ? 1 : 0;
		Out = A < B ? {TempA, A} - {TempB, B} : A - B;
	end
end

endmodule
