module vending_top (
    input  wire clk50,
    input  wire rst_n,
    input  wire btn_coin,
    input  wire btn_select,
    output wire led_ready,
    output wire led_busy,
    output wire led_done,
    output wire led_error
);
    vending_machine vm_inst (
        .clk50(clk50),
        .rst_n(rst_n),
        .btn_coin(btn_coin),
        .btn_select(btn_select),
        .led_ready(led_ready),
        .led_busy(led_busy),
        .led_done(led_done),
        .led_error(led_error)
    );
endmodule
