# Entity: MIDI_Receiver_TB

- **File**: MIDI_Receiver_TB.sv
## Diagram

![Diagram](MIDI_Receiver_TB.svg "Diagram")
## Generics

| Generic name | Type | Value | Description |
| ------------ | ---- | ----- | ----------- |
| PER          |      | 10    |             |
| RET          |      | 1     |             |
## Signals

| Name     | Type        | Description |
| -------- | ----------- | ----------- |
| clk      | logic       |             |
| rst_n    | logic       |             |
| Din      | logic [7:0] |             |
| Din_rdy  | logic       |             |
| note_on  | logic       |             |
| note_off | logic       |             |
| ch       | logic [3:0] |             |
| D1       | logic [6:0] |             |
| D2       | logic [6:0] |             |
| rdy_out  | logic       |             |
| error    | logic       |             |
## Processes
- unnamed: (  )
  - **Type:** always
## Instantiations

- UUT: MIDI_Receiver
