module Control
(
	Op_i,
    RegDst_o,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

input	[5:0]	Op_i;
output			RegDst_o, RegWrite_o, ALUSrc_o;
output	[1:0]	ALUOp_o;

reg 			RegDst_o, RegWrite_o, ALUSrc_o;
reg		[1:0]	ALUOp_o;

always @(Op_i) begin
	if(Op_i == 6'b000000) begin           // R-type
		assign RegDst_o = 1;
		assign ALUOp_o = 2'b11;
		assign ALUSrc_o = 0;
		assign RegWrite_o = 1;
	end
	else if(Op_i == 6'b001000) begin	  // addi
		assign RegDst_o = 0;
		assign ALUOp_o = 2'b10;
		assign ALUSrc_o = 1;
		assign RegWrite_o = 1;	
	end
end

endmodule
