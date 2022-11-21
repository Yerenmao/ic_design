module top_module(in, pos);

input [3:0] in;
output reg [1:0] pos;

always @(*)
begin
    case(in)
        4'b0000: pos = 0;
        4'bxx10: pos = 1;
        4'bx100: pos = 2;
        4'b1000: pos = 3;
    endcase
end

endmodule
