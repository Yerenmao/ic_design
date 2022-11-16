module top_module(clk, d, sel, q);

input clk;
input [7:0] d;
input [1:0] sel;
output [7:0] q;
reg [7:0] q;
wire [7:0] w1, w2, w3;

my_dff8(.clk(clk), .d(d), .q(w1));
my_dff8(.clk(clk), .d(w1), .q(w2));
my_dff8(.clk(clk), .d(w2), .q(w3));

always @(sel)
begin
    case(sel)
        0: q = d;
        1: q = w1;
        2: q = w2;
        3: q = w3;
    endcase
end
endmodule
