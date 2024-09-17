module Four_bit_CLA_logic(P, G, Cin, Cout);

	input [3:0] P, G;
	input Cin;
	output[3:0] Cout; // C1 to C4, no Cin
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
	
	// Calculate C1
	and(w1, Cin, P[0]);
	or(Cout[0], w1, G[0]);
	
	// Calculate C2
	and(w2, G[0], P[1]);
	and(w3, Cin, P[0], P[1]);
	or(Cout[1], G[1], w2, w3);
	
	// Calculate C3
	and(w4, G[1], P[2]);
	and(w5, G[0], P[1], P[2]);
	and(w6, Cin, P[0], P[1], P[2]);
	or(Cout[2], G[2], w4, w5, w6);
	
	// Calculate C4
	and(w7, G[2], P[3]);
	and(w8, G[1], P[2], P[3]);
	and(w9, G[0], P[1], P[2], P[3]);
	and(w10, Cin, P[0], P[1], P[2], P[3]);
	or(Cout[3], G[3], w7, w8, w9, w10);
	
endmodule
