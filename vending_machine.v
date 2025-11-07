// ===================================================
// Verilog-2001 Vending Machine Controller
// Compatible with Quartus II 13.0 / Cyclone II EP2C5T144C8N
// ===================================================

module vending_machine (
    input  wire clk50,
    input  wire rst_n,
    input  wire btn_coin,
    input  wire btn_select,
    output reg  led_ready,
    output reg  led_busy,
    output reg  led_done,
    output reg  led_error
);

    // ===== Manual state encoding (no enum, Quartus compatible) =====
    localparam [2:0] IDLE       = 3'b000;
    localparam [2:0] COIN_IN    = 3'b001;
    localparam [2:0] SELECTING  = 3'b010;
    localparam [2:0] DISPENSING = 3'b011;
    localparam [2:0] DONE       = 3'b100;
    localparam [2:0] ERROR      = 3'b101;

    reg [2:0] state;
    reg [2:0] next_state;
    reg [23:0] timer;

    // ===== Simple input wires =====
    wire coin_pressed   = btn_coin;
    wire select_pressed = btn_select;

    // ===== State register =====
    always @(posedge clk50 or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // ===== Timer =====
    always @(posedge clk50) begin
        if (state == DISPENSING)
            timer <= timer + 1;
        else
            timer <= 0;
    end

    // ===== Next state logic =====
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:       if (coin_pressed)   next_state = COIN_IN;
            COIN_IN:    if (select_pressed) next_state = SELECTING;
            SELECTING:                     next_state = DISPENSING;
            DISPENSING: if (timer > 25_000_000) next_state = DONE; // ~0.5 s
            DONE:                        next_state = IDLE;
            ERROR:                       next_state = IDLE;
            default:                     next_state = IDLE;
        endcase
    end

    // ===== Output logic =====
    always @(*) begin
        // Default all off
        led_ready = 0;
        led_busy  = 0;
        led_done  = 0;
        led_error = 0;

        case (state)
            IDLE:       led_ready = 1;  // waiting for coin
            COIN_IN:    led_busy  = 1;  // coin inserted
            SELECTING:  led_busy  = 1;  // selecting
            DISPENSING: led_busy  = 1;  // vending
            DONE:       led_done  = 1;  // delivered
            ERROR:      led_error = 1;  // invalid
        endcase
    end

endmodule
