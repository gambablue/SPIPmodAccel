`timescale 1ns / 1ps
// Created by David J. Marion
// Date 7.22.2022
// For NexysA7 Accelerometer Reading

module seg7_control(
    input logic CLK100MHZ,
    input logic [14:0] acl_data,
    output logic [6:0] seg,
    output logic dp,
    output logic [3:0] an
);

    // Take sign bits out of accelerometer data
    logic x_sign, y_sign, z_sign;
    assign x_sign = acl_data[14];
    assign y_sign = acl_data[9];
    assign z_sign = acl_data[4];
    
    // Take 6 bits of axis data out of accelerometer data
    logic [3:0] x_data, y_data, z_data;
    assign x_data = acl_data[13:10];
    assign y_data = acl_data[8:5];
    assign z_data = acl_data[3:0];
    
    // Binary to BCD conversion for each axis 6-bit data
    logic [3:0] x_10, x_1, y_10, y_1, z_10, z_1;
    logic [3:0] x_10_stable, x_1_stable, y_10_stable, y_1_stable, z_10_stable, z_1_stable;
    
 //   logic [3:0] x_scaled, y_scaled, z_scaled;

// Scale and map 5-bit data to 4-bit decimal (0-9)
//    always_comb begin
//        x_scaled = (acl_data[13:10] * 9) / 15; // Scale X-axis
//        y_scaled = (acl_data[8:5] * 9) / 15;  // Scale Y-axis
//        z_scaled = (acl_data[3:0] * 9) / 15;  // Scale Z-axis
//    end
    
//    assign x_10 = x_scaled / 10;
//    assign x_1  = x_scaled % 10;
//    assign y_10 = y_scaled / 10;
//    assign y_1  = y_scaled % 10;
//    assign z_10 = z_scaled / 10;
//    assign z_1  = z_scaled % 10;
    
    
    assign x_10 = x_data / 10;
    assign x_1  = x_data % 10;
    assign y_10 = y_data / 10;
    assign y_1  = y_data % 10;
    assign z_10 = z_data / 10;
    assign z_1  = z_data % 10;

    // Parameters for segment patterns (common anode configuration)
    parameter logic [6:0] ZERO  = 7'b1000000;  // Display '0'
    parameter logic [6:0] ONE   = 7'b1111001;  // Display '1'
    parameter logic [6:0] TWO   = 7'b0100100;  // Display '2'
    parameter logic [6:0] THREE = 7'b0110000;  // Display '3'
    parameter logic [6:0] FOUR  = 7'b0011001;  // Display '4'
    parameter logic [6:0] FIVE  = 7'b0010010;  // Display '5'
    parameter logic [6:0] SIX   = 7'b0000010;  // Display '6'
    parameter logic [6:0] SEVEN = 7'b1111000;  // Display '7'
    parameter logic [6:0] EIGHT = 7'b0000000;  // Display '8'
    parameter logic [6:0] NINE  = 7'b0010000;  // Display '9'
    parameter logic [6:0] NULL  = 7'b1111111;  // All segments off
   
    // To select each anode in turn
    logic [1:0]   anode_select    = 2'b0;     // 3-bit counter for selecting each of 4 anodes
    logic [16:0]  anode_timer     = 17'b0;    // Counter for anode refresh
    
    // Logic for controlling anode select and anode timer
    always_ff @(posedge CLK100MHZ) begin               // 1ms x 4 displays = 4ms refresh period                             
        if(anode_timer == 99_999) begin               // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
            anode_timer <= 0;                         // 10ns x 100,000 = 1ms
            anode_select <= anode_select + 1;
        end
        else
            anode_timer <= anode_timer + 1;
    end
    
    // Logic for driving the 4-bit anode output based on anode select
    always_comb begin
        case(anode_select) 
            2'b00 : an = 4'b1110;   
            2'b01 : an = 4'b1101;  
            2'b10 : an = 4'b1011;  
            2'b11 : an = 4'b0111;
        endcase
    end
    
    always_ff @(posedge CLK100MHZ) begin
        z_1_stable <= z_1;
        z_10_stable <= z_10;
        y_1_stable <= y_1;
        x_1_stable <= x_1;
    end

    // Logic for driving segments based on which anode is selected
    always_comb begin
        case(anode_select)
            2'b00 : begin
                        dp = z_sign ? 1'b0 : 1'b1;   // Z-axis sign
                        case(z_1_stable)                   // Z-axis ones digit
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            default : seg = ZERO;
                        endcase
                    end
                    
            2'b01 : begin  
                        dp = 1'b1;                    // OFF  
                        case(z_10_stable)             // Z-axis tens digit
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            default : seg = ZERO;
                        endcase
                    end
                    
            2'b10 : begin
                        dp = y_sign ? 1'b0 : 1'b1;   // Y-axis sign
                        case(y_1_stable)             // Y-axis ones digit
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            default : seg = ZERO;
                        endcase
                    end
                    
            2'b11 : begin 
                        dp = x_sign ? 1'b0 : 1'b1;   // X-axis sign
                        case(x_1_stable)             // X-axis ones digit
                            4'b0000 : seg = ZERO;
                            4'b0001 : seg = ONE;
                            4'b0010 : seg = TWO;
                            4'b0011 : seg = THREE;
                            4'b0100 : seg = FOUR;
                            4'b0101 : seg = FIVE;
                            4'b0110 : seg = SIX;
                            4'b0111 : seg = SEVEN;
                            4'b1000 : seg = EIGHT;
                            4'b1001 : seg = NINE;
                            default : seg = ZERO;
                        endcase
                    end    
        endcase    
    end
endmodule
