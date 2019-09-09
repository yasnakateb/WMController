module Microcontroller(
    clock,
    sig_Lid_Closed,
    sig_Coin,
    sig_Cancel,
    sig_Time_Out,
    sig_Out_Of_Balance,
    sig_Motor_Failure,
    state
    );

    input clock;
    input sig_Lid_Closed;
    input sig_Coin;
    input sig_Cancel;
    input sig_Time_Out;
    input sig_Out_Of_Balance;
    input sig_Motor_Failure;
    output [2:0] state;
 
    
    wire start;
    wire ready;
    wire fill_Water_Operation;
    wire heat_Water_Operation;
    wire wash_Operation;
    wire rinse_Operation;
    wire spin_Operation;
    wire fault;
    wire coin_Return;
    wire water_Intake;
    wire fault_Cleared;

    wire sig_Full;
    wire sig_Temperature;
    wire sig_Wash_Completed;
    wire sig_Rinse_Completed;
    wire sig_Spin_Completed;
 

Timer timer (
    .clock(clock),
    .state(state),
    .sig_Full(sig_Full),
    .sig_Temperature(sig_Temperature),
    .sig_Wash_Completed(sig_Wash_Completed),
    .sig_Rinse_Completed(sig_Rinse_Completed),
    .sig_Spin_Completed(sig_Spin_Completed)
    ); 


Controller controller(
    .clock(clock),
    .sig_Lid_Closed(sig_Lid_Closed),
    .sig_Coin(sig_Coin),
    .sig_Cancel(sig_Cancel),
    .sig_Time_Out(sig_Time_Out),
    .sig_Out_Of_Balance(sig_Out_Of_Balance),
    .sig_Motor_Failure(sig_Motor_Failure),
    .sig_Full(sig_Full),
    .sig_Temperature(sig_Temperature),
    .sig_Wash_Completed(sig_Wash_Completed),
    .sig_Rinse_Completed(sig_Rinse_Completed),
    .sig_Spin_Completed(sig_Spin_Completed),
    .start(start),
    .ready(ready),
    .fill_Water_Operation(fill_Water_Operation),
    .heat_Water_Operation(heat_Water_Operation),
    .wash_Operation(wash_Operation),
    .rinse_Operation(rinse_Operation),
    .spin_Operation(spin_Operation),
    .fault(fault),
    .coin_Return(coin_Return),
    .water_Intake(water_Intake),
    .fault_Cleared(fault_Cleared),
    .state(state)
    );       

endmodule