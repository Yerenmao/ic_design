module top_module(
    input a, b, c, d,
    output out, out_n
);

wire anb;
wire cnd;
wire afor;

assign anb = a && b;
assign cnd = c && d;
assign afor = anb || cnd;

assign out = afor;
assign out_n = !afor;

endmodule
