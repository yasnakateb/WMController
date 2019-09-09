module Timer (
    clock,
    state,
    sig_Full,
    sig_Temperature,
    sig_Wash_Completed,
    sig_Rinse_Completed,
    sig_Spin_Completed,
    );
    
    input clock;
    input [2:0] state;
    output sig_Full;
    output sig_Temperature;
    output sig_Wash_Completed;
    output sig_Rinse_Completed;
    output sig_Spin_Completed;
    
    reg sig_Full;
    reg sig_Temperature;
    reg sig_Wash_Completed;
    reg sig_Rinse_Completed;
    reg sig_Spin_Completed;

    reg [1:0] fill_Water_Counter;
    reg [1:0] heat_Water_Counter;
    reg [2:0] wash_Counter;
    reg [1:0] rinse_Counter;
    reg [1:0] spin_Counter;

    parameter STATE_START = 3'd0;
    parameter STATE_READY = 3'd1;
    parameter STATE_FILL_WATER = 3'd2;
    parameter STATE_HEAT_WATER = 3'd3;
    parameter STATE_WASH = 3'd4;
    parameter STATE_RINSE = 3'd5;
    parameter STATE_SPIN = 3'd6;

    parameter FULL_WATER_TIME = 2'd2;
    parameter REQUIRED_TEMPERATURE_TIME = 2'd3;
    parameter WASH_TIME = 3'd5;
    parameter RINSE_TIME = 2'd3;
    parameter SPIN_TIME = 2'd3;


    always @ (posedge clock) begin 
        if (fill_Water_Counter == FULL_WATER_TIME)
            sig_Full = 1;

        if (heat_Water_Counter == REQUIRED_TEMPERATURE_TIME) 
            sig_Temperature = 1;
        
        if (wash_Counter == WASH_TIME)
            sig_Wash_Completed = 1;
        if (rinse_Counter == RINSE_TIME)
            sig_Rinse_Completed = 1;
        if (spin_Counter == SPIN_TIME)
            sig_Spin_Completed = 1; 
        if (state == STATE_START || state == STATE_READY) begin
            fill_Water_Counter = 0;
            heat_Water_Counter = 0;
            wash_Counter = 0;
            rinse_Counter = 0;
            spin_Counter = 0;
            sig_Full = 0;
            sig_Temperature = 0;
            sig_Wash_Completed = 0;
            sig_Rinse_Completed = 0;
            sig_Spin_Completed = 0; 
        end 

        case (state)
            STATE_FILL_WATER: 
                fill_Water_Counter = fill_Water_Counter + 1'd1;
                
            STATE_HEAT_WATER: 
                heat_Water_Counter = heat_Water_Counter + 1'd1;
                
            STATE_WASH: 
                wash_Counter = wash_Counter + 1'd1;
                
            STATE_RINSE: 
                rinse_Counter = rinse_Counter + 1'd1;
                
            STATE_SPIN: 
                spin_Counter = spin_Counter + 1'd1;
                
        endcase
    end                    

endmodule
