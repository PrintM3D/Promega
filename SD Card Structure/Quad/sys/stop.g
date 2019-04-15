; stop.g
; April 15, 2019

; NOTE: called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

M83 						; relative extruder moves
G1 E-2						; Relieve pressure.
G91				 			; relative positioning
G1 Z5 S1 F360 				; lower Z by 5mm, or until Z-limit is reached
G90 						; absolute positioning
G1 X350 Y350 F3000 			; go to X=350 Y=350 to move head out of the way (usually)
M98 Phomez.g 				; move Z to the bottom

; Turn off systems
G10 P0 S0 R0
M106 S0 					; turn off fans
M140 S0 					; turn off bed
M84 						; switch off all steppers
