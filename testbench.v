module test;
  reg clk,rst;
  wire red,yellow,green;
  
  TCL uut(
    .clk(clk),
    .rst(rst),
    .red(red),
    .yellow(yellow),
    .green(green)
  );
 
  always #5 clk=~clk;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,test);
      clk=0; rst=1; $monitor($time,"clk=%b,rst=%b,red=%b,yellow=%b,green=%b",clk,rst,red,yellow,green);
               #10 rst=0;
               #100 $finish;
               end
               endmodule
    
