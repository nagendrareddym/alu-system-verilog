`include "interface.sv"
`include "environment.sv"
module testbench;
 intf vif();

  environment env;
    
    
  full_adder FA (.a(vif.a),
                 .b(vif.b),
                 .c(vif.c),
                 .sum(vif.sum),
                 .carry(vif.carry));
initial begin
  #10 $finish();
end
    initial begin 
      env = new(vif);
      env.run();
      $dumpfile("dump.vcd");
      $dumpvars(0,testbench);
  end
  endmodule
    
    
    
    