; machine_ktana_tools
; July 9, 2018

; Comment: Remember that H0 is heated bed
; Comment: D0 is the first left extruder driver after movement drives, which is extruder port E0
; Comment: Dual nozzle setup is done by creating seperate tools for each extruder, then switching between tools in slicer
; Comment: Left nozzle has a -12.0 mm offset, considering right nozzle as origin

; K'tana Tools
; Left Nozzle T0
M563 P0 D0 H1 F2 S"Ktana Single Left" ; Define tool 0, left side tool (single extruder)
G10 P0 X0.0 Y0 Z0 				; Tool 0, set axis offsets
G10 P0 S0 R0 						; Tool 0, set active (S0) and standy temp (R) of 0

; Right Nozzle T1
M563 P1 D1 H2 F2 S"Ktana Single Right" ; Define tool 0, right side tool (single extruder)
G10 P1 X12 Y0 Z0 					; Tool 0, set axis offsets
G10 P1 S0 R0 						; Tool 0, set active (S0) & standy temp (R) of 0.

