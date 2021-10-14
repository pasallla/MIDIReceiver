onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Señales control}
add wave -noupdate /MIDI_Receiver_TB/clk
add wave -noupdate /MIDI_Receiver_TB/rst_n
add wave -noupdate -divider Estimulos
add wave -noupdate -radix hexadecimal /MIDI_Receiver_TB/Din
add wave -noupdate /MIDI_Receiver_TB/Din_rdy
add wave -noupdate -divider Salidas
add wave -noupdate /MIDI_Receiver_TB/note_on
add wave -noupdate /MIDI_Receiver_TB/note_off
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/ch
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/D1
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/D2
add wave -noupdate /MIDI_Receiver_TB/rdy_out
add wave -noupdate /MIDI_Receiver_TB/error
add wave -noupdate -divider Control
add wave -noupdate /MIDI_Receiver_TB/UUT/control/Din_rdy
add wave -noupdate /MIDI_Receiver_TB/UUT/control/status
add wave -noupdate /MIDI_Receiver_TB/UUT/control/data
add wave -noupdate /MIDI_Receiver_TB/UUT/control/ld_status
add wave -noupdate /MIDI_Receiver_TB/UUT/control/ld_data1
add wave -noupdate /MIDI_Receiver_TB/UUT/control/ld_data2
add wave -noupdate /MIDI_Receiver_TB/UUT/control/rdy_out
add wave -noupdate /MIDI_Receiver_TB/UUT/control/error
add wave -noupdate /MIDI_Receiver_TB/UUT/control/state
add wave -noupdate -divider DataPath
add wave -noupdate -radix hexadecimal /MIDI_Receiver_TB/UUT/dataPath/Din
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/Din_rdy
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/ld_status
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/ld_data1
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/ld_data2
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/note_on
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/note_off
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/UUT/dataPath/ch
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/UUT/dataPath/D1
add wave -noupdate -radix unsigned /MIDI_Receiver_TB/UUT/dataPath/D2
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/status
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/data
add wave -noupdate /MIDI_Receiver_TB/UUT/dataPath/inst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8095000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 270
configure wave -valuecolwidth 57
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {11451300 ps}
