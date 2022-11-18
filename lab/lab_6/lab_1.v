module Special_Multiplier(Out, In);

// 0: 7'b1000000
// 1: 7'b1111001
// 2: 7'b0100100
// 3: 7'b0110000
// 4: 7'b0011001
// 5: 7'b0010010
// 6: 7'b0000010
// 7: 7'b1111000
// 8: 7'b0000000
// 9: 7'b0010000
// A: 7'b0001000
// B: 7'b0000011
// C: 7'b1000110
// D: 7'b0100001
// E: 7'b0000110
// F: 7'b0001110

input [3:0] In;

output [6:0] Out;
reg [6:0] Out;


// function to change to seven segment 
function [6:0] To_Seven_Segment;
    input [4:0] In;
    begin
        case(In)
            0: To_Seven_Segment = 7'b1000000;
            1: To_Seven_Segment = 7'b1111001;
            2: To_Seven_Segment = 7'b0100100;
            3: To_Seven_Segment = 7'b0110000;
            4: To_Seven_Segment = 7'b0011001;
            5: To_Seven_Segment = 7'b0010010;
            6: To_Seven_Segment = 7'b0000010;
            7: To_Seven_Segment = 7'b1111000;
            8: To_Seven_Segment = 7'b0000000;
            9: To_Seven_Segment = 7'b0010000;
            10:To_Seven_Segment = 7'b0001000;
            11:To_Seven_Segment = 7'b0000011;
            12:To_Seven_Segment = 7'b1000110;
            13:To_Seven_Segment = 7'b0100001;
            14:To_Seven_Segment = 7'b0000110;
            15:To_Seven_Segment = 7'b0001110;
        endcase
    end
endfunction


// always block
always @(In)
begin
    if(0 <= In && In <= 2)
        Out = To_Seven_Segment(In);
    else if(3 <= In && In <= 5) 
        Out = To_Seven_Segment((In * 2)+ 1);
    else if(6 <= In && In <= 8)
        Out = To_Seven_Segment((In * 2)- 1);
    else
        Out = To_Seven_Segment(0);
end

endmodule

