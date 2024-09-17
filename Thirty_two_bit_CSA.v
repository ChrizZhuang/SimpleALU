module Thirty_two_bit_CSA(A, B, Cin, S, Cout, Ovf);
	input [31:0] A, B;
	input Cin;
	
	output [31:0] S;
	output Cout, Ovf;
	
	// declare for first 16 bits Cout and two possible Couts for last 16 bits
	wire Cout_15_0, Cout_31_16_2, Cout_31_16_3; 
	// declare for the two possible Cins for last 16 bits and their true value for Ovf calculation
	wire Cin_MSB_2, Cin_MSB_3, Cin_MSB, Cin_MSB_stage1;
	
	wire [15:0] S2, S3;
	
	Sixteen_bit_CLA Sixteen_bit_CLA_1(A[15:0], B[15:0], Cin, S[15:0], Cout_15_0, Cin_MSB_stage1);
	Sixteen_bit_CLA Sixteen_bit_CLA_2(A[31:16], B[31:16], 1'b0, S2, Cout_31_16_2, Cin_MSB_2);
	Sixteen_bit_CLA Sixteen_bit_CLA_3(A[31:16], B[31:16], 1'b1, S3, Cout_31_16_3, Cin_MSB_3);
	
	mux_2to1_16bit MUX16(S2, S3, Cout_15_0, S[31:16]);
	mux_2to1_1bit MUX1_1(Cout_31_16_2, Cout_31_16_3, Cout_15_0, Cout);
	mux_2to1_1bit MUX1_2(Cin_MSB_2, Cin_MSB_3, Cout_15_0, Cin_MSB);
	
	// Calculate overflow bit
	xor(Ovf, Cin_MSB, Cout);
	
endmodule	
	