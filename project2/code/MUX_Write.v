module MUX_Write(
    data1_i,
    data2_i,
    select_i,
    data_o
);

input	[31:0]	data1_i, data2_i;
input			select_i;
output	[31:0]	data_o;

assign	data_o = (select_i == 1'b1)?	data1_i : data2_i;

endmodule