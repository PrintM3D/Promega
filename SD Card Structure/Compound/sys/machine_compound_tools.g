; machine_compound_tools
; July 9, 2018

; Compound Nozzle Tools

; Mixing Tool T0
M563 P0 D0:1 H2 F2 S"Mixing" ; Define mixing tool
G10 P0 X0 Y0 Z0 ; Set axis offsets
G10 P0 R0 S0 ; Set active (S0) & standby temp (R0) at 0.
M567 P0 E0.5:0.5 ; Set tool mix ratios for extruder
M568 P0 S1 ; Turn on tool mixing for the extruder

; Left Only T1
M563 P1 D0 H2 F2 S"Mixing as Single Left" ; mixing nozzle only using left extruder motor
M568 P1 S0 ; Turn off tool mixing
G10 P1 X0 Y0 Z0 ; Set axis offsets
G10 P1 R0 S0 ; Set active (S0) & standby temp (R0) at 0.

; Right Only T2
M563 P2 D1 H2 F2 S"Mixing as Single Right" ; mixing nozzle only using right extruder motor
M568 P2 S0 ; Turn off tool mixing
G10 P2 X0 Y0 Z0 ; Set axis offsets
G10 P2 R0 S0 ; Set active (S0) & standby temp (R0) at 0.
