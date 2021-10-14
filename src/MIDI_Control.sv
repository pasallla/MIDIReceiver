module MIDI_Control(
	input clk,
	input rst_n,
	input Din_rdy,
	input status,
	input data,
	output logic ld_status,
	output logic ld_data1,
	output logic ld_data2,
	output logic rdy_out,
	output logic error
);

enum logic [3:0] {IDLE, RX_S, STATUS, WAIT1, RX_D1, D1, WAIT2, RX_D2, D2, FIN, ERROR} state;

always_ff @ (posedge clk)
	if(!rst_n)
		state <= IDLE;
	else
		case (state)
			IDLE:	state <= Din_rdy ? RX_S : IDLE;
			RX_S:	state <= status ? STATUS : ERROR;
			STATUS:	state <= WAIT1;
			WAIT1:	state <= Din_rdy ? RX_D1 : WAIT1;
			RX_D1:	state <= data ? D1 : ERROR;
			D1:		state <= WAIT2;
			WAIT2:	state <= Din_rdy ? RX_D2 : WAIT2;
			RX_D2:	state <= data ? D2 : ERROR;
			D2:		state <= FIN;
			FIN:	state <= IDLE; 
			ERROR:	state <= Din_rdy ? RX_S : ERROR;
			default:state <= IDLE;
		endcase 

assign ld_status = (state == STATUS);
assign ld_data1 = (state == D1);
assign ld_data2 = (state == D2);
assign rdy_out = (state == FIN);
assign error = (state == ERROR);

endmodule