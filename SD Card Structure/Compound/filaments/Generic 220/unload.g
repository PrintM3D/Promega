G90 ; Set to absolute positioning

M98 Pposition_movetoneutral.g ; Move to Neutral

M104 S220 ; Set nozzle to 240
M109 S220 ; Wait for it to heat up

M82 ;absolute extrusion mode

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"The printer will now attempt to unload the filament, click OK when you are ready." S2
M291 P"Please pull gently on the filament as it unloads." S0

;Prime the extruder
G92 E0
G1 F200 E5
G92 E0
M83 ;relative extrusion mode
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500

M291 P"If the filament has released from the extruder, click CANCEL to exit. Otherwise, click OK to try again." S3

G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500
G1 F300 E-10 ; Retract 10mm of filament at 5mm/s (F is mm/minute)
G4 P500

M291 P"If the filament has not yet released from the extruder, please attempt to unload the filament again." S2