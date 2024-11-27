module top(
    input logic CLK100MHZ,            // nexys a7 clock
    input logic ACL_MISO,             // master in
    output logic ACL_MOSI,            // master out
    output logic ACL_SCLK,            // spi sclk
    output logic ACL_CSN,             // spi ~chip select
    output logic [14:0] LED,          // X = LED[14:10], Y = LED[9:5], Z = LED[4:0]
    output logic [6:0] SEG,           // 7 segments of display
    output logic DP,                  // decimal point of display
    output logic [3:0] AN            // 8 displays
    );

    logic w_4MHz;
    logic [14:0] acl_data;
    logic [7:0] newone;
    logic btick;
    // Clock Generation
    iclk_gen clock_generation(
        .CLK100MHZ(CLK100MHZ),
        .clk_4MHz(w_4MHz)
    );

    // SPI Master
    spi_master master(
        .iclk(w_4MHz),
        .miso(ACL_MISO),
        .sclk(ACL_SCLK),
        .mosi(ACL_MOSI),
        .cs(ACL_CSN),
        .acl_data(acl_data)
    );

    // 7-Segment Display Control
    seg7_control display_control(
        .CLK100MHZ(CLK100MHZ),
        .acl_data(acl_data),
        .seg(SEG),
        .dp(DP),
        .an(AN)
    );

    // Assign LED data
    assign LED[14:10] = acl_data[14:10];    // 5 bits of x data
    assign LED[9:5]   = acl_data[9:5];     // 5 bits of y data
    assign LED[4:0]   = acl_data[4:0];      // 5 bits of z data

    // Connection Signals
    assign newone = {4'b0011, acl_data[13:10]};

endmodule
