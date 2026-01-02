`include "transaction.sv";
`include "generator.sv";
`include "driver.sv";
`include "monitor.sv";
`include  "scoreboard.sv";

 class environment ;
   generator gen;
   driver drv;
   monitor mon;
   scoreboard sco;
   
   mailbox gen2drv;
   mailbox mon2sco;
   
   virtual intf vif;
   
   function new (virtual intf vif);
     this.vif=vif;
     
     gen2drv=new();
     mon2sco=new();
     gen=new(gen2drv);
     drv=new(vif,gen2drv);
     mon = new(vif,mon2sco);
     sco=new(mon2sco);
     
   endfunction
   
   
   task run();
   fork 
     gen.main();
     drv.main();
     mon.main();
    sco.main(); 
   join_none
  
   endtask
   
 endclass
     
     