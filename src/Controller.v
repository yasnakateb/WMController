module Controller(
    clock,
    lid,
    coin,
    cancel,
    mode_1,
    mode_2,
    mode_3,
    idle,
    ready,
    soak_Operation,
    wash_Operation,
    rinse_Operation,
    spin_Operation,
    coin_Return,
    water_Intake
    );
    
    input clock;
    input lid;
    input coin;
    input cancel;
    input mode_1;
    input mode_2;
    input mode_3;
    output idle;
    output ready;
    output soak_Operation;
    output wash_Operation;
    output rinse_Operation;
    output spin_Operation;
    output coin_Return;
    output water_Intake;

    parameter STATE_IDLE;
    parameter STATE_READY;
    parameter STATE_SOAK;
    parameter STATE_WASH;
    parameter STATE_RINSE;
    parameter STATE_SPIN;

    reg [2:0] state;
    reg [2:0] next_State;
    always @( posedge clk ) begin
        state = next_State;
    end    

endmodule