// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0005
// role:width:direction:                              in_port:16:output,out_port:16:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0005
(
   sig_in_port,
   sig_out_port
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output [15 : 0] sig_in_port;
   input [15 : 0] sig_out_port;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [15 : 0] ROLE_in_port_t;
   typedef logic [15 : 0] ROLE_out_port_t;

   reg [15 : 0] in_port_temp;
   reg [15 : 0] in_port_out;
   logic [15 : 0] out_port_in;
   logic [15 : 0] out_port_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_out_port_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "14.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // in_port
   // -------------------------------------------------------

   function automatic void set_in_port (
      ROLE_in_port_t new_value
   );
      // Drive the new value to in_port.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      in_port_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // out_port
   // -------------------------------------------------------
   function automatic ROLE_out_port_t get_out_port();
   
      // Gets the out_port input value.
      $sformat(message, "%m: called get_out_port");
      print(VERBOSITY_DEBUG, message);
      return out_port_in;
      
   endfunction

   assign sig_in_port = in_port_temp;
   assign out_port_in = sig_out_port;


   always @(out_port_in) begin
      if (out_port_local != out_port_in)
         -> signal_input_out_port_change;
      out_port_local = out_port_in;
   end
   


// synthesis translate_on

endmodule

