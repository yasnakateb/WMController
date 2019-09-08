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


    parameter STATE_START = 3'd0 ;
    parameter STATE_READY = 3'd1;
    parameter STATE_SOAK = 3'd2;
    parameter STATE_WASH = 3'd3;
    parameter STATE_RINSE = 3'd4;
    parameter STATE_SPIN = 3'd5;

    reg [2:0] state = STATE_IDLE;
    reg [2:0] next_State;

    always @( posedge clk ) begin
        state = next_State;
    end

    always @( * ) begin
        case (state)
            STATE_START: begin

            end
            STATE_READY: begin
                
            end
            STATE_SOAK: begin
                
            end
            STATE_WASH: begin
                
            end
            STATE_RINSE: begin
                
            end
            STATE_SPIN: begin
                
            end
    end






endmodule