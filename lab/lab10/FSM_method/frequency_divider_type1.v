`define CountMax1Hz 32'd25000000

// divide to 1 Hz
module frequency_divider_1Hz(Clock, Reset, Clock_Div_1Hz);

input Clock, Reset;
output reg Clock_Div_1Hz;

reg [31:0] Count_1Hz;

always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        Count_1Hz <= 0;
    else begin
        if(Count_1Hz >= `CountMax1Hz) begin
            Count_1Hz <= 0;
            Clock_Div_1Hz <= ~Clock_Div_1Hz;
        end
        else 
            Count_1Hz <= Count_1Hz + 1;
    end
end

endmodule

`define CountMax10000Hz 16'd2500;
// divide to 10000 Hz
module frequency_divider_10000Hz(Clock, Clock_Div_10000Hz);

input Clock;
output reg Clock_Div_10000Hz;

reg [15:0] Count_10000Hz;

always @(posedge Clock)
begin
    if(Count_10000Hz >= `CountMax10000Hz) begin
        Count_10000Hz <= 0;
        Clock_Div_10000Hz <= ~Clock_Div_10000Hz;
    end
    else
        Count_10000Hz <= Count_10000Hz + 1;
end

endmodule
