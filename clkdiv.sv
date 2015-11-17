module clkdiv(input Clk, Reset, //clock is now 25% of the vssig
					output logic spriteclk);
					
logic [1:0] counter;

always_ff@(posedge Clk or posedge Reset)
	begin
		if(Reset)
			begin
				counter <= 0;
				spriteclk <= 0;
			end
		else if(counter == 2'b11)
			begin
				counter <= 0;
				spriteclk <= ~(spriteclk);
			end
		else
			counter <= counter+1;
	end

endmodule