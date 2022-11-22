module FSM(Clock_Div_1Hz, Reset, Current_State, Out, Time_Clk);

input Clock_Div_1Hz, Reset;
output reg [1:0] Current_State;
output reg Time_Clk;

reg [3:0] Time;

parameter [1:0] RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, NONE = 2'b11;

always @(posedge Clock_Div_1Hz or negedge Reset) begin
    if(!Reset) begin
        Current_State <= GREEN;
        Time <= 4'd15;
    end
    else
        Time <= Time - 1;
end

always @(*) begin
    if(!Time)
        Time_Clk <= ~Time_Clk;
end

always @(posedge Time_Clk or negedge Time_Clk) begin
    case(Current_State)
        RED: begin
            Current_State = GREEN;
            Time = 4'd15; end
        YELLOW: begin
            Current_State = RED;
            Time = 4'd10; end
        GREEN: begin
            Current_State = YELLOW;
            Time = 4'd5; end
    endcase
end

always @(*) begin
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
