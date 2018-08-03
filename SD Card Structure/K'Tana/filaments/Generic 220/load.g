G90 ; Set to absolute positioning

M98 Pposition_movetoneutral.g ; Move to Neutral

M104 S220 ; Set nozzle to 220
M109 S220 ; Wait for it to heat up

M82 ;absolute extrusion mode

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"The printer will now attempt to load the filament, click OK when you are ready." S2
M291 P"Please feed the filament into the extruder." S0

;Prime the extruder
G92 E0
G1 F200 E5
G92 E0
M83 ;relative extrusion mode
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500

G1 F300 E-5 ; Retract 5mm of filament at 5mm/s (F is mm/minute)
G4 P500

M291 P"If the filament has exited the extruder, click CANCEL to exit. Otherwise, click OK to try again." S3

G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E10 ; Extrude 10mm of filament at 5mm/s (F is mm/minute)
G4 P500

G1 F300 E-5 ; Retract 5mm of filament at 5mm/s (F is mm/minute)
G4 P500


M291 P"If the filament has not yet exited the extruder, please attempt to load the filament again." S2