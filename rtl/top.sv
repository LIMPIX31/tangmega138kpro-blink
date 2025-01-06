module top (
    input logic rst_n,

    output logic clk,
    output logic [5:0] led
);

    internal_osc osc (.oscout(clk));

    localparam logic unsigned [23:0] CounterLimit = 24'b111111111111111111111111;
    localparam logic unsigned [5:0] LedInitial = 6'b011111;
    localparam logic unsigned [5:0] LedLimit = 6'b111110;

    logic unsigned [23:0] counter = 0;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            led <= LedInitial;
        end else if (counter < CounterLimit) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
            led <= (led >> 1) | 6'b100000;

            if (led == LedLimit) begin
                led <= LedInitial;
            end
        end
    end

endmodule : top
