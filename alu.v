module alu(data_operandA, data_operandB, ctrl_ALUopcode,
ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	
	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
	
	wire [31:0] not_B, w2;
	
	genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : not_gates
            not(not_B[i], data_operandB[i]);
        end
    endgenerate
	
	
	mux_2to1_32bit MUX1(data_operandB, not_B, ctrl_ALUopcode[0], w2);
	
	Thirty_two_bit_CSA ADDER1(data_operandA, w2, ctrl_ALUopcode[0], data_result, Cout, Ovf);
	
	//assign isNotEqual = (data_operandA == data_operandB)?1:0;
	//assign isLessThan = (data_operandA < data_operandB)?1:0;
	assign overflow = (Ovf == 1'b1)?1'b1:1'b0;
	
endmodule
