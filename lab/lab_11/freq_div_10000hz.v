`define MAX_COUNT 2500

module freq_div_10000hz(clock, reset, clk_10000hz);

input clock, reset;
output reg clk_10000hz;

reg [11:0] count;

always @(posedge clock or negedge reset) begin
    if(!reset)
        count <= 0;
    else begin
        if(count >= `MAX_COUNT) begin
            count <= 0;
            clk_10000hz <= ~clk_10000hz;
        end
        else
            count <= count + 1;
    end
end

endmodule
