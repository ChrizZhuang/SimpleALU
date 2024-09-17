module mux_2to1_1bit(A, B, sel, Out);
	input A, B;
	input sel;
	output Out;
	
	wire w1, w2, w3;
	
	not(w1, sel);
	
	and(w2, A, w1);
	and(w3, B, sel);
	
	or(Out, w2, w3);
	
endmodule
