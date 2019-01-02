; Shutdown Sequence (For When Prints are done and power down is desired)

;turn off heated bed
M140 S60 ; turn off bed

;turn off extruder
G10 P0 S0 ; Heater 1
G10 P1 S0 ; Heater 2
G10 P2 S0 ; Heater 3