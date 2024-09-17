# SimpleALU
### Name: Xudong Zhuang
### NetID: xz397
### Description of the design:
32-bit Adder:
* 4-bit Carry-Look-Ahead (CLA) Adder
* 16-bit Adder based on 4 4-bit CLA Adders connected in a ripple carry way
* 32-bit Adder based on 3 16-bit Adder connected in a Carry-Select-Adder (CSA) way

ALU:
* Invert the 32 bits operandB as not_B
* Set operandB and not_B as inputs to a 32-bits 2-to-1 MUX, select by opcode and the output is w2
* Set w2 and operandA as inputs to the as-designed 32-bit Adder

