`timescale 1ns / 1ps

module counter(
input clk,
input reset,
input increment, 
input decrement, 
input [7:0] amount, 
output [7:0] count, 
output LED2, 
output LED3 
);

reg[7:0] current_count = 0;
always@(posedge clk) begin
    if(reset)
        current_count<=0; 
    else if(increment & (count + amount) > count) 
        current_count<= count + amount; 
    else if(decrement & amount <= count)
        current_count<= count - amount; 
    else
        current_count <= count; 
end
    assign count = current_count; 


reg set2 = 0;
always@(posedge clk) begin
    if(reset)
        set2 <=0; 
    else if(increment & (count + amount) > count) 
        set2 <=0; 
    else if(decrement & amount <= count)
        set2 <=0; 
    else if(increment & (count + amount) < count) 
        set2 <=1;
    else
        set2 <= LED2; 
end
    assign LED2 = set2;


reg set3 = 0;
always@(posedge clk) begin
    if(reset)
        set3 <=0; 
    else if(increment & (count + amount) > count) 
        set3 <=0; 
    else if(decrement & amount <= count)
        set3 <=0; 
    else if(decrement & amount > count)
        set3 <=1; 
    else
        set3 <= LED3; 
    assign LED3 = set3;
    
endmodule

