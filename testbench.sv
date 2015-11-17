module testbench();

timeunit 10ns;

timeprecision 1ns;


//logic [10:0] BallX, BallY, DrawX, DrawY, Ball_size;
//logic [10:0] shape_x,shape_y;
//logic [7:0]  Red, Green, Blue;
//logic [31:0] data;
//logic [3:0] sel;												
//color_mapper RoM(.*); 

logic Clk=0, Reset; //I assume the clock is the vertical sync? So that the next sprite is drawn?
logic [7:0] Keycode; //keyboard input
logic [3:0] motion; //how the sprite will move
spritestate states(.*);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;

end
initial begin: TEST_VECTORS
	Reset = 0;
	Keycode = 0;
	
	#10 Reset = 1;
	#10 Reset = 0;
	
	#40 Keycode = 'd80; //left
	#40 Keycode = 'd79; //right
	#40 Keycode = 0; //should face right
	#40 Keycode = 'd79; //right
	#40 Keycode = 'd80; //left
	#40 Keycode = 0; //should face left	
end

//initial begin: TEST_VECTORS
//
//BallX = 0;
//BallY = 0;
//DrawX = 0;
//shape_x = 290;
//shape_y = 350;
//DrawY=0;
//Ball_size=0;
//sel = 5; //draw 5th sprite
//
//for(int i=0; i<=640; i++)
//	begin
//		if((i%640==0) && i!=0) 
//		begin
//			i=0;
//			DrawY++;
//		end
//	#1 DrawX = i;
//	end
//end

endmodule