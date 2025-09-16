`include "fulladder_design.v"
module tb;
reg a,b,c;
wire sum_gate, carry_gate;
wire sum_dataflow, carry_dataflow;
wire sum_behavioral, carry_behavioral;
fulladder_gatelevel u1(.a(a), .b(b), .c(c), .sum(sum_gate), .carry(carry_gate));
fulladder_dataflow u2(.a(a), .b(b), .c(c),.sum(sum_dataflow), .carry(carry_dataflow));
fulladder_behavioral u3(.a(a), .b(b), .c(c),.sum(sum_behavioral), .carry(carry_behavioral));
initial begin
 $display("a b c | Gate Dataflow Behavioral");
 repeat (10)begin
   {a,b,c}=$random; #10;
   $display("%b %b %b | sum=%b carry=%b| sum = %b carry = %b | sum = %b carry = %b", a, b, c, sum_gate, carry_gate, sum_dataflow, carry_dataflow, sum_behavioral, carry_behavioral); 
 end
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(1,tb);
end
endmodule

