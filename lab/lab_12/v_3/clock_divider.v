module clock_divider(clock, clock_25Mhz);

input clock, reset;
output reg clock_25Mhz = 0;

always@(posedge clock or negedge reset) begin
    clock_25Mhz <= ~clock_25Mhz;
end
    
endmodule
