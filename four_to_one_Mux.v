`timescale 1ns / 1ps


module four_to_one_Mux(
    input [3:0] A,
    input [3:0] B,
    input [1:0] C,
    input [3:0] D,
    input [1:0] SS,
    output [3:0] Y 
    );
    assign Y = (SS==0)?A : (SS==1)?B : (SS==2)?C : D;
    
endmodule
