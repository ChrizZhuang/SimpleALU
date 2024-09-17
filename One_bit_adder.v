module One_bit_adder(data_operandA, data_operandB, Cin);
	
	input data_operandA, data_operandB, Cin;
	output sum, cout;
	wire w1,w2,w3; 
	
	xor(w1, a, b);
	and(w2, a, b);
	and(w3, w1, cin);
	xor(sum, w1, cin);
	or(cout, w2, w3);
	
endmodule
