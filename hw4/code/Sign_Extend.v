module Sign_Extend
(
	data_i,
	data_o
);

input	[15:0]	data_i;
output	[31:0]	data_o;

reg		[31:0]  data_o;

always @(data_i) begin
	case(data_i[15])
		1: data_o = data_i | 32'hFFFF0000;
	 	0: data_o = data_i | 32'h00000000;
	endcase
end

endmodule