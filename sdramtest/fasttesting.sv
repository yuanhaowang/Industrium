module  fasttesting 		( input         CLOCK_50,
                       input[3:0]    KEY, //bit 0 is set up as Reset
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  //output [8:0]  LEDG,
							  //output [17:0] LEDR,
							  // VGA Interface 
                       output [7:0]  VGA_R,					//VGA Red
							                VGA_G,					//VGA Green
												 VGA_B,					//VGA Blue
							  output        VGA_CLK,				//VGA Clock
							                VGA_SYNC_N,			//VGA Sync signal
												 VGA_BLANK_N,			//VGA Blank signal
												 VGA_VS,					//VGA virtical sync signal	
												 VGA_HS,					//VGA horizontal sync signal
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output        OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output [12:0] DRAM_ADDR,				// SDRAM Address 13 Bits
							  inout [31:0]  DRAM_DQ,				// SDRAM Data 32 Bits
							  output [1:0]  DRAM_BA,				// SDRAM Bank Address 2 Bits
							  output [3:0]  DRAM_DQM,				// SDRAM Data Mast 4 Bits
							  output			 DRAM_RAS_N,			// SDRAM Row Address Strobe
							  output			 DRAM_CAS_N,			// SDRAM Column Address Strobe
							  output			 DRAM_CKE,				// SDRAM Clock Enable
							  output			 DRAM_WE_N,				// SDRAM Write Enable
							  output			 DRAM_CS_N,				// SDRAM Chip Select
							  output			 DRAM_CLK				// SDRAM Clock
											);
    
    logic Reset_h, vssig, Clk, spriteclk;
    logic [10:0] drawxsig, drawysig, spritexsig, spriteysig;
	 logic [3:0] select;
	 logic [15:0] keycode;
	 assign Clk = CLOCK_50;
    assign {Reset_h}=~ (KEY[0]);  // The push buttons are active low
	
	 
	 wire [1:0] hpi_addr;
	 wire [15:0] hpi_data_in, hpi_data_out;
	 wire hpi_r, hpi_w,hpi_cs;
	 
	 hpi_io_intf hpi_io_inst(   .from_sw_address(hpi_addr),
										 .from_sw_data_in(hpi_data_in),
										 .from_sw_data_out(hpi_data_out),
										 .from_sw_r(hpi_r),
										 .from_sw_w(hpi_w),
										 .from_sw_cs(hpi_cs),
		 								 .OTG_DATA(OTG_DATA),    
										 .OTG_ADDR(OTG_ADDR),    
										 .OTG_RD_N(OTG_RD_N),    
										 .OTG_WR_N(OTG_WR_N),    
										 .OTG_CS_N(OTG_CS_N),    
										 .OTG_RST_N(OTG_RST_N),   
										 .OTG_INT(OTG_INT),
										 .Clk(Clk),
										 .Reset(Reset_h)
	 );
	 
	 //The connections for nios_system might be named different depending on how you set up Qsys
//		logic [24:0] sdram_address;          //           sdram.address
//		logic [3:0]  sdram_byteenable_n;     //                .byteenable_n
		logic sdram_chipselect;       //                .chipselect
		logic [31:0] sdram_writedata, writedata;        //                .writedata
		logic        sdram_read_n;           //                .read_n
		logic        sdram_write_n;          //                .write_n
		logic rw;
		logic [19:0] address;
		logic [31:0] data; 
		
		logic [31:0] sdram_readdata, spritedata;         //                .readdata
		logic        sdram_readdatavalid;    //                .readdatavalid
		logic        sdram_waitrequest;      //                .waitrequest	 	
		wire [31:0] Data;

//	assign address = {9'b0, SW[15:0]};
//	assign rw = SW[16];
//	assign sdram_chipselect = SW[17];

//	tristate #(.N(32)) tr0(
//		.Clk(Clk), .OE(~sdram_write_n), .In(sdram_writedata), .Out(dramdata), .Data1(writedata), .Data2(sdram_readdata)
//	);
	
//	sdram memory(.*,
//					 .data(32'h23756856),
//					 .sdram_chipselect(SW[17]),
//					 .rw(SW[16]), //1 means write, 0 means read
//					 .sdram_readdata(sdram_readdata),         //                .readdata
//					 .sdram_readdatavalid(sdram_readdatavalid),    //                .readdatavalid
//					 .sdram_waitrequest(sdram_waitrequest),      //                .waitrequest							 
//					 .sdram_address(),          //           sdram.address
//					 .sdram_byteenable_n(),     //                .byteenable_n
//					 .sdram_chipselect(),       //                .chipselect
//					 .sdram_writedata(writedata),        //                .writedata
//					 .spritedata(spritedata)
//					 .sdram_read_n(),           //                .read_n
//					 .sdram_write_n()          //                .write_n
//					 );			
	 
	 nios_system nios_system(
										 .clk_clk(Clk),         
										 .reset_reset_n(KEY[0]),   
										 .sdram_wire_addr(DRAM_ADDR), 
										 .sdram_wire_ba(DRAM_BA),   
										 .sdram_wire_cas_n(DRAM_CAS_N),
										 .sdram_wire_cke(DRAM_CKE),  
										 .sdram_wire_cs_n(DRAM_CS_N), 
										 .sdram_wire_dq(DRAM_DQ),   
										 .sdram_wire_dqm(DRAM_DQM),  
										 .sdram_wire_ras_n(DRAM_RAS_N),
										 .sdram_wire_we_n(DRAM_WE_N), 
										 .sdram_address(address),          //           sdram.address
										 .sdram_byteenable_n(4'b1111),     //                .byteenable_n
										 .sdram_chipselect(1),       //                .chipselect
										 .sdram_writedata(0),        //                .writedata
										 .sdram_read_n(0),           //                .read_n
										 .sdram_write_n(1),          //                .write_n
										 .sdram_readdata(spritedata),         //                .readdata
										 .sdram_readdatavalid(sdram_readdatavalid),    //                .readdatavalid
									    .sdram_waitrequest(sdram_waitrequest),      //                .waitrequest										 
										 .sdram_clk_clk(DRAM_CLK), //changed
										 .keycode_export(keycode),  
										 .otg_hpi_address_export(hpi_addr),
										 .otg_hpi_data_in_port(hpi_data_in),
										 .otg_hpi_data_out_port(hpi_data_out),
										 .otg_hpi_cs_export(hpi_cs),
										 .otg_hpi_r_export(hpi_r),
										 .otg_hpi_w_export(hpi_w)
											);			
											
   vga_controller vgasync_instance(.*,
												.Reset(Reset_h),
												.hs(VGA_HS),        // Horizontal sync pulse.  Active low
								            .vs(VGA_VS),        // Vertical sync pulse.  Active low
												.pixel_clk(VGA_CLK), // 25 MHz pixel clock output
												.blank(VGA_BLANK_N),     // Blanking interval indicator.  Active low.
												.sync(VGA_SYNC_N),      // Composite Sync signal.  Active low.  We don't use it in this lab, but the video DAC on the DE2 board requires an input for it.
												.DrawX(drawxsig),     // horizontal coordinate
								            .DrawY(drawysig)
												);
   
	 assign vssig = VGA_VS;
   /*Possible timing issue between spritestatae and sprite_controller?
	* Ideally we need both motion and spritex and spritey to be coordinated 
	* so that color_mapper can map the correct color.
	*/
    sprite_controller sprite(.Reset(Reset_h), 
							  .frame_clk(vssig), //clocked on VSYNC as detailed in vga tutorial
							  .Keycode(keycode),
							  .spritex(spritexsig), 
							  .spritey(spriteysig)
							  );			  
							  
	 spritestate states(.Clk(vssig), //theoretically only every frame creation should prompt change in motion 
							  .Reset(Reset_h),
							  .Keycode(keycode), //keyboard input
						     .motion(select) //how the sprite will move
							  );		
    color_mapper color_instance(.select(select),
										.DrawX(drawxsig), 
										.DrawY(drawysig), //draw signal from vga controller
										.spritedata(spritedata),
										.shape_x(spritexsig), //sprite x and y from sprite controller
										.shape_y(spriteysig),
										.Red(VGA_R), //output color
										.Green(VGA_G), 
										.Blue(VGA_B),
										.address(address)
										);																			
											
//	 HexDriver hex_inst_0 (spritedata[3:0], HEX0);
//	 HexDriver hex_inst_1 (spritedata[7:4], HEX1);
//	 HexDriver hex_inst_2 (spritedata[11:8], HEX2);
//	 HexDriver hex_inst_3 (spritedata[15:12], HEX3);	 
//	 HexDriver hex_inst_4 (spritedata[19:16], HEX4);
//	 HexDriver hex_inst_5 (spritedata[23:20], HEX5);
//	 HexDriver hex_inst_6 (spritedata[27:24], HEX6);
//	 HexDriver hex_inst_7 (spritedata[31:28], HEX7);
										 
endmodule