`define MAX_COUNT 250000

module freq_div_100hz(clock, reset, clk_100hz);

input clock, reset;
output reg clk_100hz;

reg [17:0] count;

always @(posedge clock or negedge reset) begin
    if(!reset)
        count <= 0;
    else begin
        if(count >= `MAX_COUNT) begin
            count <= 0;
            clk_100hz <= ~clk_100hz;
        end
        else 
            count <= count + 1;
    end
end

endmodule
