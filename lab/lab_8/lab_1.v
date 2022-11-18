// top module
module special_counter(Clock, Reset, In, Out);

input Clock, Reset, In;

output [6:0] Out;

wire Clock_Div;
wire [2:0] TempOut;

Frequency_Divider(.Clock(Clock), .Reset(Reset), .Clock_Div(Clock_Div));
Moore_Machine(.Clock_Div(Clock_Div), .In(In), .Reset(Reset), .TempOut(TempOut));
Seven_Display(.TempOut(TempOut), .Out(Out));

endmodule

// convert 4-bit input to seven display output
module Seven_Display(TempOut, Out);

input [2:0] TempOut;
output [6:0] Out;
reg [6:0] Out;

always @(TempOut)
begin
case(TempOut)
    0:  Out <= 7'b1000000;
    1:  Out <= 7'b1111001;
    2:  Out <= 7'b0100100;
    3:  Out <= 7'b0110000;
    4:  Out <= 7'b0011001;
    5:  Out <= 7'b0010010;
default: Out <= 7'b1000000;
endcase
end
endmodule

// implement moore machine
module Moore_Machine(Clock_Div, In, Reset, TempOut);

input Clock_Div, In, Reset;

output [3:0] TempOut;

reg [2:0] TempOut;

always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset) begin
        TempOut <= 0;
    end
    else begin
        if(In) begin
            case(TempOut)
                0: TempOut <= 3;
                1: TempOut <= 5;
                2: TempOut <= 0;
                3: TempOut <= 1;
                4: TempOut <= 2;
                5: TempOut <= 4;
                default: TempOut <= 0;
            endcase
        end
        else begin
            case(TempOut)
                0: TempOut <= 1;
                1: TempOut <= 2;
                2: TempOut <= 3;
                3: TempOut <= 4;
                4: TempOut <= 5;
                5: TempOut <= 0;
                default: TempOut <= 0;
            endcase
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




