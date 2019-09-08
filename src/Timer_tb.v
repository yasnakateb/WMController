module Timer_tb();

	reg clock;
    reg [2:0] state;
    wire sig_Full;
    wire sig_Temperature;
    wire sig_Completed;

Timer uut (
    .clock(clock),
    .state(state),
    .sig_Full(sig_Full),
    .sig_Temperature(sig_Full),
    .sig_Completed(sig_Completed)
    );


	initial begin 
	clock = 0;
	state = 0;
	#1
	clock = 1;
	#1
	clock = 0;
	state = 2'd2;
	#1
	clock = 1;
	#1
	clock = 0;
	#1
	clock = 1;
	#1
	clock = 0;
	#1
	clock = 1;
	end

endmodule