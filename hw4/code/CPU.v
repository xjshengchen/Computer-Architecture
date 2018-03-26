module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire    [31:0] inst_addr, inst;

Adder Add_PC(
    .data1_in   (inst_addr),
    .data2_in   (32'd4),
    .data_o     (PC.pc_i)
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (),                // from Add_PC.data_o
    .pc_o       (inst_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (inst_addr), 
    .instr_o    (inst)
);


MUX5 MUX5(
    .data1_i    (inst[20:16]),
    .data2_i    (inst[15:11]),
    .select_i   (),                // from Control.RegDst_o
    .data_o     (Registers.RDaddr_i)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (inst[25:21]),
    .RTaddr_i   (inst[20:16]),
    .RDaddr_i   (),                // from MUX5.data_o 
    .RDdata_i   (),                // from ALU.data_o
    .RegWrite_i (),                // from Control.RegWrite_o
    .RSdata_o   (ALU.data1_i), 
    .RTdata_o   (MUX32.data1_i) 
);

Control Control(
    .Op_i       (inst[31:26]),
    .RegDst_o   (MUX5.select_i),
    .ALUOp_o    (ALU_Control.ALUOp_i),
    .ALUSrc_o   (MUX32.select_i),
    .RegWrite_o (Registers.RegWrite_i)
);

Sign_Extend Sign_Extend(
    .data_i     (inst[15:0]),
    .data_o     (MUX32.data2_i)
);

MUX32 MUX32(
    .data1_i    (),                // from Registers.RTdata_o
    .data2_i    (),                // from Sign_Extend.data_o
    .select_i   (),                // from Control.ALUSrc_o
    .data_o     (ALU.data2_i)
);

ALU ALU(
    .data1_i    (),                // from Registers.RTdata_o
    .data2_i    (),                // from MUX32.data_o
    .ALUCtrl_i  (),                // from ALU_Control.ALUCtrl_o
    .data_o     (Registers.RDdata_i),
    .Zero_o     ()
);


ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (),                // from Control.ALUOp_o
    .ALUCtrl_o  (ALU.ALUCtrl_i)
);

endmodule

