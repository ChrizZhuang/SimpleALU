module mux_2to1_32bit(A, B, sel, Out);
	input [31:0] A, B;
	input sel;
	output [31:0] Out;
	
	mux_2to1_16bit MUX1(A[15:0], B[15:0], sel, Out[15:0]);
	mux_2to1_16bit MUX2(A[31:16], B[31:16], sel, Out[31:16]);
	
endmodule
	