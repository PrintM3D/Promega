; machine_compound_tools
; September 26, 2018
; Quad Nozzle Tools

; Mixing Tool T0
M563 P0 D0:1:2:3 H1 F1 S"Quad" ; Define mixing tool
G10 P0 X0 Y0 Z0 ; Set axis offsets
G10 P0 R0 S0 ; Set active (S0) & standby temp (R0) at 0.
M567 P0 E0.25:0.25:0.25:0.25 ; Set tool mix ratios for extruder
;M568 P0 S1 ; Turn on tool mixing for the extruder

;Motor Directions
M569 P3 S0 V0 ; E0 / Driver 3 goes forwards, Port 3
M569 P4 S0 V0 ; E1 / Driver 4 goes forwards, Port 2
M569 P5 S0 V0 ; E2 / Driver 5 goes forwards, Port 1
M569 P6 S0 V0 ; E3 / Driver 6 goes forwards, Port 0

; Motor Settings
M350 E16; Microstepping
M92 E2140; New Motor, New Steps
M906 E480; New Motor, New Current

; Motion Settings
M566 E60; Max Jerk
M201 E150; Max Acceleration
M203 E5000; Max Feedrates

;Tool Selection
T0
