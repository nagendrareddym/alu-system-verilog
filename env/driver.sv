class driver;
  virtual intf vif;
  
  mailbox gen2drv;
        transaction trans;
  function new (virtual intf vif, mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    forever begin

      gen2drv.get(trans);
      $display("driver signal a=%0b b=%0b",trans.a,trans.b);
      
      vif.a<=trans.a;
      vif.b<=trans.b;
      vif.c<=trans.c;
      #1;
      
      $display("driver class signal");
    end
  endtask  
endclass
  