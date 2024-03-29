//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk, 
					input [7:0] Keycode,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin 
				 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					begin
					  Ball_X_Motion <= 10'd0; //stop x motion
					  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					end
					  
				 else if ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
					begin
					  Ball_X_Motion <= 10'd0; //stop x motion
					  Ball_Y_Motion <= Ball_Y_Step;
					end
					  
				 else if ((Ball_X_Pos + Ball_Size >= Ball_X_Max)) //ball at right side
					begin
						Ball_Y_Motion <= 10'd0; //stop y motion
						Ball_X_Motion <= (~(Ball_X_Step) + 1'b1); //2's complement
					end
						
				 else if ((Ball_X_Pos - Ball_Size <= Ball_X_Min)) //ball at left side
					begin
						Ball_Y_Motion <= 10'd0; //stop y motion
						Ball_X_Motion <= Ball_X_Step; //2's complement	
					end
					
				else
					begin
						Ball_X_Motion <= Ball_X_Motion;// keep both motions
						Ball_Y_Motion <= Ball_Y_Motion;

							case(Keycode) //only take in keycode when we're not doing anything
							  
							  'd82: //Up
								begin
									Ball_X_Motion <= 10'd0; //stop x motion
									Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1); //go in -y direction
								end
							  
							  'd80: //Left
								begin
									Ball_Y_Motion <= 10'd0;
									Ball_X_Motion <= (~(Ball_X_Step) + 1'b1);
								end
								
							  'd79://Right
								begin
									Ball_Y_Motion <= 10'd0; //stop y motion
									Ball_X_Motion <= Ball_X_Step; //go in x motion
								end
								
							  'd81://Down
								begin
									Ball_X_Motion <= 10'd0;
									Ball_Y_Motion <= Ball_Y_Step;
								end
								
							  default:
								begin
									//do nothing
								end
								
							endcase
						end
					  
				 
				// Ball_X_Motion <= Ball_X_Motion;  // You need to remove this and make both X and Y respond to keyboard input
				 
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
