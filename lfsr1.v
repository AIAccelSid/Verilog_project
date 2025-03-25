module LFSR(input clk, rst, output reg [3:0] op);
    always@(posedge clk) begin
      if(rst) op <= 4'hf;
      else op = {op[2:0],(op[3]^op[2])};
    end
  endmodule

  module TB;
    reg clk, rst;
    wire [3:0]op;
    
    LFSR lfsr1(clk, rst, op);
    
    initial begin
      $monitor("op=%b",op);
      clk = 0; rst = 1;
      #5 rst = 0;
      #50; $finish;
    end
    
    always #2 clk=~clk;
    
    initial begin 
      $dumpfile("dump.vcd"); $dumpvars;
    end
  endmodule