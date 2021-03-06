//------------------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- RobustVerilog version 1.5g (limited free version) Jul 5 2011
//-- Invoked Wed Mar 28 12:55:30 2012
//-- Source file: ic_addr.v
//-- Parent file: ic.v
//-- Project directory: C:/Users/MARIOS/Desktop/VLSI/RobustVerilog_free1.5_win/RobustVerilog_free1.5_win/examples/axi_master/trunk/run/
//-- Target directory: out/
//-- Command flags: ..\..\..\..\robust.exe ../robust_axi_master.pro -gui 
//-- www.provartec.com/edatools ... info@provartec.com
//------------------------------------------------------------------






module axi_master_ic_addr (clk,reset,M0_ASLV,M1_ASLV,M2_ASLV,M0_AID,M0_AADDR,M0_ALEN,M0_ASIZE,M0_ABURST,M0_ACACHE,M0_APROT,M0_ALOCK,M0_AVALID,M0_AREADY,M1_AID,M1_AADDR,M1_ALEN,M1_ASIZE,M1_ABURST,M1_ACACHE,M1_APROT,M1_ALOCK,M1_AVALID,M1_AREADY,M2_AID,M2_AADDR,M2_ALEN,M2_ASIZE,M2_ABURST,M2_ACACHE,M2_APROT,M2_ALOCK,M2_AVALID,M2_AREADY,S0_AMSTR,S0_AIDOK,S0_AID,S0_AADDR,S0_ALEN,S0_ASIZE,S0_ABURST,S0_ACACHE,S0_APROT,S0_ALOCK,S0_AVALID,S0_AREADY);

   input                       clk;
   input                       reset;
   
   output [0:0]               M0_ASLV;
   output [0:0]               M1_ASLV;
   output [0:0]               M2_ASLV;
   input [3:0]                M0_AID;
   input [31:0]               M0_AADDR;
   input [3:0]                M0_ALEN;
   input [1:0]                M0_ASIZE;
   input [1:0]                M0_ABURST;
   input [3:0]                M0_ACACHE;
   input [2:0]                M0_APROT;
   input [1:0]                M0_ALOCK;
   input                      M0_AVALID;
   output                     M0_AREADY;
   input [3:0]                M1_AID;
   input [31:0]               M1_AADDR;
   input [3:0]                M1_ALEN;
   input [1:0]                M1_ASIZE;
   input [1:0]                M1_ABURST;
   input [3:0]                M1_ACACHE;
   input [2:0]                M1_APROT;
   input [1:0]                M1_ALOCK;
   input                      M1_AVALID;
   output                     M1_AREADY;
   input [3:0]                M2_AID;
   input [31:0]               M2_AADDR;
   input [3:0]                M2_ALEN;
   input [1:0]                M2_ASIZE;
   input [1:0]                M2_ABURST;
   input [3:0]                M2_ACACHE;
   input [2:0]                M2_APROT;
   input [1:0]                M2_ALOCK;
   input                      M2_AVALID;
   output                     M2_AREADY;
   output [1:0]           S0_AMSTR;
   output                       S0_AIDOK;
   output [3:0]                  S0_AID;
   output [31:0]                 S0_AADDR;
   output [3:0]                  S0_ALEN;
   output [1:0]                  S0_ASIZE;
   output [1:0]                  S0_ABURST;
   output [3:0]                  S0_ACACHE;
   output [2:0]                  S0_APROT;
   output [1:0]                  S0_ALOCK;
   output                        S0_AVALID;
   input                         S0_AREADY;
   
   
   parameter                       MASTER_NONE = 0;
   parameter                       MASTER0    = 1 << 0;
   parameter                       MASTER1    = 1 << 1;
   parameter                       MASTER2    = 1 << 2;

   parameter                       ABUS_WIDTH = 4  + 32  + 4  + 2  + 2  + 4  + 3  + 2  + 1 ;

   
   wire [ABUS_WIDTH-1:0]               S0_ABUS;
   
   wire [ABUS_WIDTH-1:0]               M0_ABUS;
   wire [ABUS_WIDTH-1:0]               M1_ABUS;
   wire [ABUS_WIDTH-1:0]               M2_ABUS;
   
   wire                       S0_M0;
   wire                       S0_M1;
   wire                       S0_M2;
   
   wire [0:0]               M0_ASLV;
   wire [0:0]               M1_ASLV;
   wire [0:0]               M2_ASLV;
   
   wire                       M0_AIDOK;
   wire                       M1_AIDOK;
   wire                       M2_AIDOK;
   
   wire [2:0]               S0_master;

   reg [1:0]               S0_AMSTR;

   wire                       S0_AIDOK;

   wire [31:0]                 M0_AADDR_valid;
   wire [31:0]                 M1_AADDR_valid;
   wire [31:0]                 M2_AADDR_valid;
   wire [3:0]                   M0_AID_valid;
   wire [3:0]                   M1_AID_valid;
   wire [3:0]                   M2_AID_valid;


   
   assign                                     M0_AADDR_valid = M0_AADDR & {32{M0_AVALID}};
   assign                                     M1_AADDR_valid = M1_AADDR & {32{M1_AVALID}};
   assign                                     M2_AADDR_valid = M2_AADDR & {32{M2_AVALID}};
   assign                                     M0_AID_valid   = M0_AID & {4{M0_AVALID}};
   assign                                     M1_AID_valid   = M1_AID & {4{M1_AVALID}};
   assign                                     M2_AID_valid   = M2_AID & {4{M2_AVALID}};

   
   axi_master_ic_dec
   axi_master_ic_dec (
          .M0_AADDR(M0_AADDR_valid),
          .M1_AADDR(M1_AADDR_valid),
          .M2_AADDR(M2_AADDR_valid),
          .M0_AID(M0_AID_valid),
          .M1_AID(M1_AID_valid),
          .M2_AID(M2_AID_valid),
          .M0_ASLV(M0_ASLV),
          .M1_ASLV(M1_ASLV),
          .M2_ASLV(M2_ASLV),
          .M0_AIDOK(M0_AIDOK),
          .M1_AIDOK(M1_AIDOK),
          .M2_AIDOK(M2_AIDOK)
          );

   
   axi_master_ic_mstr_arbiter
   axi_master_ic_mstr_arbiter(
              .clk(clk),
              .reset(reset),
      
              .M0_slave(M0_ASLV),
              .M1_slave(M1_ASLV),
              .M2_slave(M2_ASLV),
      
              .S0_master(S0_master),
      
              .M_last({3{1'b1}}),
              .M_req({M2_AVALID  , M1_AVALID  , M0_AVALID }),
              .M_grant({M2_AREADY  , M1_AREADY  , M0_AREADY })
              );
   
     always @(/*AUTOSENSE*/S0_master)         
       begin                                    
      case (S0_master)                    
        MASTER0 : S0_AMSTR = 0;         
        MASTER1 : S0_AMSTR = 1;         
        MASTER2 : S0_AMSTR = 2;         
        default : S0_AMSTR = MASTER_NONE; 
      endcase                               
       end                                      
      
     assign              S0_M0    = S0_master[0];
     assign              S0_M1    = S0_master[1];
     assign              S0_M2    = S0_master[2];
   
   assign              M0_ABUS   = {M0_AID  , M0_AADDR  , M0_ALEN  , M0_ASIZE  , M0_ABURST  , M0_ACACHE  , M0_APROT  , M0_ALOCK  , M0_AVALID };
   assign              M1_ABUS   = {M1_AID  , M1_AADDR  , M1_ALEN  , M1_ASIZE  , M1_ABURST  , M1_ACACHE  , M1_APROT  , M1_ALOCK  , M1_AVALID };
   assign              M2_ABUS   = {M2_AID  , M2_AADDR  , M2_ALEN  , M2_ASIZE  , M2_ABURST  , M2_ACACHE  , M2_APROT  , M2_ALOCK  , M2_AVALID };

   
   assign              {S0_AID  , S0_AADDR  , S0_ALEN  , S0_ASIZE  , S0_ABURST  , S0_ACACHE  , S0_APROT  , S0_ALOCK  , S0_AVALID } = S0_ABUS;
   
   
   assign              S0_ABUS  = (M2_ABUS & {ABUS_WIDTH{S0_M2}})  | (M1_ABUS & {ABUS_WIDTH{S0_M1}})  | (M0_ABUS & {ABUS_WIDTH{S0_M0}}) ;              
   assign              S0_AIDOK = (S0_M2 & M2_AIDOK)  | (S0_M1 & M1_AIDOK)  | (S0_M0 & M0_AIDOK) ;                  
   
       assign          M0_AREADY = 
                      S0_M0 ? S0_AREADY :  
                      ~M0_AVALID;            
       assign          M1_AREADY = 
                      S0_M1 ? S0_AREADY :  
                      ~M1_AVALID;            
       assign          M2_AREADY = 
                      S0_M2 ? S0_AREADY :  
                      ~M2_AVALID;            
      
     endmodule






