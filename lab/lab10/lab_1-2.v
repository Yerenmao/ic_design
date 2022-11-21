// top module
module top_module(Clock, Reset, Dot_Row, Dot_Col, Out);

input Clock, Reset;
output [7:0] Dot_Row, Dot_Col;
output [6:0] Out;

wire Clock_Div_1Hz;
wire Clock_Div_10000Hz;
wire [3:0] Time;

Frequency_Divider_1Hz(
    .Clock(Clock), .Reset(Reset),
    .Clock_Div_1Hz(Clock_Div_1Hz)
);

Frequency_Divider_10000Hz(
    .Clock(Clock), .Clock_Div_10000Hz(Clock_Div_10000Hz)
);

Traffic_Light(
    .Clock_Div_1Hz(Clock_Div_1Hz), .Clock_Div_10000Hz(Clock_Div_10000Hz),
    .Dot_Row(Dot_Row), .Dot_Col(Dot_Col), .Time(Time);
);

Seven_Display(
    .Time(Time), .Out(Out)
);

endmodule

// implement seven display 
module Seven_Display(Time, Out);

input [3:0] Time;
output reg [6:0] Out;

always @(Time)
begin
    case(Time)
        0:  Out <= 7'b1000000;
        1:  Out <= 7'b1111001;
        2:  Out <= 7'b0100100;
        3:  Out <= 7'b0110000;
        4:  Out <= 7'b0011001;
        5:  Out <= 7'b0010010;
        6:  Out <= 7'b0000010;
        7:  Out <= 7'b1111000;
        8:  Out <= 7'b0000000;
        9:  Out <= 7'b0010000;
        10: Out <= 7'b0001000;
        11: Out <= 7'b0000011;
        12: Out <= 7'b1000110;
        13: Out <= 7'b0100001;
        14: Out <= 7'b0000110;
        15: Out <= 7'b0001110;
    endcase
end

endmodule

// implement traffic light
module Traffic_Light(Clock_Div_1Hz, Clock_Div_10000Hz, Reset, Dot_Row, Dot_Col, Time);

input Clock_Div_1Hz, Clock_Div_10000Hz, Reset;
output reg [7:0] Dot_Row, Dot_Col;
output reg [3:0] Time;

reg [1:0] State;
reg [2:0] Row_Count;

parameter [1:0] Green = 2'b00, Yellow = 2'b01, Red = 2'b10, None = 2'b11;

always @(posedge Clock_Div_1Hz or negedge Reset)
begin
    if(!Reset) begin
        State <= Green;
        Time <= 4'd15;
    end
    else begin
        if(Time > 0)
            Time <= Time - 1;
        else begin
            case(State)
                Green:  State <= Yellow;
                Yellow: State <= Red;
                Red: State <= Green;
            endcase
            case(State)
                Green: Time <= 4'd5;     // next is Yellow
                Yellow: Time <= 4'd10;   // next is Red
                Red: Time <= 4'd15;      // next is Green
            endcase
        end 
    end
end

always @(posedge Clock_Div_10000Hz)
begin
    Row_Count <= Row_Count + 1;
    // set dot row
    case(Row_Count)
        3'd0: Dot_Row <= 8'b01111111;
        3'd1: Dot_Row <= 8'b10111111;
        3'd2: Dot_Row <= 8'b11011111;
        3'd3: Dot_Row <= 8'b11101111;
        3'd4: Dot_Row <= 8'b11110111;
        3'd5: Dot_Row <= 8'b11111011;
        3'd6: Dot_Row <= 8'b11111101;
        3'd7: Dot_Row <= 8'b11111110;
    endcase
    case(State)
        Green: begin
        case(Row_Count)
            3'd0: Dot_Col <= 8'b00001100;
            3'd1: Dot_Col <= 8'b00001100;
            3'd2: Dot_Col <= 8'b00011001;
            3'd3: Dot_Col <= 8'b01111110;
            3'd4: Dot_Col <= 8'b10011000;
            3'd5: Dot_Col <= 8'b00011000;
            3'd6: Dot_Col <= 8'b00101000;
            3'd7: Dot_Col <= 8'b01001000;
        endcase
        end
        Yellow: begin
        case(Row_Count)
            3'd0: Dot_Col <= 8'b00000000;
            3'd1: Dot_Col <= 8'b00100100;
            3'd2: Dot_Col <= 8'b00111100;
            3'd3: Dot_Col <= 8'b10111101;
            3'd4: Dot_Col <= 8'b11111111;
            3'd5: Dot_Col <= 8'b00111100;
            3'd6: Dot_Col <= 8'b00111100;
            3'd7: Dot_Col <= 8'b00000000;
        endcase
        end
        Red: begin
        case(Row_Count)
            3'd0: Dot_Col <= 8'b00011000;
            3'd1: Dot_Col <= 8'b00011000;
            3'd2: Dot_Col <= 8'b00111100;
            3'd3: Dot_Col <= 8'b00111100;
            3'd4: Dot_Col <= 8'b01011010;
            3'd5: Dot_Col <= 8'b00011000;
            3'd6: Dot_Col <= 8'b00011000;
            3'd7: Dot_Col <= 8'b00100100;
        endcase
        end
    endcase
end

endmodule



// implement frequency divider 1Hz
module Frequency_Divider_1Hz(Clock, Reset, Clock_Div_1Hz);

input Clock, Reset;
output reg Clock_Div_1Hz;

reg [31:0] Count_1Hz;

always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        Count_1Hz <= 0;
    else begin
        if(Count_1Hz >= 32'd25000000) begin
            Count_1Hz <= 0;
            Clock_Div_1Hz <= ~Clock_Div_1Hz;
        end
        else
            Count_1Hz <= Count_1Hz + 1;
    end
end

endmodule

// implement frequency divider 10000Hz
module Frequency_Divider_10000Hz(Clock, Clock_Div_10000Hz);

input Clock;
output reg Clock_Div_10000Hz;

reg [15:0] Count_10000Hz;

always @(posedge Clock)
begin
    if(Count_10000Hz >= 16'd2500) begin
        Count_10000Hz <= 0;
        Clock_Div_10000Hz <= ~Clock_Div_10000Hz;
    end
    else
        Count_10000Hz <= Count_10000Hz + 1;
end

endmodule
