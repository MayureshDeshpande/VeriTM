module abh(in,out);
input [7:0]in;
output wire [11:0]out;

reg [11:0]bcd;

integer i;
always @(in)
begin
	bcd = 0;
	
	for (i=0;i<8;i=i+1)
	begin
		if (bcd[3:0] >= 5)
			bcd[3:0] = bcd[3:0] + 3;
		if (bcd[7:4] >= 5)
			bcd[7:4] = bcd[7:4] + 3;
		bcd = {bcd[10:0],in[7-i]};
	end
		
end

assign out = bcd;

endmodule