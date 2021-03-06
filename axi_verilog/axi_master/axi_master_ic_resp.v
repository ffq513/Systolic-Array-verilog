//------------------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- RobustVerilog version 1.5g (limited free version) Jul 5 2011
//-- Invoked Wed Mar 28 12:55:32 2012
//-- Source file: ic_resp.v
//-- Parent file: ic.v
//-- Project directory: C:/Users/MARIOS/Desktop/VLSI/RobustVerilog_free1.5_win/RobustVerilog_free1.5_win/examples/axi_master/trunk/run/
//-- Target directory: out/
//-- Command flags: ..\..\..\..\robust.exe ../robust_axi_master.pro -gui 
//-- www.provartec.com/edatools ... info@provartec.com
//------------------------------------------------------------------






module axi_master_ic_resp (clk,reset,M0_ASLV,M0_AID,M0_AVALID,M0_AREADY,M1_ASLV,M1_AID,M1_AVALID,M1_AREADY,M2_ASLV,M2_AID,M2_AVALID,M2_AREADY,M0_ID,M0_DATA,M0_RESP,M0_LAST,M0_VALID,M0_READY,M1_ID,M1_DATA,M1_RESP,M1_LAST,M1_VALID,M1_READY,M2_ID,M2_DATA,M2_RESP,M2_LAST,M2_VALID,M2_READY,S0_ID,S0_DATA,S0_RESP,S0_LAST,S0_VALID,S0_READY);

   parameter                   STRB_BITS  = 32/8;
   
   input                       clk;
   input                       reset;
   
   input [1-1:0]                        M0_ASLV;
   input [3:0]                M0_AID;
   input                      M0_AVALID;
   input                      M0_AREADY;
   input [1-1:0]                        M1_ASLV;
   input [3:0]                M1_AID;
   input                      M1_AVALID;
   input                      M1_AREADY;
   input [1-1:0]                        M2_ASLV;
   input [3:0]                M2_AID;
   input                      M2_AVALID;
   input                      M2_AREADY;
   output [3:0]               M0_ID;
   output [31:0]              M0_DATA;
   output [1:0]               M0_RESP;
   output                     M0_LAST;
   output                     M0_VALID;
   input                      M0_READY;
   output [3:0]               M1_ID;
   output [31:0]              M1_DATA;
   output [1:0]               M1_RESP;
   output                     M1_LAST;
   output                     M1_VALID;
   input                      M1_READY;
   output [3:0]               M2_ID;
   output [31:0]              M2_DATA;
   output [1:0]               M2_RESP;
   output                     M2_LAST;
   output                     M2_VALID;
   input                      M2_READY;
   input [3:0]                   S0_ID;
   input [31:0]                  S0_DATA;
   input [1:0]                   S0_RESP;
   input                         S0_LAST;
   input                         S0_VALID;
   output                        S0_READY;
   
   
   parameter                   RBUS_WIDTH = 4  + 32  + 2  + 1  + 1 ;
      
   wire                       S0_req;
   
   wire [RBUS_WIDTH-1:0]       S0_RBUS;
   
   wire [RBUS_WIDTH-1:0]       M0_RBUS;
   wire [RBUS_WIDTH-1:0]       M1_RBUS;
   wire [RBUS_WIDTH-1:0]       M2_RBUS;
   
   wire                       S0_M0;
   wire                       S0_M1;
   wire                       S0_M2;

   wire [2-1:0]       S0_MSTR;
   wire                       S0_OK;
   
   wire [1-1:0]               M0_slave;
   wire [1-1:0]               M1_slave;
   wire [1-1:0]               M2_slave;


   


   axi_master_ic_registry_resp
     axi_master_ic_registry_resp (
                  .clk(clk),
                  .reset(reset),
                  .M0_ASLV(M0_ASLV),
                  .M1_ASLV(M1_ASLV),
                  .M2_ASLV(M2_ASLV),
                  .M0_AID(M0_AID),
                  .M1_AID(M1_AID),
                  .M2_AID(M2_AID),
                  .M0_AVALID(M0_AVALID),
                  .M1_AVALID(M1_AVALID),
                  .M2_AVALID(M2_AVALID),
                  .M0_AREADY(M0_AREADY),
                  .M1_AREADY(M1_AREADY),
                  .M2_AREADY(M2_AREADY),
                  .S0_ID(S0_ID),
                  .S0_VALID(S0_VALID),
                  .S0_READY(S0_READY),
                  .S0_LAST(S0_LAST),
                  .S0_MSTR(S0_MSTR),
                  .S0_OK(S0_OK)
                  );

   
   axi_master_ic_slv_arbiter
   axi_master_ic_slv_arbiter(
             .clk(clk),
             .reset(reset),
             
             .M0_slave(S0_MSTR),
             
             .S0_master(M0_slave),
             .S1_master(M1_slave),
             .S2_master(M2_slave),
             
             .M_last({S0_LAST }),
             .M_req({S0_req }),
             .M_grant({S0_READY })
             );

  
   assign                      S0_req = S0_VALID & S0_OK;
   
   assign                      S0_M0 = M0_slave[0];
   assign                      S0_M1 = M1_slave[0];
   assign                      S0_M2 = M2_slave[0];
      
   
   assign                      S0_RBUS   = {S0_ID  , S0_DATA  , S0_RESP  , S0_LAST  , S0_VALID };

   assign                      {M0_ID  , M0_DATA  , M0_RESP  , M0_LAST  , M0_VALID } = M0_RBUS;
   assign                      {M1_ID  , M1_DATA  , M1_RESP  , M1_LAST  , M1_VALID } = M1_RBUS;
   assign                      {M2_ID  , M2_DATA  , M2_RESP  , M2_LAST  , M2_VALID } = M2_RBUS;

     assign                      M0_RBUS = (S0_RBUS & {RBUS_WIDTH{S0_M0}}) ;
   
     assign                      M1_RBUS = (S0_RBUS & {RBUS_WIDTH{S0_M1}}) ;
   
     assign                      M2_RBUS = (S0_RBUS & {RBUS_WIDTH{S0_M2}}) ;
   
      

       assign                      S0_READY = (S0_M2 & M2_READY)  | (S0_M1 & M1_READY)  | (S0_M0 & M0_READY) ;
   
   
endmodule






