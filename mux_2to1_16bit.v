module mux_2to1_16bit(A, B, sel, Out);
	input [15:0] A, B;
	input sel;
	output [15:0] Out;
	
	mux_2to1_1bit MUX1(A[0], B[0], sel, Out[0]);
	mux_2to1_1bit MUX2(A[1], B[1], sel, Out[1]);
	mux_2to1_1bit MUX3(A[2], B[2], sel, Out[2]);
	mux_2to1_1bit MUX4(A[3], B[3], sel, Out[3]);
	
	mux_2to1_1bit MUX5(A[4], B[4], sel, Out[4]);
	mux_2to1_1bit MUX6(A[5], B[5], sel, Out[5]);
	mux_2to1_1bit MUX7(A[6], B[6], sel, Out[6]);
	mux_2to1_1bit MUX8(A[7], B[7], sel, Out[7]);
	
	mux_2to1_1bit MUX9(A[8], B[8], sel, Out[8]);
	mux_2to1_1bit MUX10(A[9], B[9], sel, Out[9]);
	mux_2to1_1bit MUX11(A[10], B[10], sel, Out[10]);
	mux_2to1_1bit MUX12(A[11], B[11], sel, Out[11]);
	
	mux_2to1_1bit MUX13(A[12], B[12], sel, Out[12]);
	mux_2to1_1bit MUX14(A[13], B[13], sel, Out[13]);
	mux_2to1_1bit MUX15(A[14], B[14], sel, Out[14]);
	mux_2to1_1bit MUX16(A[15], B[15], sel, Out[15]);
	
endmodule
