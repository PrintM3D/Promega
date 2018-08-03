; pause.g
; called when a print from SD card is paused

M83 ; relative extruder moves
G1 E-20 F3600 ; for compound retract 10mm of filament out of each side
G91 ; relative positioning
G1 Z50 S1 F360 ; lift Z by 5mm, or until Z-limit is reached
G90 ; absolute positioning