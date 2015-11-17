module  color_mapper ( input [9:0] DrawX, DrawY,
								input [9:0] shape_x, //choose x and y to draw at a certain location
								input [9:0] shape_y, //probably from a sprite.sv helper
								input [3:0] sel, //select a sprite
								output logic [7:0]  Red, Green, Blue,
								output logic [0:31] data);

/* Our modified color_mapper is used to display our sprites from ROM,
 * which contains information about the RGB values to display.
 */
 
	logic shape_on; //draw sprite or not. May need more logic for multiple layers.
	logic [9:0] shape_x_size = 32; //specifically for the steampunk sprite.
	logic [9:0] shape_y_size = 52; //Need more sizes for choosing between different sized sprites.	 
	 
	logic[14:0] address; 
	single_port_rom RoM(	.addr(address), //instantiated ROM containing sprite 
								.q(data)
								);
	
    always_comb
    begin: shape
        if ((DrawX >= shape_x) && (DrawX < (shape_x+shape_x_size)) &&
				(DrawY >= shape_y) && (DrawY < (shape_y+shape_y_size)))
			begin	
            shape_on = 1'b1;			
				case(sel)
				4'b0000: address = (128*(DrawY-shape_y) + (DrawX-shape_x)); //top left 1
				4'b0001: address = (128*(DrawY-shape_y) + (DrawX-shape_x+32)); //2
				4'b0010: address = (128*(DrawY-shape_y) + (DrawX-shape_x+64)); //3
				4'b0011: address = (128*(DrawY-shape_y) + (DrawX-shape_x+96)); //4
				4'b0100: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x)); //5
				4'b0101: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+32)); //6
				4'b0110: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+64)); //7
				4'b0111: address = (128*(DrawY-shape_y+52) + (DrawX-shape_x+96)); //8
				4'b1000: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x)); //9
				4'b1001: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+32)); //10
				4'b1010: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+64)); //11
				4'b1011: address = (128*(DrawY-shape_y+104) + (DrawX-shape_x+96)); //12
				4'b1100: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x)); //13
				4'b1101: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+32)); //14
				4'b1110: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+64)); //15
				4'b1111: address = (128*(DrawY-shape_y+156) + (DrawX-shape_x+96)); //bottom right 16
				endcase
			end
        else 
		  begin
            shape_on = 1'b0;
				address = 0;
			end
     end 
	  
    always_comb
    begin:RGB_Display
        if ((shape_on == 1'b1) && (data != 32'h00FF0000)) //data is not trivial
        begin 
            Red = data[16:23];
            Green = data[8:15];
            Blue = data[0:7];
        end       
        else 
        begin 
            Red = 8'h3f; 
            Green = 8'h00;
            Blue = 8'h3f - DrawX[9:3];
        end      
    end 
    
endmodule
