module spritestate(input Clk, Reset, //I assume the clock is the vertical sync? So that the next sprite is drawn?
						input [7:0] Keycode, //keyboard input
						output logic [3:0] motion //how the sprite will move
				   );
						
/* This module is for taking the selection signal and making sure that the correct motion
* is taken for the sprite. For instance the walking right animation is 4 spirtes
* so we need a way to make it cycle through those 4 before repeating.		   
* THIS IS ONLY FOR THE STEAMPUNK FIGURE. But can be modified for any sprite movement.
* SPAZZES OUT TOO MUCH
*/
enum logic[3:0] {LEFTREST, LEFTMOVE, LEFTMOVE2, LEFTREST2, 
					RIGHTREST, RIGHTMOVE, RIGHTMOVE2, RIGHTREST2, 
					RWAIT, LWAIT} curr_state, next_state;
									
/* LWAIT and RWAIT are used to keep track of the sprite direction. For instance when 
* we're going right, and we're not pressing the right arrow, then we want
* the sprite to face right. Vice versa for left
*/

//Internal state logic
//Assign "next_state based on "state" and "Execute"

always_ff@(posedge Clk or posedge Reset)
	begin 
		if(Reset)
			curr_state = RWAIT; //default to looking right
		else
			curr_state  = next_state;
	end

		//Assign outputs based on "state"
always_comb
	begin
		next_state = curr_state; //Guarantees that it is replaced

/*******************Define state transition***************************/

		case(curr_state)
			RWAIT: 
				begin
					if(Keycode == 'd79)
						next_state = RIGHTREST;
					else if (Keycode == 'd80)
						next_state = LEFTREST;
					else
						next_state = RWAIT;
				end
				
			LWAIT: 
				begin
					if(Keycode == 'd79)
						next_state = RIGHTREST;
					else if (Keycode == 'd80)
						next_state = LEFTREST;
					else
						next_state = LWAIT;
				end						

/*************************RIGHT************************************/
			RIGHTREST: 
				begin	
					if(Keycode == 'd79)
						next_state = RIGHTMOVE;
					else if(Keycode == 'd80)
						next_state = LEFTREST;
					else
						next_state = RWAIT;
				end

			RIGHTMOVE:
				begin
					if(Keycode == 'd79)
						next_state = RIGHTREST2;
					else if(Keycode == 'd80)
						next_state = LEFTMOVE;								
					else
						next_state = RWAIT;
				end

			RIGHTREST2: 
				begin
					if(Keycode == 'd79)
						next_state = RIGHTMOVE2;
					else if(Keycode == 'd80)
						next_state = LEFTREST2;								
					else
						next_state = RWAIT;
				end
							  
			RIGHTMOVE2:						
				begin
					if(Keycode == 'd79)
						next_state = RIGHTREST;
					else if(Keycode == 'd80)
						next_state = LEFTMOVE2;								
					else
						next_state = RWAIT;
				end
				
/**************************LEFT*************************/					
			LEFTREST: 
				begin	
					if(Keycode == 'd80)
						next_state = LEFTMOVE;
					else if(Keycode == 'd79)
						next_state = RIGHTREST;
					else
						next_state = LWAIT;
				end

			LEFTMOVE:
				begin
					if(Keycode == 'd80)
						next_state = LEFTREST2;
					else if(Keycode == 'd79)
						next_state = RIGHTMOVE;								
					else
						next_state = LWAIT;
				end

			LEFTREST2: 
				begin
					if(Keycode == 'd80)
						next_state = LEFTMOVE2;
					else if(Keycode == 'd79)
						next_state = RIGHTREST2;								
					else
						next_state = LWAIT;
				end
							  
			LEFTMOVE2:						
				begin
					if(Keycode == 'd80)
						next_state = LEFTREST;
					else if(Keycode == 'd79)
						next_state = RIGHTMOVE2;								
					else
						next_state = LWAIT;
				end				
		endcase

/*************************Define signals******************************/		
		case(curr_state)
			RWAIT: motion = 4'b1000; //facing right rest position				
			LWAIT: motion = 4'b0100; //facing left rest position
			
/*************************RIGHT************************************/
			RIGHTREST: motion = 4'b1000; //movements right
			RIGHTMOVE: motion = 4'b1001;
			RIGHTREST2: motion = 4'b1010;	  
			RIGHTMOVE2: motion = 4'b1011;					

/*****************LEFT*************************/					
			LEFTREST: motion = 4'b0100; //movements left
			LEFTMOVE: motion = 4'b0101;
			LEFTREST2: motion = 4'b0110; 							  
			LEFTMOVE2: motion = 4'b0111;					
		endcase
	end
endmodule				
				
