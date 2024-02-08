`timescale 1ns / 1ps

module determineAmount(
    input [5:0] switch,
    output [7:0] amount,
    output LED
    );
    
    reg [7:0] c_amount = 8'b00000000; 
    
    
    always @(switch)
    begin
        case(switch)
            1: c_amount = 8'b00000001; 
            2: c_amount = 8'b00000101; 
            4: c_amount = 8'b00001010; 
            8: c_amount = 8'b00010100; 
            16: c_amount = 8'b00110010; 
            32: c_amount = 8'b01100100; 
            default: c_amount = 8'b00000000;  
        endcase
    end
    
    assign amount = c_amount;
    
    reg active = 1'b0; 
    
    
    always @(switch)
    begin
        case(switch)
            0: active = 1'b0; 
            1: active = 1'b0; 
            2: active = 1'b0; 
            4: active = 1'b0; 
            8: active = 1'b0; 
            16: active = 1'b0; 
            32: active = 1'b0; 
            default: active = 1'b1; 
        endcase
    end
    
    assign LED = active;
    
endmodule
