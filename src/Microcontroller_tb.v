module Microcontroller_tb();
	reg clock;
    reg sig_Lid_Closed;
    reg sig_Coin;
    reg sig_Cancel;
    reg sig_Time_Out;
    reg sig_Out_Of_Balance;
    reg sig_Motor_Failure;
    wire [2:0] state;

Microcontroller uut(
	.clock(clock),
    .sig_Lid_Closed(sig_Lid_Closed),
    .sig_Coin(sig_Coin),
    .sig_Cancel(sig_Cancel),
    .sig_Time_Out(sig_Time_Out),
    .sig_Out_Of_Balance(sig_Out_Of_Balance),
    .sig_Motor_Failure(sig_Motor_Failure),
    .state(state)
	);
	initial begin 

	$dumpfile("Microcontroller_tb.vcd");
    $dumpvars(0,Microcontroller_tb);

		clock = 0;
		#1
		clock = 1;
		sig_Coin = 1;
		sig_Lid_Closed = 1;
		#1
		clock = 0;
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
		#1
		clock = 0;
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
		#1
		clock = 0;
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
		#1
		clock = 0;
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
