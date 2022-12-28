module vertical_counter(clk_25Mhz, enable_V_Counter, V_Count_Value);

input clk_25Mhz, enable_V_Counter;

output reg [15:0] enable_V_Counter = 0;

always @(posedge clk_25Mhz) begin
    if( enable_V_Counter == 1'b1) begin
        if(V_Count_Value < 524) begin
            V_Count_Value <= V_Count_Value + 1;
        end
        else begin
            V_Count_Value <= 0;
        end
    end
end

endmodule

