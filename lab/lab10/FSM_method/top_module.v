module top_module(Clock, Reset, Dot_Row, Dot_Col, Out, L1Hz, LTClk);

input Clock, Reset;
output [7:0] Dot_Row, Dot_Col;
output [6:0] Out;
output L1Hz, LTClk;

wire Clock_Div_1Hz;
wire Clock_Div_10000Hz;
wire [1:0] Current_State;

frequency_divider_1Hz(
    .Clock(Clock), .Reset(Reset), .Clock_Div_1Hz(Clock_Div_1Hz)
);

frequency_divider_10000Hz(
    .Clock(Clock), .Clock_Div_10000Hz(Clock_Div_10000Hz)
);

assign L1Hz = Clock_Div_1Hz;

FSM(
    .Clock_Div_1Hz(Clock_Div_1Hz), .Reset(Reset),
    .Current_State(Current_State), .Out(Out), .Time_Clk(LTClk)
);

dot_matrix_display(
    .Clock_Div_10000Hz(Clock_Div_10000Hz), .Current_State(Current_State),
    .Dot_Row(Dot_Row), .Dot_Col(Dot_Col)
);

endmodule
