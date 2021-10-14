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
			IDLE:	
				if(Din_rdy)
					state <= RX_S;
				else	
					state <= IDLE;
			RX_S:
				if(status)
					state <= STATUS;
				else	
					state <= ERROR;
			STATUS:	state <= WAIT1;
			WAIT1:
				if(Din_rdy)
					state <= RX_D1;
				else	
					state <= WAIT1;
			RX_D1:
				if(data)
					state <= D1;
				else	
					state <= ERROR;
			D1:		state <= WAIT2;
			WAIT2:
				if(Din_rdy)
					state <= RX_D2;
				else	
					state <= WAIT2;
			RX_D2:
				if(data)
					state <= D2;
				else	
					state <= ERROR;
			D2:		state <= FIN;
			FIN:	state <= IDLE; 
			ERROR:
				if(Din_rdy)
					state <= RX_S;
				else	
					state <= ERROR;
			default:state <= IDLE;
		endcase 

assign ld_status = (state == STATUS);
assign ld_data1 = (state == D1);
assign ld_data2 = (state == D2);
assign rdy_out = (state == FIN);
assign error = (state == ERROR);

endmodule