; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

M83 ; relative extruder moves
G1 E-20 F3600 ; for compound retract 10mm of filament
G91 ; relative positioning
G1 Z5 S1 F360 ; lift Z by 5mm, or until Z-limit is reached
G90 ; absolute positioning
G1 X300 Y300 F3000 ; go to X=300 Y=300 to move head out of the way (usually)
