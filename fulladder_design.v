module fulladder_gatelevel(input a, b, c, output sum, carry);
 wire n1, n2, n3, n4;
 xor(n4, a, b);
 xor(sum, n4, c);
 and(n1, a, b);
 and(n2, b, c);
 and(n3, c, a);
 or(carry, n1, n2, n3);
endmodule

module fulladder_dataflow(input a,b,c, output sum,carry);
 assign sum=a^b^c;
 assign carry = a & b|b&c|c&a;
endmodule

module fulladder_behavioral(input a, b, c, output reg sum, carry);
 always @(*)begin
	 sum = a ^ b^ c;
	 carry = a & b | b & c | c & a;
 end
 endmodule
