
// aka frequency divider

module CNT_ASYNC_CLK_DIV16(
    input clk, reset,
    output Y
);

reg div2, div4, div8, div16, Y;

always @(posedge clk or negedge reset)
begin
    if(!reset)
        div2 = 0;
    else
        div2 = !div2;
end

always @(posedge div2 or negedge reset)
begin
    if(!reset)
        div4 = 0;
    else
        div4 = !div4;
end

always @(posedge div4 or negedge reset)
begin
    if(!reset)
        div8 = 0;
    else
        div8 = !div8;
end

always @(posedge div8 or negedge reset)
begin
    if(!reset)
        div16 = 0;
    else
        div16 = !div16;
end

always @(posedge clk or negedge reset)
begin
    if(!reset)
        Y = 0;
    else
        Y = div16;
end

endmodule
