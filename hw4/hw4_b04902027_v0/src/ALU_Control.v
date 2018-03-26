module ALU_Control
(
	funct_i,
	ALUOp_i,
	ALUCtrl_o
);

input	[1:0]	ALUOp_i;
input	[5:0]	funct_i;
output	[2:0]	ALUCtrl_o;

reg		[2:0]	ALUCtrl_o;

always @(ALUOp_i or funct_i) begin
	if(ALUOp_i == 2'b10) begin           //addi
		assign ALUCtrl_o = 3'b010;       // OR
	end
	else begin                           //R-type
		if(funct_i == 6'b100000) begin
			assign ALUCtrl_o = 3'b010;   // ADD
		end
		else if(funct_i == 6'b100010) begin
			assign ALUCtrl_o = 3'b110;   // SUB
		end
		else if(funct_i == 6'b100100) begin
			assign ALUCtrl_o = 3'b000;   // AND
		end
		else if(funct_i == 6'b10100) begin
			assign ALUCtrl_o = 3'b001;   // OR  
		end
		else if(funct_i == 6'b011000) begin
			assign ALUCtrl_o = 3'b011;   // MUL
		end
	end	
end

endmodule
