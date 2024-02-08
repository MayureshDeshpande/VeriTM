`timescale 1ns / 1ps

module eight_bit_counter(
    input clk, 
    output [7:0] Q
    );
    reg [7:0] temp=0; 
    always @(posedge clk) 
    begin
    temp= temp + 1;
    end
    assign Q = temp; 
    
endmodule
