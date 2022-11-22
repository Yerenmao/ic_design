module dot_matrix_display(Clock_Div_10000Hz, Current_State, Dot_Row, Dot_Col);

input Clock_Div_10000Hz;
input [1:0] Current_State;
output reg [7:0] Dot_Row, Dot_Col;

reg [2:0] row_count;

parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, NONE = 2'b11;

always @(posedge Clock_Div_10000Hz) begin
    row_count <= row_count + 1;
end

always @(*) begin
    case(row_count)
        3'd0: Dot_Row <= 8'b01111111;
        3'd1: Dot_Row <= 8'b10111111;
        3'd2: Dot_Row <= 8'b11011111;
        3'd3: Dot_Row <= 8'b11101111;
        3'd4: Dot_Row <= 8'b11110111;
        3'd5: Dot_Row <= 8'b11111011;
        3'd6: Dot_Row <= 8'b11111101;
        3'd7: Dot_Row <= 8'b11111110;
    endcase
    case(Current_State)
        RED: begin
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
        YELLOW: begin
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
        GREEN: begin
        case(row_count)
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
    endcase
end

endmodule
