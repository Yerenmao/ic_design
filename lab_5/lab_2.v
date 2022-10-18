module Encoder(Valid, Out, In);

input [7:0] In;

output Valid;
output [2:0] Out;

reg Valid;
reg [2:0] Out;

always @(In)
begin
	Valid = 1;
	case(In)
	8'h01: Out = 0;
	8'h02: Out = 1;
	8'h04: Out = 2;
	8'h08: Out = 3;
	8'h10: Out = 4;
	8'h20: Out = 5;
	8'h40: Out = 6;
	8'h80: Out = 7;
	default:
		begin Valid = 0; Out = 0; end
	endcase
end

endmodule
