// top module
module special_counter(Clock, Reset, Up_Down, Out);

input Clock, Reset, Up_Down;

output [6:0] Out;

wire Clock_Div;
wire [3:0] TempOut;
wire IsZero;

Frequency_Divider(.Clock(Clock), .Reset(Reset), .Clock_Div(Clock_Div));
Up_Down_Counter(.Clock_Div(Clock_Div), .Up_Down(Up_Down), .Reset(Reset), .TempOut(TempOut), .IsZero(IsZero));
Seven_Display(.TempOut(TempOut), .IsZero(IsZero), .Out(Out));

endmodule

// convert 4-bit input to seven display output
module Seven_Display(TempOut, IsZero, Out);

input [3:0] TempOut;
input IsZero;
output [6:0] Out;
reg [6:0] Out;

always @(TempOut or IsZero)
begin
if(IsZero) begin
    Out <= 7'b1000000; 
end
else begin
    case(TempOut)
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
        default: Out <= 7'b1000000;
    endcase
end
end
endmodule

// count from 0 to F or F to 0
module Up_Down_Counter(Clock_Div, Up_Down, Reset, TempOut, IsZero);

input Clock_Div, Up_Down, Reset;

output [3:0] TempOut;
output IsZero;

reg [3:0] TempOut;
reg IsZero;

always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset)
        IsZero <= 1;
    else begin
        IsZero <= 0;
        if(Up_Down) begin
            if(TempOut == 4'b1111)
                TempOut <= 0;
            else
                TempOut <= TempOut + 1;
        end
        else begin
            if(TempOut == 4'b0000)
                TempOut <= 4'b1111;
            else
                TempOut <= TempOut - 1;
        end
    end
end

endmodule

// devide frequency to 1Hz
module Frequency_Divider(Clock, Reset, Clock_Div);

input Clock, Reset;

output Clock_Div;

reg Clock_Div;
reg [31:0] Count;

always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        Count <= 0;
    else begin
        if(Count >= 32'd25000000) begin
            Count <= 0;
            Clock_Div <= ~Clock_Div;
        end
        else
            Count <= Count + 1;
    end
end

endmodule




