`timescale 1ns/1ps

import constantsMIDI::*;

module MIDI_Receiver_TB();
	parameter PER = 10; //Periodo Reloj
	parameter RET = 1; //Retardo


	// Control
	logic clk = 1'b0;
	logic rst_n = 1'b1;
	
	// Entradas
	logic [7:0] Din = 8'b0;
	logic Din_rdy = 1'b0;

	// Salidas
	logic note_on;
	logic note_off;
	logic [3:0] ch;
	logic [6:0] D1;
	logic [6:0] D2;
	logic rdy_out;
	logic error;

	always #(PER/2) clk = !clk;

	MIDI_Receiver UUT(
		.rst_n,
		.clk,
		.Din,
		.Din_rdy,
		.note_on,
		.note_off,
		.ch,
		.D1,
		.D2,
		.rdy_out,
		.error
	);

	initial begin
		delay_clks(3);
		mk_rst();
		delay_clks(3);

		wr_frame(3, NOTE_ON, 26, 34);
		wr_frame_error1(3, NOTE_ON, 26, 34);

		wr_frame(8, NOTE_OFF, 100, 115);
		wr_frame_error2(8, NOTE_OFF, 100, 115);
		
		wr_frame(12, NOTE_ON, 12, 0);
		wr_frame_error3(12, NOTE_ON, 12, 0);
		
		$stop;
	end


	task wr_frame_error1(logic [3:0] channel, logic [2:0] inst, logic [6:0] d1, logic [6:0] d2) ;
		// Write status
		tx_byte({1'b0, inst, channel});
		
		// Data 1
		tx_byte({1'b0, d1});
		// Data 2
		tx_byte({1'b0, d2});

		delay_clks(100);
	endtask

	task wr_frame_error2(logic [3:0] channel, logic [2:0] inst, logic [6:0] d1, logic [6:0] d2) ;
		// Write status
		tx_byte({1'b1, inst, channel});
		
		// Data 1
		tx_byte({1'b1, d1});
		// Data 2
		tx_byte({1'b0, d2});

		delay_clks(100);
	endtask

	task wr_frame_error3(logic [3:0] channel, logic [2:0] inst, logic [6:0] d1, logic [6:0] d2) ;
		// Write status
		tx_byte({1'b1, inst, channel});
		
		// Data 1
		tx_byte({1'b0, d1});
		// Data 2
		tx_byte({1'b1, d2});

		delay_clks(100);
	endtask


	// task comprobar_salida(logic [3:0] channel, logic [2:0] inst, logic [6:0] d1, logic [6:0] d2);
	// 	@(posedge rdy_out)



	// endtask

	task wr_frame(logic [3:0] channel, logic [2:0] inst, logic [6:0] d1, logic [6:0] d2);
		// Write status
		tx_byte({1'b1, inst, channel});

		// Data 1
		tx_byte({1'b0, d1});
		// Data 2
		tx_byte({1'b0, d2});

		delay_clks(100);
	endtask

	task tx_byte(logic [7:0] data);
		//delay
		#(PER*$urandom_range(30,20));

		// Write instruction
		@(posedge clk);
		#RET Din_rdy = 1'b1;
		#RET Din = data;
		@(posedge clk);
		#RET Din_rdy = 1'b0;
		
		
	endtask


	task mk_rst();
		@(posedge clk);
		#RET rst_n = 1'b0;
		@(posedge clk);
		#RET rst_n = 1'b1;
	endtask

	task delay_clks(integer n_delays);
		#(PER*n_delays);
	endtask

endmodule