; pause.g
; called when a print from SD card is paused

M83 ; relative extruder moves
G1 E-10 F3600 ; for k'tana retract 10mm of filament
G91 ; relative positioning
G1 Z50 S1 F360 ; lift Z by 50mm, or until Z-limit is reached
G90 ; absolute positioning
