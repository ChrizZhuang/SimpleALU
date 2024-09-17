module Sixteen_bit_CLA(A, B, Cin, S, Cout, Cin_MSB);
	input [15:0] A, B;
	input Cin;
	
	output [15:0] S;
	output Cout, Cin_MSB;
	
	wire w1, w2, w3;
	wire Cin_MSB1, Cin_MSB2, Cin_MSB3;

	Four_bit_CLA_adder CLA_4_1(A[3:0], B[3:0], Cin, S[3:0], w1, Cin_MSB1);
	Four_bit_CLA_adder CLA_4_2(A[7:4], B[7:4], w1, S[7:4], w2, Cin_MSB2);
	Four_bit_CLA_adder CLA_4_3(A[11:8], B[11:8], w2, S[11:8], w3, Cin_MSB3);
	Four_bit_CLA_adder CLA_4_4(A[15:12], B[15:12], w3, S[15:12], Cout, Cin_MSB);
	
endmodule
	