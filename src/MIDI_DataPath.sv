import constantsMIDI::*;

module MIDI_DataPath(
	input clk,
	input rst_n,
	input [7:0] Din,
	input Din_rdy,
	input ld_status,
	input ld_data1,
	input ld_data2,
	output logic note_on,
	output logic note_off,
	output logic [3:0] ch,
	output logic [6:0] D1,
	output logic [6:0] D2,
	output logic status,
	output logic data
);

logic [2:0] inst;

always_ff @ (posedge clk)
	if(!rst_n)
		{status, data} <= 2'b00;
	else
		if(Din_rdy)
			{status, data} <= Din[7] ? 2'b10 : 2'b01;

always_ff @ (posedge clk)
	if(!rst_n)
		{inst, ch} <= 0;
	else
		if(ld_status)
			{inst, ch} <= Din[6:0];

always_ff @ (posedge clk)
	if(!rst_n)
		D1 <= 0;
	else
		if(ld_data1)
			D1 <= Din[6:0];

always_ff @ (posedge clk)
	if(!rst_n)
		D2 <= 0;
	else
		if(ld_data2)
			D2 <= Din[6:0];


assign note_on = (inst == NOTE_ON) && (D2 > 0);
assign note_off = (inst == NOTE_OFF) || (D2 == 0);

endmodule