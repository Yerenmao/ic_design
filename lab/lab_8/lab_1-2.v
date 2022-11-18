// top module
module special_counter(Clock, Reset, In, Out);

input Clock, Reset, In;
output [6:0] Out;

wire Clock_Div;
wire [2:0] TempOut;



module

// convert 4-bit input to seven display output
module Seven_Display(Temp, Out);

input [2:0] TempOut;
output reg [6:0] Out;

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
output reg [2:0] TempOut;

reg [2:0] CurrentState, NextState;

parameter [2:0]
    ST0 = 3'd0;
    ST1 = 3'd1;
    ST2 = 3'd2;
    ST3 = 3'd3;
    ST4 = 3'd4;
    ST5 = 3'd5;

always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset)
        CurrentState <= ST0;
    else
        CurrentState <= 
    


