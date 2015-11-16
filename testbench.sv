module testbench();

timeunit 100ns;

timeprecision 1ns;

logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size;
logic [10:0] shape_x,shape_y;
logic [7:0]  Red, Green, Blue;
logic [31:0] data;
logic [3:0] sel;
													


color_mapper RoM(.*); 

//always begin : CLOCK_GENERATION
//#1 clk = ~clk;

//end


initial begin: TEST_VECTORS

BallX = 0;
BallY = 0;
DrawX = 0;
shape_x = 290;
shape_y = 350;
DrawY=0;
Ball_size=0;
sel = 5; //draw 5th sprite

for(int i=0; i<=640; i++)
	begin
		if((i%640==0) && i!=0) 
		begin
			i=0;
			DrawY++;
		end
	#1 DrawX = i;
	end
end
endmodule