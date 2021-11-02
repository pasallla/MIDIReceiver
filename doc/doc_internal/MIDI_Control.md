# Entity: MIDI_Control

- **File**: MIDI_Control.sv
## Diagram

![Diagram](MIDI_Control.svg "Diagram")
## Ports

| Port name | Direction | Type | Description |
| --------- | --------- | ---- | ----------- |
| clk       | input     |      |             |
| rst_n     | input     |      |             |
| Din_rdy   | input     |      |             |
| status    | input     |      |             |
| data      | input     |      |             |
| ld_status | output    |      |             |
| ld_data1  | output    |      |             |
| ld_data2  | output    |      |             |
| rdy_out   | output    |      |             |
| error     | output    |      |             |
## Signals

| Name  | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Description |
| ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| state | enum logic [3:0] {<br><span style="padding-left:20px">IDLE,<br><span style="padding-left:20px"> RX_S,<br><span style="padding-left:20px"> STATUS,<br><span style="padding-left:20px"> WAIT1,<br><span style="padding-left:20px"> RX_D1,<br><span style="padding-left:20px"> D1,<br><span style="padding-left:20px"> WAIT2,<br><span style="padding-left:20px"> RX_D2,<br><span style="padding-left:20px"> D2,<br><span style="padding-left:20px"> FIN,<br><span style="padding-left:20px"> ERROR} |             |
## Processes
- unnamed: ( @ (posedge clk) )
  - **Type:** always_ff
## State machines

![Diagram_state_machine_0]( stm_MIDI_Control_00.svg "Diagram")