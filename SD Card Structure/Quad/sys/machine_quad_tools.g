; machine_quad_tools
; April 15, 2019

; Quad Nozzle Tools

; Mixing Tool T0
M563 P0 D0:1:2:3 H1 F1 S"Quad" ; Define mixing tool
G10 P0 X0 Y0 Z0 ; Set axis offsets
G10 P0 R0 S0 ; Set active (S0) & standby temp (R0) at 0.
M567 P0 E0.25:0.25:0.25:0.25 ; Set tool mix ratios for extruder

