module SmartWaterLevelController(
input clk, 
input reset, 
input S0, S1, S2,  // Sensors 
output reg pump  // Pump control );

// State encoding (no typedef)
parameter EMPTY = 2'b00;
parameter HALF  = 2'b01;
parameter FULL  = 2'b10;

reg [1:0] current_state, next_state;

// Sequential block: state transition
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= EMPTY;
    else
        current_state <= next_state;
end

// Combinational block: next state logic
always @(*) begin
    case (current_state)

        EMPTY: begin
            if (S1 || S2)
                next_state = HALF;
            else
                next_state = EMPTY;
        end

        HALF: begin
            if (S2)
                next_state = FULL;
            else if (!S0)
                next_state = EMPTY;
            else
                next_state = HALF;
        end

        FULL: begin
            if (!S2)
                next_state = HALF;
            else
                next_state = FULL;
        end

        default: next_state = EMPTY;
    endcase
end

// Output logic (Moore type)
always @(*) begin
    case (current_state)
        EMPTY: pump = 1'b1; // Turn ON pump
        HALF:  pump = 1'b1; // Keep pump ON
        FULL:  pump = 1'b0; // Turn OFF pump
        default: pump = 1'b0;
    endcase
end
endmodule
