class monitor;
  virtual intf vif;
  mailbox mon2sco;
      transaction trans;
  
  function new(virtual intf vif,mailbox mon2sco);
    this.vif=vif;
    this.mon2sco=mon2sco;
  endfunction
  
  task main();
  forever begin
    trans=new();
    trans.a=vif.a;
    trans.b=vif.b;
    trans.c=vif.c;
    trans.sum=vif.sum;
    trans.carry=vif.carry;
    $display("monitor signal a=%0b b=%0b",vif.a,vif.b);
    mon2sco.put(trans);
    #1;
    
  end
  endtask
endclass
    