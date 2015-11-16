module testbench();

timeunit 100ns;

timeprecision 1ns;

logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size;
logic [7:0]  Red, Green, Blue;
logic [31:0] data;
logic [14:0] i;
													


color_mapper RoM(.*); 

//always begin : CLOCK_GENERATION
//#1 clk = ~clk;

//end


initial begin: TEST_VECTORS

BallX = 0;
BallY = 0;
DrawX = 0;
DrawY=0;
Ball_size=0;

for(i=0; i<26624; i++)
	begin
		if((i%128==0) && i!=0) 
		begin
			i=0;
			DrawY++;
		end
	#1 DrawX = i;
	end
end
endmodule