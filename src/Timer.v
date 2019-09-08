module Timer (
    clock,
    state,
    sig_Full,
    sig_Temperature,
    sig_Completed
    );
    
    input [2:0] state;
    output reg sig_Full;
    output reg sig_Temperature;
    output reg sig_Completed;

    reg [1:0] fill_Water_Counter;
    reg [1:0] heat_Water_Counter;
    reg [2:0] wash_Counter;
    reg [1:0] rinse_Counter;
    reg [1:0] spin_Counter;

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
        if (fill_Water_Counter == FULL_WATER_TIME) begin
            sig_Full = 1;
        end
        if (heat_Water_Counter == REQUIRED_TEMPERATURE_TIME) begin
            sig_Temperature = 1;
        end
        if (wash_Counter == WASH_TIME   | 
            rinse_Counter == RINSE_TIME |
            spin_Counter == SPIN_TIME ) begin
            sig_Completed = 1;
        end
        case (state)
            STATE_FILL_WATER: begin
                fill_Water_Counter = fill_Water_Counter + 1'd1;
                
            end
            STATE_HEAT_WATER: begin
                heat_Water_Counter = heat_Water_Counter + 1'd1;
                
            end
            STATE_WASH: begin
                wash_Counter = wash_Counter + 1'd1;
                
            end
            STATE_RINSE: begin
                rinse_Counter = rinse_Counter + 1'd1;
                
            end
            STATE_SPIN: begin
                spin_Counter = spin_Counter + 1'd1;
                
            end
            default : begin
                fill_Water_Counter = 0;
                heat_Water_Counter = 0;
                wash_Counter = 0;
                rinse_Counter = 0;
                spin_Counter = 0;
                
            end

    end                    

endmodule
