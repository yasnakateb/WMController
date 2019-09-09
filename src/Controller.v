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
    sig_Wash_Completed,
    sig_Rinse_Completed,
    sig_Spin_Completed,
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
    fault_Cleared,
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
    input sig_Wash_Completed;
    input sig_Rinse_Completed;
    input sig_Spin_Completed;
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
    output fault_Cleared;
    output [2:0] state;

    parameter STATE_START = 3'd0 ;
    parameter STATE_READY = 3'd1;
    parameter STATE_FILL_WATER = 3'd2;
    parameter STATE_HEAT_WATER = 3'd3;
    parameter STATE_WASH = 3'd4;
    parameter STATE_RINSE = 3'd5;
    parameter STATE_SPIN = 3'd6;
    parameter STATE_FAULT = 3'd7;

    reg state = STATE_START;
    reg [2:0] next_State;

    always @( posedge  clock ) begin
        state = next_State;
    end

    always @( posedge clock ) begin
        case (state)
            STATE_START: begin
                if (sig_Coin == 1)
                    next_State = STATE_READY;

                else 
                    next_State = STATE_START;
            end
            STATE_READY: begin
                if (sig_Lid_Closed == 1)
                    next_State = STATE_FILL_WATER;

                else if (sig_Cancel ==1 )
                    next_State = STATE_START;
            end
            STATE_FILL_WATER: begin
                if (sig_Full == 1)
                    next_State = STATE_HEAT_WATER;
                
                else if (sig_Time_Out == 1)
                    next_State = STATE_FAULT;
                
                else 
                    next_State = STATE_FILL_WATER;
            end
            STATE_HEAT_WATER: begin
                if (sig_Temperature == 1) 
                    next_State = STATE_WASH;
                    
                else if (sig_Time_Out == 1) 
                    next_State = STATE_FAULT;
                
                else 
                    next_State = STATE_HEAT_WATER;
            end
            STATE_WASH: begin
                if (sig_Wash_Completed == 1) 
                    next_State = STATE_RINSE;
                    
                else if (sig_Out_Of_Balance == 1)
                    next_State = STATE_FAULT;
        
                else 
                    next_State = STATE_WASH;
            end
            STATE_RINSE: begin
                if (sig_Rinse_Completed == 1) 
                    next_State = STATE_SPIN;
                    
                else if (sig_Motor_Failure == 1) 
                    next_State = STATE_FAULT;
            
                else 
                    next_State = STATE_RINSE;
            end
            STATE_SPIN: begin
                if (sig_Spin_Completed == 1) 
                    next_State = STATE_START;
                    
                else if (sig_Motor_Failure == 1 | sig_Out_Of_Balance == 1) 
                    next_State = STATE_FAULT;
                
                else 
                    next_State = STATE_SPIN;
            end
            STATE_FAULT:
                next_State = STATE_READY;
            
            default: 
                next_State = STATE_START;
        endcase    
    end

    assign start = (state == STATE_START) ? 1'b1 : 1'b0;
    assign ready = (state == STATE_READY)? 1'b1: 1'b0;
    assign fill_Water_Operation = (state == STATE_FILL_WATER)? 1'b1: 1'b0;
    assign heat_Water_Operation = (state == STATE_HEAT_WATER)? 1'b1: 1'b0;
    assign wash_Operation = (state == STATE_WASH)? 1'b1: 1'b0;
    assign rinse_Operation = (state == STATE_RINSE)? 1'b1: 1'b0;
    assign spin_Operation = (state ==STATE_SPIN)? 1'b1: 1'b0;
    assign fault = (state == STATE_FAULT)? 1'b1: 1'b0;
    assign coin_Return = (state == STATE_READY)? 1'b1: 1'b0 ;
    assign water_Intake = ((state == STATE_FILL_WATER) || (state == STATE_RINSE))? 1'b1: 1'b0;
    assign fault_Cleared = (state == STATE_FAULT)? 1'b1: 1'b0;

endmodule