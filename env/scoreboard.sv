class scoreboard;
  mailbox mon2sco;
  transaction trans;
  
  function new(mailbox mon2sco);
    this.mon2sco=mon2sco;
  endfunction
  
  task main();
  forever begin
    mon2sco.get(trans);
    $display("scoreboard class signal");
    
    if(((trans.a && trans.b && trans.c)==trans.sum)||(((trans.a && trans.b)||(trans.b  && trans.c)||(trans.c && trans.a))== trans.carry))
      $display(".....pass... sum=%0b",trans.sum);
    else begin
      $display("....fail...");
    $display("...transaction done..");
    end
  end 
    #1;
        endtask
endclass
  