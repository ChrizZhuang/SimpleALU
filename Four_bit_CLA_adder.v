module Four_bit_CLA_adder(A, B, Cin, S, Cout, Cin_MSB);

	input [3:0] A, B;
	input Cin;
	output [3:0] S;
	output Cout, Cin_MSB;
	wire [3:0] P, G, C_inter;
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
	
	// Calculate P and G
	and(G[0], A[0], B[0]);
	xor(P[0], A[0], B[0]);
	
	and(G[1], A[1], B[1]);
	xor(P[1], A[1], B[1]);
	
	and(G[2], A[2], B[2]);
	xor(P[2], A[2], B[2]);
	
	and(G[3], A[3], B[3]);
	xor(P[3], A[3], B[3]);
	
	// Calculate C1
	and(w1, Cin, P[0]);
	or(C_inter[0], w1, G[0]);
	
	// Calculate C2
	and(w2, G[0], P[1]);
	and(w3, Cin, P[0], P[1]);
	or(C_inter[1], G[1], w2, w3);
	
	// Calculate C3
	and(w4, G[1], P[2]);
	and(w5, G[0], P[1], P[2]);
	and(w6, Cin, P[0], P[1], P[2]);
	or(C_inter[2], G[2], w4, w5, w6);
	
	// Calculate Cout, i.e., C4
	and(w7, G[2], P[3]);
	and(w8, G[1], P[2], P[3]);
	and(w9, G[0], P[1], P[2], P[3]);
	and(w10, Cin, P[0], P[1], P[2], P[3]);
	or(Cout, G[3], w7, w8, w9, w10);
	
	// Calculate sum
	xor(S[0], Cin, P[0]);
	xor(S[1], C_inter[0], P[1]);
	xor(S[2], C_inter[1], P[2]);
	xor(S[3], C_inter[2], P[3]);
	
	// Get the value of Cin_MSB
	and(Cin_MSB, C_inter[2], 1'b1);
	
endmodule
