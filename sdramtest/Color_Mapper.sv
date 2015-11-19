module  color_mapper ( input [10:0] DrawX, DrawY,
								input [3:0] select,
								input [31:0] spritedata, //data to be drawn
								input [9:0] shape_x, //choose x and y to draw at a certain location
								input [9:0] shape_y, //probably from a sprite.sv helper
							//	input [3:0] sel, //select a sprite
								output logic [7:0]  Red, Green, Blue,
							//	output logic [0:31] data,
								output logic [19:0] address
								);

/* Our modified color_mapper is used to display our sprites from ROM,
 * which contains information about the RGB values to display.
 */
 
	logic backgroundon,spriteon; //draw sprite or not. May need more logic for multiple layers.
	logic [10:0] shape_x_size = 640; //specifically for the steampunk sprite.
	logic [10:0] shape_y_size = 480; //Need more sizes for choosing between different sized sprites.
	logic [10:0] shapexsize = 32;
	logic [10:0] shapeysize = 52;
	
    always_comb
    begin: sprites
	 				backgroundon = 0;
					spriteon = 0;
        if ((DrawX >= 0) && (DrawX < shape_x_size) &&
				(DrawY >= 0) && (DrawY < shape_y_size)&& !((DrawX >= shape_x) && (DrawX < (shape_x+shapexsize)) &&
				(DrawY >= shape_y) && (DrawY < (shape_y+shapeysize))))
			begin	
            backgroundon = 1'b1;
				address = DrawX+640*DrawY;			
			end
		  else
			begin
				spriteon = 1'b1;
		  		case(select)
				4'b0000: address = (128*(DrawY-shape_y) + (DrawX-shape_x))+307201; //top left 1
				4'b0001: address = (128*(DrawY-shape_y) + (DrawX-shape_x+32))+307201; //2
				4'b0010: address = (128*(DrawY-shape_y) + (DrawX-shape_x+64))+307201; //3
				4'b0011: address = (128*(DrawY-shape_y) + (DrawX-shape_x+96))+307201; //4
				4'b0100: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x))+307201; //5
				4'b0101: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+32))+307201; //6
				4'b0110: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+64))+307201; //7
				4'b0111: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+96))+307201; //8
				4'b1000: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x))+307201; //9
				4'b1001: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+32))+307201; //10
				4'b1010: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+64))+307201; //11
				4'b1011: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+96))+307201; //12
				4'b1100: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x))+307201; //13
				4'b1101: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+32))+307201; //14
				4'b1110: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+64))+307201; //15
				4'b1111: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+96))+307201; //bottom right 16
				endcase	
			end
     end 
	  
    always_comb
    begin:RGB_Display
        if ((backgroundon == 1'b1)) //data is not trivial
        begin 
            Red = spritedata[23:16];
            Green = spritedata[15:8];
            Blue = spritedata[7:0];
        end       
        else if((spriteon == 1'b1) && (spritedata!=32'h00000000))
        begin 
            Red = spritedata[23:16];
            Green = spritedata[15:8];
            Blue = spritedata[7:0];
        end  
		  else 
			begin
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
			end
    end 
    
endmodule
