module  sprite_controller ( input Reset, frame_clk, //only update at vertical sync
									input [7:0] Keycode, //from keyboard
									output [10:0]  spritex, spritey);
									
/**********************WE ONLY CARE ABOUT MOVING RIGHT SO SEL 8 to 11*********************************/	
/*
Possibly need to create some sort of state machine
or some kind of c code to tell the system that moving right cycles through 4 different sprites.
*/							
    
    logic [10:0] Sprite_XPos, Sprite_XMotion, Sprite_YPos, Sprite_YMotion;
	 
    parameter [10:0] Sprite_Xstart=290;  // Start position on the X axis
    parameter [10:0] Sprite_Ystart=350;  // Start position on the Y axis
//    parameter [10:0] Sprite_XMin=0;       // Leftmost point on the X axis
//    parameter [10:0] Sprite_XMax=639;     // Rightmost point on the X axis
//    parameter [10:0] Sprite_YMin=0;       // Topmost point on the Y axis
//    parameter [10:0] Sprite_YMax=479;     // Bottommost point on the Y axis
    parameter [10:0] Sprite_XStep=1;      // Step size on the X axis
    parameter [10:0] Sprite_YStep=1;      // Step size on the Y axis
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
         Sprite_YMotion <= 11'd0; //Sprite_YStep;
			Sprite_XMotion <= 11'd0; //Sprite_XStep;
			Sprite_YPos <= Sprite_Ystart;
			Sprite_XPos <= Sprite_Xstart;
        end
           
        else 
        begin 
		  
				case(Keycode) //only take in keycode when we're not doing anything. Up and Down aren't needed yet.
				  
//				  'd82: //Up INSTANTIATE LATER
//					begin
//						Sprite_XMotion <= 10'd0; //stop x motion
//						Sprite_YMotion <= (~(Sprite_YStep) + 1'b1); //go in -y direction
//					end
				  
				  'd80: //Left
					begin
						Sprite_YMotion <= 11'd0;
						Sprite_XMotion <= (~(Sprite_XStep) + 1'b1); //left
					end
					
				  'd79://Right
					begin
						Sprite_YMotion <= 11'd0; //stop y motion
						Sprite_XMotion <= Sprite_XStep; //go in x motion
					end
					
//				  'd81://Down INSTANTIATE LATER
//					begin
//						Sprite_XMotion <= 10'd0;
//						Sprite_YMotion <= Sprite_YStep;
//					end
					
				  default:
					begin
						Sprite_YMotion <= 11'd0; //Stop
						Sprite_XMotion <= 11'd0; //Moving
					end
					
				endcase
		  
/****************************************HIGHLY DOUBT WE WILL DO COLLISION IN HARDWARE********************/
//				 if ( (Sprite_YPos + Ball_Size) >= Sprite_YMax )  // Ball is at the bottom edge, BOUNCE!
//					begin
//					  Sprite_XMotion <= 10'd0; //stop x motion
//					  Sprite_YMotion <= (~ (Sprite_YStep) + 1'b1);  // 2's complement.
//					end
//					  
//				 else if ( (Sprite_YPos - Ball_Size) <= Sprite_YMin )  // Ball is at the top edge, BOUNCE!
//					begin
//					  Sprite_XMotion <= 10'd0; //stop x motion
//					  Sprite_YMotion <= Sprite_YStep;
//					end
//					  
//				 else if ((Sprite_XPos + Ball_Size >= Sprite_XMax)) //ball at right side
//					begin
//						Sprite_YMotion <= 10'd0; //stop y motion
//						Sprite_XMotion <= (~(Sprite_XStep) + 1'b1); //2's complement
//					end
//						
//				 else if ((Sprite_XPos - Ball_Size <= Sprite_XMin)) //ball at left side
//					begin
//						Sprite_YMotion <= 10'd0; //stop y motion
//						Sprite_XMotion <= Sprite_XStep; //2's complement	
//					end
//					
//				else
//					begin
//						Sprite_XMotion <= Sprite_XMotion;// keep both motions
//						Sprite_YMotion <= Sprite_YMotion;
//					end
					  
				 
				// Sprite_XMotion <= Sprite_XMotion;  // You need to remove this and make both X and Y respond to keyboard input
				 
				 Sprite_YPos <= (Sprite_YPos + Sprite_YMotion);  // Update position
				 Sprite_XPos <= (Sprite_XPos + Sprite_XMotion);

		end  
    end
       
    assign spritex = Sprite_XPos;
   
    assign spritey = Sprite_YPos;
    

endmodule