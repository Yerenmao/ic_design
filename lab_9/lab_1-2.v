module top_module(Clock, Reset, Dot_Row, Dot_Col);

input Clock, Reset;
output [7:0] Dot_Row, Dot_Col;



endmodule

// implement dot matrix display
module Dot_Matrix_Display(Clock_Div, Reset, Dot_Row, Dot_Col);

input Clock_Div, Reset;
output reg [7:0] Dot_Row, Dot_Col;

reg [2:0] row_count;

always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset) begin
        Dot_Row <= 8'b11111111;
        Dot_Col <= 8'b00000000;
        row_count <= 0;
    end
    else begin
        row_count <= row_count + 1;
        case(row_count)
            3'd0: Dot_Row <= 8'b01111111;
            3'd1: Dot_Row <= 8'b10111111;
            3'd2: Dot_Row <= 8'b11011111;
            3'd3: Dot_Row <= 8'b11101111;
            3'd4: Dot_Row <= 8'b11110111;
            3'd5: Dot_Row <= 8'b11111011;
            3'd6: Dot_Row <= 8'b11111101;
            3'd7: Dot_Row <= 8'b01111110;
        endcase
        case(row_count)
            3'd0: Dot_Col <= 8'b00011000;
            3'd1: Dot_Col <= 8'b00100100;
            3'd2: Dot_Col <= 8'b01000010;
            3'd3: Dot_Col <= 8'b11000011;
            3'd4: Dot_Col <= 8'b01000010;
            3'd5: Dot_Col <= 8'b01000010;
            3'd6: Dot_Col <= 8'b01000010;
            3'd7: Dot_Col <= 8'b01111110;
        endcase
    end
end
endmodule

// devide frequency to 10000Hz
module Frequency_Divider(Clock, Reset, Clock_Div);

input Clock, Reset;
output reg Clock_Div;

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
