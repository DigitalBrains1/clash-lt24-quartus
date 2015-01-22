onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lt24/CLOCK_50
add wave -noupdate /lt24/RESETn
add wave -noupdate -radix unsigned /lt24/action
add wave -noupdate /lt24/din
add wave -noupdate /lt24/ready
add wave -noupdate /lt24/dout
add wave -noupdate /lt24/LT24_CS_N
add wave -noupdate /lt24/LT24_RESET_N
add wave -noupdate /lt24/LT24_RS
add wave -noupdate /lt24/LT24_WR_N
add wave -noupdate /lt24/LT24_RD_N
add wave -noupdate -expand /lt24/LT24_D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {480 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {522 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 20ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/lt24/CLOCK_50 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/lt24/RESETn 
wave edit insert_pulse -duration 40ns -time 0ns Edit:/lt24/RESETn 
wave create -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 1000ns sim:/lt24/action 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0001001000110100 -range 15 0 -starttime 0ns -endtime 1000ns sim:/lt24/din 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 100 -range 2 0 -starttime 0ns -endtime 1000ns Edit:/lt24/action 
wave create -driver freeze -pattern constant -value ZZZZZZZZZZZZZZZZ -range 15 0 -starttime 0ns -endtime 1000ns sim:/lt24/LT24_D 
wave create -driver freeze -pattern constant -value 0000000000000000 -range 15 0 -starttime 0ns -endtime 1000ns sim:/lt24/LT24_D 
wave create -driver freeze -pattern constant -value ZZZZZZZZZZZZZZZZ -range 15 0 -starttime 0ns -endtime 1000ns sim:/lt24/LT24_D 
WaveExpandAll -1
wave edit change_value -start 480ns -end 561ns -value 1001101010111100 Edit:/lt24/LT24_D 
wave edit change_value -start 480ns -end 561ns -value ZZZZZZZZZZZZZZZZ Edit:/lt24/LT24_D 
wave edit change_value -start 380ns -end 500ns -value 0100010101100111 Edit:/lt24/LT24_D 
WaveCollapseAll -1
wave clipboard restore
