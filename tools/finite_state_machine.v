module FSM(Clock, Reset, Control, Y);

input Clock, Reset, Control;
output reg [2:0] Y;

reg [1:0] CurrentState, NextState;

parameter [1:0] ST0 = 2'b00, ST1 = 2'b01, ST2 = 2'b10, ST3 = 2'b11;

always @(posedge Clock or posedge Reset)
begin
    if(Reset)
        CurrentState <= 0;
    else
        CurrentState <= NextState;
end

always @(Control or CurrentState)
begin
    NextState = ST0;
    case(CurrentState)
        ST0: NextState <= ST1;
        ST1: 
            if(Control) NextState <= ST2;
            else NextState <= ST3;
        ST2: NextState <= ST3;
        ST3: NextState <= ST0;
    endcase
end

always @(CurrentState)
begin
    case(CurrentState)
        ST0: Y <= 1;
        ST1: Y <= 2;
        ST2: Y <= 3;
        ST3: Y <= 4;
    endcase
end

endmodule

