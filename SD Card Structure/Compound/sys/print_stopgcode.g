M117 Print Complete
M140 S0 ; turn off bed
G92 E1 ;Set Steps for Retraction
G1 E-1.5 F300 ;perform retraction

;turn off extruder
G10 P0 S0 ; Heater 1
G10 P1 S0 ; Heater 2
G10 P2 S0 ; Heater 3

M98 Pposition_movetoneutral.g

M84 ; disable motors
M106 S0 ; turn off cooling fan
