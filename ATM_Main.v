module ATM_Main(
	input clk,
	input Up_Button, 
   input Down_Button,
	input reset, 
	input [5:0] sw,
	output [2:0] LED,
	output [20:0] seg); 


	parameter zero = 4'b0000;
	wire clk_out; 
	wire deposit; 
	wire withdrawal; 
	wire [3:0] mux_out; 
	wire [1:0] counter_out; 
	wire [3:0] ones, tens, hundreds; 
	wire [7:0] amount_count; 
	wire Up_deb, Down_deb; 
	
	wire [7:0] amount;
	
	debounce U0(clk, Up_Button, Up_deb);
	
	debounce U1(clk, Down_Button, Down_deb);	
		
	Binary_BCD_Converter U2(amount_count, ones, tens, hundreds);
	
	four_to_one_Mux U3(ones, tens, hundreds, zero, counter_out, mux_out);
	
	SlowClock_100Hz U4(clk, clk_out);
	
	eight_bit_counter U5(clk_out, counter_out);
	
	Decoder U6(counter_out, an);
	wire [11:0]temp;
	
	abh brocky0(amount_count,temp);

   BCDSeven_Segment U77(temp[11:8],seg[20:14]);
   BCDSeven_Segment U777(temp[7:4], seg[13:7]);
   BCDSeven_Segment U7777(temp[3:0], seg[6:0]);
	 
	Deposit U8(clk, reset, Up_deb, deposit);
	
	Withdraw U9(clk, reset, Down_deb, withdrawal);
	
	counter U10(clk, reset, deposit, withdrawal, amount, amount_count, LED[1], LED[2]);

	ATM U11(sw, amount, LED[0]);
		
endmodule

