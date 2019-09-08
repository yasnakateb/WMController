module Timer_tb();

	reg clock;
    reg [2:0] state;
    wire sig_Full;
    wire sig_Temperature;
    wire sig_Completed;

Timer uut (
    .clock(clock),
    .state(clock),
    .sig_Full(sig_Full),
    .sig_Temperature(sig_Full),
    .sig_Completed(sig_Completed)
    );


	initial begin 







	end

endmodule