module Instruction_Memory(
    addr_i, 
    instr_o
);

// Interface
input   [31:0]      addr_i;
output  [31:0]      instr_o;

// Instruction memory
reg     [31:0]     memory  [0:511]; // Declaration of 511 32-bit registers

assign  instr_o = memory[addr_i>>2];  
endmodule
