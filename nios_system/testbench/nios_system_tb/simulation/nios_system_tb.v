// nios_system_tb.v

// Generated using ACDS version 14.0 209 at 2015.11.15.16:03:39

`timescale 1 ps / 1 ps
module nios_system_tb (
	);

	wire         nios_system_inst_clk_bfm_clk_clk;                  // nios_system_inst_clk_bfm:clk -> [nios_system_inst:clk_clk, nios_system_inst_reset_bfm:clk]
	wire         nios_system_inst_reset_bfm_reset_reset;            // nios_system_inst_reset_bfm:reset -> nios_system_inst:reset_reset_n
	wire         nios_system_inst_sdram_wire_cs_n;                  // nios_system_inst:sdram_wire_cs_n -> nios_system_inst_sdram_wire_bfm:sig_cs_n
	wire   [1:0] nios_system_inst_sdram_wire_ba;                    // nios_system_inst:sdram_wire_ba -> nios_system_inst_sdram_wire_bfm:sig_ba
	wire   [3:0] nios_system_inst_sdram_wire_dqm;                   // nios_system_inst:sdram_wire_dqm -> nios_system_inst_sdram_wire_bfm:sig_dqm
	wire         nios_system_inst_sdram_wire_cke;                   // nios_system_inst:sdram_wire_cke -> nios_system_inst_sdram_wire_bfm:sig_cke
	wire  [12:0] nios_system_inst_sdram_wire_addr;                  // nios_system_inst:sdram_wire_addr -> nios_system_inst_sdram_wire_bfm:sig_addr
	wire         nios_system_inst_sdram_wire_we_n;                  // nios_system_inst:sdram_wire_we_n -> nios_system_inst_sdram_wire_bfm:sig_we_n
	wire         nios_system_inst_sdram_wire_ras_n;                 // nios_system_inst:sdram_wire_ras_n -> nios_system_inst_sdram_wire_bfm:sig_ras_n
	wire  [31:0] nios_system_inst_sdram_wire_dq;                    // [] -> [nios_system_inst:sdram_wire_dq, nios_system_inst_sdram_wire_bfm:sig_dq]
	wire         nios_system_inst_sdram_wire_cas_n;                 // nios_system_inst:sdram_wire_cas_n -> nios_system_inst_sdram_wire_bfm:sig_cas_n
	wire  [15:0] nios_system_inst_keycode_export;                   // nios_system_inst:keycode_export -> nios_system_inst_keycode_bfm:sig_export
	wire         nios_system_inst_otg_hpi_cs_export;                // nios_system_inst:otg_hpi_cs_export -> nios_system_inst_otg_hpi_cs_bfm:sig_export
	wire   [1:0] nios_system_inst_otg_hpi_address_export;           // nios_system_inst:otg_hpi_address_export -> nios_system_inst_otg_hpi_address_bfm:sig_export
	wire  [15:0] nios_system_inst_otg_hpi_data_out_port;            // nios_system_inst:otg_hpi_data_out_port -> nios_system_inst_otg_hpi_data_bfm:sig_out_port
	wire  [15:0] nios_system_inst_otg_hpi_data_bfm_conduit_in_port; // nios_system_inst_otg_hpi_data_bfm:sig_in_port -> nios_system_inst:otg_hpi_data_in_port
	wire         nios_system_inst_otg_hpi_r_export;                 // nios_system_inst:otg_hpi_r_export -> nios_system_inst_otg_hpi_r_bfm:sig_export
	wire         nios_system_inst_otg_hpi_w_export;                 // nios_system_inst:otg_hpi_w_export -> nios_system_inst_otg_hpi_w_bfm:sig_export

	nios_system nios_system_inst (
		.clk_clk                (nios_system_inst_clk_bfm_clk_clk),                  //             clk.clk
		.sdram_wire_addr        (nios_system_inst_sdram_wire_addr),                  //      sdram_wire.addr
		.sdram_wire_ba          (nios_system_inst_sdram_wire_ba),                    //                .ba
		.sdram_wire_cas_n       (nios_system_inst_sdram_wire_cas_n),                 //                .cas_n
		.sdram_wire_cke         (nios_system_inst_sdram_wire_cke),                   //                .cke
		.sdram_wire_cs_n        (nios_system_inst_sdram_wire_cs_n),                  //                .cs_n
		.sdram_wire_dq          (nios_system_inst_sdram_wire_dq),                    //                .dq
		.sdram_wire_dqm         (nios_system_inst_sdram_wire_dqm),                   //                .dqm
		.sdram_wire_ras_n       (nios_system_inst_sdram_wire_ras_n),                 //                .ras_n
		.sdram_wire_we_n        (nios_system_inst_sdram_wire_we_n),                  //                .we_n
		.reset_reset_n          (nios_system_inst_reset_bfm_reset_reset),            //           reset.reset_n
		.sdram_clk_clk          (),                                                  //       sdram_clk.clk
		.keycode_export         (nios_system_inst_keycode_export),                   //         keycode.export
		.otg_hpi_cs_export      (nios_system_inst_otg_hpi_cs_export),                //      otg_hpi_cs.export
		.otg_hpi_address_export (nios_system_inst_otg_hpi_address_export),           // otg_hpi_address.export
		.otg_hpi_data_in_port   (nios_system_inst_otg_hpi_data_bfm_conduit_in_port), //    otg_hpi_data.in_port
		.otg_hpi_data_out_port  (nios_system_inst_otg_hpi_data_out_port),            //                .out_port
		.otg_hpi_r_export       (nios_system_inst_otg_hpi_r_export),                 //       otg_hpi_r.export
		.otg_hpi_w_export       (nios_system_inst_otg_hpi_w_export)                  //       otg_hpi_w.export
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) nios_system_inst_clk_bfm (
		.clk (nios_system_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) nios_system_inst_reset_bfm (
		.reset (nios_system_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (nios_system_inst_clk_bfm_clk_clk)        //   clk.clk
	);

	altera_conduit_bfm nios_system_inst_sdram_wire_bfm (
		.sig_addr  (nios_system_inst_sdram_wire_addr),  // conduit.addr
		.sig_ba    (nios_system_inst_sdram_wire_ba),    //        .ba
		.sig_cas_n (nios_system_inst_sdram_wire_cas_n), //        .cas_n
		.sig_cke   (nios_system_inst_sdram_wire_cke),   //        .cke
		.sig_cs_n  (nios_system_inst_sdram_wire_cs_n),  //        .cs_n
		.sig_dq    (nios_system_inst_sdram_wire_dq),    //        .dq
		.sig_dqm   (nios_system_inst_sdram_wire_dqm),   //        .dqm
		.sig_ras_n (nios_system_inst_sdram_wire_ras_n), //        .ras_n
		.sig_we_n  (nios_system_inst_sdram_wire_we_n)   //        .we_n
	);

	altera_conduit_bfm_0002 nios_system_inst_keycode_bfm (
		.sig_export (nios_system_inst_keycode_export)  // conduit.export
	);

	altera_conduit_bfm_0003 nios_system_inst_otg_hpi_cs_bfm (
		.sig_export (nios_system_inst_otg_hpi_cs_export)  // conduit.export
	);

	altera_conduit_bfm_0004 nios_system_inst_otg_hpi_address_bfm (
		.sig_export (nios_system_inst_otg_hpi_address_export)  // conduit.export
	);

	altera_conduit_bfm_0005 nios_system_inst_otg_hpi_data_bfm (
		.sig_in_port  (nios_system_inst_otg_hpi_data_bfm_conduit_in_port), // conduit.in_port
		.sig_out_port (nios_system_inst_otg_hpi_data_out_port)             //        .out_port
	);

	altera_conduit_bfm_0003 nios_system_inst_otg_hpi_r_bfm (
		.sig_export (nios_system_inst_otg_hpi_r_export)  // conduit.export
	);

	altera_conduit_bfm_0003 nios_system_inst_otg_hpi_w_bfm (
		.sig_export (nios_system_inst_otg_hpi_w_export)  // conduit.export
	);

endmodule
