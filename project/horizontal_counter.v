module horizontal_counter(clk_25Mhz, enable_V_Counter, H_Count_Value);

input clk_25Mhz;
output reg enable_V_Counter = 0;
output reg [15:0] H_Count_Value = 0;

always @(posedge clk_25Mhz) begin
    if(H_Count_Value < 799) begin
        H_Count_Value <= H_Count_Value + 1;
        enable_V_Counter <= 0;
    end
    else begin
        H_Count_Value <= 0;
        enable_V_Counter <= 1;
    end
end

endmodule
