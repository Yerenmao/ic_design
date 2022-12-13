module freq_div_25Mhz(clock, reset, clock_25Mhz);

input clock, reset;
output reg clock_25Mhz;

always@(posedge clock or negedge reset) begin
    if(!reset)
        clock_25Mhz <= 1'b0;
    else
        clock_25Mhz <= ~clock_25Mhz;
end
    
endmodule
