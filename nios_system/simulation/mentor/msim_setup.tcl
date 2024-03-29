
# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 14.0 209 win32 2015.11.15.16:05:28

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "nios_system"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/14.0/quartus/"
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_ociram_default_contents.dat ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_ociram_default_contents.hex ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_ociram_default_contents.mif ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_a.dat ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_a.hex ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_a.mif ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_b.dat ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_b.hex ./
  file copy -force $QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_rf_ram_b.mif ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneive_ver/  
  vmap       cycloneive_ver   ./libraries/cycloneive_ver/  
}
ensure_lib                                               ./libraries/crosser/                                      
vmap       crosser                                       ./libraries/crosser/                                      
ensure_lib                                               ./libraries/rsp_mux_001/                                  
vmap       rsp_mux_001                                   ./libraries/rsp_mux_001/                                  
ensure_lib                                               ./libraries/rsp_mux/                                      
vmap       rsp_mux                                       ./libraries/rsp_mux/                                      
ensure_lib                                               ./libraries/rsp_demux_005/                                
vmap       rsp_demux_005                                 ./libraries/rsp_demux_005/                                
ensure_lib                                               ./libraries/rsp_demux/                                    
vmap       rsp_demux                                     ./libraries/rsp_demux/                                    
ensure_lib                                               ./libraries/cmd_mux_005/                                  
vmap       cmd_mux_005                                   ./libraries/cmd_mux_005/                                  
ensure_lib                                               ./libraries/cmd_mux/                                      
vmap       cmd_mux                                       ./libraries/cmd_mux/                                      
ensure_lib                                               ./libraries/cmd_demux_001/                                
vmap       cmd_demux_001                                 ./libraries/cmd_demux_001/                                
ensure_lib                                               ./libraries/cmd_demux/                                    
vmap       cmd_demux                                     ./libraries/cmd_demux/                                    
ensure_lib                                               ./libraries/router_007/                                   
vmap       router_007                                    ./libraries/router_007/                                   
ensure_lib                                               ./libraries/router_002/                                   
vmap       router_002                                    ./libraries/router_002/                                   
ensure_lib                                               ./libraries/router_001/                                   
vmap       router_001                                    ./libraries/router_001/                                   
ensure_lib                                               ./libraries/router/                                       
vmap       router                                        ./libraries/router/                                       
ensure_lib                                               ./libraries/nios2_qsys_0_jtag_debug_module_agent_rsp_fifo/
vmap       nios2_qsys_0_jtag_debug_module_agent_rsp_fifo ./libraries/nios2_qsys_0_jtag_debug_module_agent_rsp_fifo/
ensure_lib                                               ./libraries/nios2_qsys_0_jtag_debug_module_agent/         
vmap       nios2_qsys_0_jtag_debug_module_agent          ./libraries/nios2_qsys_0_jtag_debug_module_agent/         
ensure_lib                                               ./libraries/nios2_qsys_0_instruction_master_agent/        
vmap       nios2_qsys_0_instruction_master_agent         ./libraries/nios2_qsys_0_instruction_master_agent/        
ensure_lib                                               ./libraries/nios2_qsys_0_jtag_debug_module_translator/    
vmap       nios2_qsys_0_jtag_debug_module_translator     ./libraries/nios2_qsys_0_jtag_debug_module_translator/    
ensure_lib                                               ./libraries/nios2_qsys_0_instruction_master_translator/   
vmap       nios2_qsys_0_instruction_master_translator    ./libraries/nios2_qsys_0_instruction_master_translator/   
ensure_lib                                               ./libraries/rst_controller/                               
vmap       rst_controller                                ./libraries/rst_controller/                               
ensure_lib                                               ./libraries/irq_mapper/                                   
vmap       irq_mapper                                    ./libraries/irq_mapper/                                   
ensure_lib                                               ./libraries/mm_interconnect_0/                            
vmap       mm_interconnect_0                             ./libraries/mm_interconnect_0/                            
ensure_lib                                               ./libraries/otg_hpi_data/                                 
vmap       otg_hpi_data                                  ./libraries/otg_hpi_data/                                 
ensure_lib                                               ./libraries/otg_hpi_address/                              
vmap       otg_hpi_address                               ./libraries/otg_hpi_address/                              
ensure_lib                                               ./libraries/otg_hpi_cs/                                   
vmap       otg_hpi_cs                                    ./libraries/otg_hpi_cs/                                   
ensure_lib                                               ./libraries/Keycode/                                      
vmap       Keycode                                       ./libraries/Keycode/                                      
ensure_lib                                               ./libraries/jtag_uart_0/                                  
vmap       jtag_uart_0                                   ./libraries/jtag_uart_0/                                  
ensure_lib                                               ./libraries/sdram_pll/                                    
vmap       sdram_pll                                     ./libraries/sdram_pll/                                    
ensure_lib                                               ./libraries/sysid_qsys_0/                                 
vmap       sysid_qsys_0                                  ./libraries/sysid_qsys_0/                                 
ensure_lib                                               ./libraries/sdram/                                        
vmap       sdram                                         ./libraries/sdram/                                        
ensure_lib                                               ./libraries/onchip_memory2_0/                             
vmap       onchip_memory2_0                              ./libraries/onchip_memory2_0/                             
ensure_lib                                               ./libraries/nios2_qsys_0/                                 
vmap       nios2_qsys_0                                  ./libraries/nios2_qsys_0/                                 

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
    vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"           -work crosser                                      
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                     -work crosser                                      
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                     -work crosser                                      
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                          -work rsp_mux_001                                  
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_rsp_mux_001.sv"         -work rsp_mux_001                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                          -work rsp_mux                                      
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_rsp_mux.sv"             -work rsp_mux                                      
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_rsp_demux_005.sv"       -work rsp_demux_005                                
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_rsp_demux.sv"           -work rsp_demux                                    
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                          -work cmd_mux_005                                  
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_cmd_mux_005.sv"         -work cmd_mux_005                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                          -work cmd_mux                                      
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_cmd_mux.sv"             -work cmd_mux                                      
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_cmd_demux_001.sv"       -work cmd_demux_001                                
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_cmd_demux.sv"           -work cmd_demux                                    
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_router_007.sv"          -work router_007                                   
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_router_002.sv"          -work router_002                                   
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_router_001.sv"          -work router_001                                   
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0_router.sv"              -work router                                       
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                              -work nios2_qsys_0_jtag_debug_module_agent_rsp_fifo
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                         -work nios2_qsys_0_jtag_debug_module_agent         
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                  -work nios2_qsys_0_jtag_debug_module_agent         
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                        -work nios2_qsys_0_instruction_master_agent        
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                    -work nios2_qsys_0_jtag_debug_module_translator    
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                   -work nios2_qsys_0_instruction_master_translator   
  vlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                            -work rst_controller                               
  vlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                          -work rst_controller                               
  vlog -sv "$QSYS_SIMDIR/submodules/nios_system_irq_mapper.sv"                            -work irq_mapper                                   
  vlog     "$QSYS_SIMDIR/submodules/nios_system_mm_interconnect_0.v"                      -work mm_interconnect_0                            
  vlog     "$QSYS_SIMDIR/submodules/nios_system_otg_hpi_data.v"                           -work otg_hpi_data                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_otg_hpi_address.v"                        -work otg_hpi_address                              
  vlog     "$QSYS_SIMDIR/submodules/nios_system_otg_hpi_cs.v"                             -work otg_hpi_cs                                   
  vlog     "$QSYS_SIMDIR/submodules/nios_system_Keycode.v"                                -work Keycode                                      
  vlog     "$QSYS_SIMDIR/submodules/nios_system_jtag_uart_0.v"                            -work jtag_uart_0                                  
  vlog     "$QSYS_SIMDIR/submodules/nios_system_sdram_pll.vo"                             -work sdram_pll                                    
  vlog     "$QSYS_SIMDIR/submodules/nios_system_sysid_qsys_0.vo"                          -work sysid_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_sdram.v"                                  -work sdram                                        
  vlog     "$QSYS_SIMDIR/submodules/nios_system_onchip_memory2_0.v"                       -work onchip_memory2_0                             
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0.v"                           -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_jtag_debug_module_sysclk.v"  -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_jtag_debug_module_tck.v"     -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_jtag_debug_module_wrapper.v" -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_oci_test_bench.v"            -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_qsys_0_test_bench.v"                -work nios2_qsys_0                                 
  vlog     "$QSYS_SIMDIR/nios_system.v"                                                                                                      
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS -L work -L work_lib -L crosser -L rsp_mux_001 -L rsp_mux -L rsp_demux_005 -L rsp_demux -L cmd_mux_005 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L router_007 -L router_002 -L router_001 -L router -L nios2_qsys_0_jtag_debug_module_agent_rsp_fifo -L nios2_qsys_0_jtag_debug_module_agent -L nios2_qsys_0_instruction_master_agent -L nios2_qsys_0_jtag_debug_module_translator -L nios2_qsys_0_instruction_master_translator -L rst_controller -L irq_mapper -L mm_interconnect_0 -L otg_hpi_data -L otg_hpi_address -L otg_hpi_cs -L Keycode -L jtag_uart_0 -L sdram_pll -L sysid_qsys_0 -L sdram -L onchip_memory2_0 -L nios2_qsys_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS -L work -L work_lib -L crosser -L rsp_mux_001 -L rsp_mux -L rsp_demux_005 -L rsp_demux -L cmd_mux_005 -L cmd_mux -L cmd_demux_001 -L cmd_demux -L router_007 -L router_002 -L router_001 -L router -L nios2_qsys_0_jtag_debug_module_agent_rsp_fifo -L nios2_qsys_0_jtag_debug_module_agent -L nios2_qsys_0_instruction_master_agent -L nios2_qsys_0_jtag_debug_module_translator -L nios2_qsys_0_instruction_master_translator -L rst_controller -L irq_mapper -L mm_interconnect_0 -L otg_hpi_data -L otg_hpi_address -L otg_hpi_cs -L Keycode -L jtag_uart_0 -L sdram_pll -L sysid_qsys_0 -L sdram -L onchip_memory2_0 -L nios2_qsys_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
