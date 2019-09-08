module Timer (
    clock,
    state,
    sig_Full,
    sig_Temperature,
    sig_Completed,
    mode
    );
    
    input clock;
    input [2:0] state;
    output sig_Full ;
    reg sig_Full = 0;
    output reg sig_Temperature = 0;
    output reg sig_Completed = 0;
    output [1:0] mode;

    reg [2:0] counter = 0;
    /*reg [1:0] fill_Water_Counter;
    reg [1:0] heat_Water_Counter;
    reg [2:0] wash_Counter;
    reg [1:0] rinse_Counter;
    reg [1:0] spin_Counter;
    reg [1:0] mode = 0;*/

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
        /*if (fill_Water_Counter == FULL_WATER_TIME) begin
            mode = 2'd1;
            sig_Full = 1'b1;
        end
        else if (heat_Water_Counter == REQUIRED_TEMPERATURE_TIME) begin
            mode = 2'd2;
        end
        else if (wash_Counter == WASH_TIME   | 
            rinse_Counter == RINSE_TIME |
            spin_Counter == SPIN_TIME ) begin
            mode = 2'd3;
        end
        else begin
            mode = 0;
        end
        */
        case (state)
            STATE_FILL_WATER: begin
                counter <= counter + 1'd1;
                
            end
            STATE_HEAT_WATER: begin
                counter <= counter + 1'd1;
                
            end
            STATE_WASH: begin
                counter <= counter + 1'd1;
                
            end
            STATE_RINSE: begin
                counter <= counter + 1'd1;
                
            end
            STATE_SPIN: begin
                counter <= counter + 1'd1;
                
            end
            default : begin
                counter <= counter + 1'd1;
            end
        endcase
    end
    always @(counter) begin
        sig_Full = (counter == FULL_WATER_TIME);
    end

    //assign sig_Full = (mode == 2'd1)? 1'b1 : 1'b0;
    //assign sig_Temperature = (mode == 2'd2)? 1'b1 : 1'b0;
    // ssign sig_Completed  = (mode == 2'd3)? 1'b1 : 1'b0;      

endmodule
