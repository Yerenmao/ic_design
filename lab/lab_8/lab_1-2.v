// top module
module special_counter(Clock, Reset, In, Out);

input Clock, Reset, In;
output [6:0] Out;

wire Clock_Div;
wire [2:0] CurrentState;

freq_div_1hz(Clock, Reset, Clock_Div);
Moore_Machine(Clock_Div, In, Reset, CurrentState);
Seven_Display(CurrentState, Out);

endmodule

// convert signal to 1Hz
module freq_div_1hz(Clock, Reset, Clock_Div);

input Clock, Reset;
output Clock_Div;

reg [31:0] count;

always @(posedge Clock or negedge Reset) begin

    if(!Reset)
        count <= 0;
    else begin
        if(count >= 25000000) begin
            count <= 0;
            Clock_Div <= ~Clock_Div;
        end
        else 
            count <= count + 1;
    end
end

endmodule

// convert 4-bit input to seven display output
module Seven_Display(CurrentState, Out);

input [2:0] CurrentState;
output reg [6:0] Out;

parameter [2:0]
    ST0 = 3'd0;
    ST1 = 3'd1;
    ST2 = 3'd2;
    ST3 = 3'd3;
    ST4 = 3'd4;
    ST5 = 3'd5;

always @(CurrentState)
begin
    case(CurrentState)
        ST0:  Out <= 7'b1000000;
        ST1:  Out <= 7'b1111001;
        ST2:  Out <= 7'b0100100;
        ST3:  Out <= 7'b0110000;
        ST4:  Out <= 7'b0011001;
        ST5:  Out <= 7'b0010010;
    default: Out <= 7'b1000000;
    endcase
end

endmodule

// implement moore machine
module Moore_Machine(Clock_Div, In, Reset, CurrentState);

input Clock_Div, In, Reset;
output reg [2:0] CurrentState;

reg [2:0] NextState;

parameter [2:0]
    ST0 = 3'd0;
    ST1 = 3'd1;
    ST2 = 3'd2;
    ST3 = 3'd3;
    ST4 = 3'd4;
    ST5 = 3'd5;

always @(posedge Clock_Div or negedge Reset) begin

    if(!Reset) begin
        CurrentState <= ST0;
    end
    else begin
        CurrentState <= NextState;
    end
end

always @(*) begin

    if(In == 0) begin
        case(CurrentState)
            STO: NextState <= ST1;
            ST1: NextState <= ST2;
            ST2: NextState <= ST3;
            ST3: NextState <= ST4;
            ST4: NextState <= ST5;
            ST5: NextState <= ST0;
            default: NextState <= ST0;
        endcase
    end
    if(In == 1) begin
        case(CurrentState)
            STO: NextState <= ST1;
            ST1: NextState <= ST2;
            ST2: NextState <= ST3;
            ST3: NextState <= ST4;
            ST4: NextState <= ST5;
            ST5: NextState <= ST0;
            default: NextState <= ST0;
        endcase
    end

end

endmodule



    


