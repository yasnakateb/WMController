module Timer (
    clock,
    state,
    sig_Full,
    sig_Temperature,
    sig_Completed
    );
    
    input [2:0] state;
    output sig_Full;
    output sig_Temperature;
    output sig_Completed;

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

    always @ (posedge clock) begin 
        case (state)
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

    end                    


    




endmodule
