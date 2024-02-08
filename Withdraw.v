`timescale 1ns / 1ps

module Withdraw(

input clk,
input reset,
input Down_Button,
output count_down); 

localparam S00 = 0, FLAG = 1; 
reg [1:0] current_state = 0; 
reg [1:0] next_state = 0; 
reg set_flag = 1; 

always @(posedge clk) begin
    if (reset) current_state <= S00;
    else current_state <= next_state;
end
always @(current_state, Down_Button)// 
begin
    case(current_state)
        S00: begin
            if (Down_Button)
                next_state = FLAG;
            else
                next_state = S00;
        end
        FLAG: begin
            next_state = S00;
        end
        default: begin 
            next_state = S00;
        end
endcase
end
always @(current_state) begin
    case (current_state)
        S00: begin
        set_flag = 0;
    end
        FLAG: begin
        set_flag = 1;
    end
    default: begin
        set_flag = 0;
    end
endcase
end
endmodule


