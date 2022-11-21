module top_module(Clock, Reset, Dot_Row, Dot_Col);

input Clock, Reset;

output reg [7:0] Dot_Row, Dot_Col;

reg [15:0] freq_count_10000Hz;
reg Clock_Div_10000Hz;
reg [31:0] freq_count_2Hz;
reg Clock_Div_2Hz;

// freqency divider
always @(posedge Clock or negedge Reset)
begin
    if(!Reset)
        freq_count_2Hz <= 0;
    else begin
        // for 2 Hz
        if(freq_count_2Hz >= 12500000) begin
            freq_count_2Hz <= 0;
            Clock_Div_2Hz <= ~Clock_Div_2Hz;
        end
        else
            freq_count_2Hz <= freq_count_2Hz + 1;
        // for 10000Hz
        if(freq_count_10000Hz >= 2500) begin
            freq_count_10000Hz <= 0;
            Clock_Div_10000Hz <= ~Clock_Div_10000Hz;
        end
        else
            freq_count_10000Hz <= freq_count_10000Hz + 1;
    end
end

reg State;
parameter RESET_MODE = 0, SHOW_MODE = 1;
reg []

// show I LOVE YOU
always @(posedge Clock_Div_2Hz or negedge Reset)
begin
    if(!Reset)
        State <= RESET_MODE;


endmodule
