`timescale 1ns/1ps
module tb_seq_gen;
reg clk;
reg reset;
wire [3:0] out;
seq_gen dut (.clk(clk),.reset(reset),.out(out));
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
task apply_reset;
begin
    reset = 1;
    #20;
    reset = 0;
end
endtask
task monitor_output;
begin
    $display("Time\tReset\tOutput");
    $monitor("%0t\t%b\t%d",$time,reset,out);
end
endtask
initial
begin
    apply_reset();
    monitor_output();
    #500   $finish;
end
  initial   
    begin   
      $dumpfile("dump.vcd");
      $dumpvars(3, tb_seq_gen);    
    end
endmodule
