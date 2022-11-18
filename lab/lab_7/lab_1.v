module special_counter(Clock, Reset, Up_Down, Out);

input Clock, Reset, Up_Down;
output [6:0] Out;
reg [6:0] Out;
reg [3:0] TempOut;
reg [31:0] Count;
reg Clock_Div;

// for dividing frequency
always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        Count <= 0;
    else begin
        if(Count >= 32'd25000000) begin
            Count <= 0;
            Clock_Div <= ~Clock_Div;
        end
        else begin
            Count <= Count + 1;
        end
    end
end

// for our counter
always @(posedge Clock_Div or negedge Reset)
begin
    if(!Reset)
        Out <= 7'b1000000;
    else begin
        if(Up_Down) 
            TempOut <= TempOut + 1;
        else 
            TempOut <= TempOut - 1;
    end
end

always @(TempOut)
begin
    case(TempOut)
        4'b0000: Out <= 7'b1000000;
        4'b0001: Out <= 7'b1111001;
        4'b0010: Out <= 7'b0100100;
        4'b0011: Out <= 7'b0110000;
        4'b0100: Out <= 7'b0011001;
        4'b0101: Out <= 7'b0010010;
        4'b0110: Out <= 7'b0000010;
        4'b0111: Out <= 7'b1111000;
        4'b1000: Out <= 7'b0000000;
        4'b1001: Out <= 7'b0010000;
        4'b1010: Out <= 7'b0001000;
        4'b1011: Out <= 7'b0000011;
        4'b1100: Out <= 7'b1000110;
        4'b1101: Out <= 7'b0100001;
        4'b1110: Out <= 7'b0000110;
        4'b1111: Out <= 7'b0001110;
    endcase
end

endmodule

