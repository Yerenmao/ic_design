module Top_Module(Clock, Reset, Dot_Row, Dot_Col);

input Clock, Reset;

output [7:0] Dot_Row, Dot_Col;

wire Clock_Div;

Frequency_Divider(.Clock(Clock), .Reset(Reset), .Clock_Div(Clock_Div));
Dot_Matrix_Display(.Clock_Div(Clock_Div), .Reset(Reset), .Dot_Row(Dot_Row), .Dot_Col(Dot_Col));

endmodule

// implement dot matrix display
module Dot_Matrix_Display(Clock_Div, Reset, Dot_Row, Dot_Col);

input Clock_Div, Reset;

output [7:0] Dot_Row, Dot_Col;

reg [7:0] Dot_Row, Dot_Col;

always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset) begin
        Dot_Row <= 8'b11111111;
        Dot_Col <= 8'b00000000;
    end
    else begin
        case(Dot_Row)
            8'b01111111: Dot_Col <= 8'b00011000;
            8'b10111111: Dot_Col <= 8'b00100100;
            8'b11011111: Dot_Col <= 8'b01000010;
            8'b11101111: Dot_Col <= 8'b11000011;
            8'b11110111: Dot_Col <= 8'b01000010;
            8'b11111011: Dot_Col <= 8'b01000010;
            8'b11111101: Dot_Col <= 8'b01000010;
            8'b11111110: Dot_Col <= 8'b01111110;
            default:     Dot_Col <= 8'b00000000;
        endcase
        case(Dot_Row)
            8'b01111111: Dot_Row <= 8'b10111111;
            8'b10111111: Dot_Row <= 8'b11011111;
            8'b11011111: Dot_Row <= 8'b11101111;
            8'b11101111: Dot_Row <= 8'b11110111;
            8'b11110111: Dot_Row <= 8'b11111011;
            8'b11111011: Dot_Row <= 8'b11111101;
            8'b11111101: Dot_Row <= 8'b11111110;
            8'b11111110: Dot_Row <= 8'b01111111;
            default:     Dot_Row <= 8'b01111111;
        endcase
    end
end
endmodule

// devide frequency to 10000Hz
module Frequency_Divider(Clock, Reset, Clock_Div);

input Clock, Reset;

output Clock_Div;

reg Clock_Div;
reg [15:0] Count;

always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        Count <= 0;
    else begin
        if(Count >= 16'd2500) begin
            Count <= 0;
            Clock_Div <= ~Clock_Div;
        end
        else 
            Count <= Count + 1;
    end
end
endmodule
