module Controller(
    clock,
    sig_Lid_Closed,
    sig_Coin,
    sig_Cancel,
    sig_Time_Out,
    sig_Out_Of_Balance,
    sig_Motor_Failure,
    sig_Full,
    sig_Temperature,
    sig_Completed,
    start,
    ready,
    fill_Water_Operation,
    heat_Water_Operation,
    wash_Operation,
    rinse_Operation,
    spin_Operation,
    fault,
    coin_Return,
    water_Intake,
    state
    );
    
    input clock;
    input sig_Lid_Closed;
    input sig_Coin;
    input sig_Cancel;
    input sig_Time_Out;
    input sig_Out_Of_Balance;
    input sig_Motor_Failure;
    input sig_Full;
    input sig_Temperature;
    input sig_Completed;
    output start;
    output ready;
    output fill_Water_Operation;
    output heat_Water_Operation;
    output wash_Operation;
    output rinse_Operation;
    output spin_Operation;
    output fault;
    output coin_Return;
    output water_Intake;
    output [2:0] state;


    parameter STATE_START = 3'd0 ;
    parameter STATE_READY = 3'd1;
    parameter STATE_FILL_WATER = 3'd2;
    parameter STATE_HEAT_WATER = 3'd3;
    parameter STATE_WASH = 3'd4;
    parameter STATE_RINSE = 3'd5;
    parameter STATE_SPIN = 3'd6;
    parameter STATE_FAULT = 3'd7;


    reg [2:0] state = STATE_START;
    reg [2:0] next_State;

    always @( posedge clock ) begin
        state = next_State;
    end

    always @( * ) begin
        case (state)
            STATE_START: begin
                if (sig_Coin == 1) begin
                    next_State = STATE_READY;     
                end
                else begin
                    next_State = STATE_START;
                end

            end
            STATE_READY: begin
                if (sig_Lid_Closed == 0) begin
                    next_State = STATE_FILL_WATER;
                end

        
            end
            STATE_FILL_WATER: begin
                
            end
            STATE_HEAT_WATER: begin
                
            end
            STATE_WASH: begin
                
            end
            STATE_RINSE: begin
                
            end
            STATE_SPIN: begin
                
            end
            STATE_FAULT: begin
                
            end
        endcase    
    end






endmodule