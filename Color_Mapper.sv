//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       output logic [7:0]  Red, Green, Blue,
								output logic [0:31] data);
    
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	logic shape_on; 
	logic [14:0] shape_x = 0;
	logic [14:0] shape_y = 0;
	logic [14:0] shape_x_size = 32;
	logic [14:0] shape_y_size = 52;	  
	 
	logic[14:0] address; 
	single_port_rom RoM(	.addr(address), 
								.q(data)
								);
	
    always_comb
    begin: shape
        if ((DrawX >= shape_x) && (DrawX < (shape_x+shape_x_size)) &&
				(DrawY >= shape_y) && (DrawY < (shape_y+shape_y_size)))
			begin	
            shape_on = 1'b1;
				address = (128*DrawY + DrawX);
			end
        else 
		  begin
            shape_on = 1'b0;
				address = 0;
			end
     end 
	  
    always_comb
    begin:RGB_Display
        if ((shape_on == 1'b1) && (data != 32'h00FF0000)) 
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
