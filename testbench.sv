module testbench();

timeunit 100ns;

timeprecision 1ns;

logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size;
logic [7:0]  Red, Green, Blue;
logic [14:0] address;
logic [31:0] data;
													


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

#10 address = 16'd139;
#10 address = 16'd140;

end
endmodule