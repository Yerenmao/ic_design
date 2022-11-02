module Counter1(
    input Reset, Enable, clk,
    output [2:0] out
);

reg [2:0] out;

always @(posedge clk) 
begin
    if(Reset) begin
        Out = 3'b000;
    end
    else begin
        if(Enable) begin
            if(Out == 3'b111)
                Out = 3'b000;
            else
                Out = Out + 1;
        end
    end
end

endmodule

// 
module Counter2(
    input clk, Reset, Load, Enable,
    input [7:0] Data_In,
    output [7:0] Out
);

reg [7:0] Out;

always @(posedge elk)
begin
    if(Reset)
        Out = 0;
    else
        if(Load)
            Out = Data_In;
        else
            if(Enable)
                Out = Out + 1;
end

endmodule

module Counter3(
    input clk, Reset, Load, Enable, Up_Down,
    input [7:0] Data_In,
    output [7:0] Out
);

reg [7:0] Out;

always @(posedge clk)
begin
    if(Reset)
        Out = 0;
    else
        if(Load)
            Out = Data_In;
        else
            if(Enable)
            begin
                if(Up_Down)
                    Out = Out + 1;
                else
                    Out = Out - 1;
            end
end

endmodule

