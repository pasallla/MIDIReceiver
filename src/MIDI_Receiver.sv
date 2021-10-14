module MIDI_Receiver(
	input clk,
	input rst_n,
	input [7:0] Din,
	input Din_rdy,
	output logic note_on,
	output logic note_off,
	output logic [3:0] ch,
	output logic [6:0] D1,
	output logic [6:0] D2,
	output logic rdy_out,
	output logic error
);

logic status, data, ld_status, ld_data1, ld_data2;

MIDI_Control control(
	.clk,
	.rst_n,
	.Din_rdy,
	.status,
	.data,
	.ld_status,
	.ld_data1,
	.ld_data2,
	.rdy_out,
	.error
);

MIDI_DataPath dataPath(
	.clk,
	.rst_n,
	.Din,
	.Din_rdy,
	.ld_status,
	.ld_data1,
	.ld_data2,
	.note_on,
	.note_off,
	.ch,
	.D1,
	.D2,
	.status,
	.data
);

endmodule