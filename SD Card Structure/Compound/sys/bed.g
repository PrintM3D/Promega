; bed.g
; called to perform automatic bed compensation via G32

; Heat bed and nozzle, allow bed to reach temperature before continuing
M140 S60 ; set the bed to 60C, change depending on your desired bed temp
M190 S60 ; wait for the bed to reach 60C, change depending on your desired bed temp
M104 T0 S150 ; set the nozzle to 150C
M104 T1 S150 ; set the nozzle to 150C
M104 T2 S150 ; set the nozzle to 150C
M109 T0 S150 ; wait for the nozzle to read 150C
M109 T1 S150 ; wait for the nozzle to read 150C
M109 T2 S150 ; wait for the nozzle to read 150C

; Clear any bed transform
M561
G29 S2

; Mesh Bed Leveling -> Mesh defined in config.g
G29 S0 ; Run the bed leveling, and enable compensation

; G30 bed compensation - Alternative to Mesh Bed Leveling
; For more information, visit https://reprap.org/wiki/G-code#G30:_Single_Z-Probe
; Supported up to 5 points

; X - Pattern
;G30	P0	X	41	Y	30	Z	-99999	H	-0.21
;G30	P1	X	41	Y	378	Z	-99999	H	-0.4	
;G30	P2	X	371	Y	378	Z	-99999	H	-0.5	
;G30	P3	X	371	Y	30	Z	-99999	H	-0.75
;G30	P4	X	191	Y	198	Z	-99999	H	0	S5

; + Pattern
;G30		P0	X	129	Y	130	Z	-99999	H	0
;G30		P1	X	126	Y	267	Z	-99999	H	0
;G30		P2	X	271	Y	270	Z	-99999	H	0
;G30		P3	X	273	Y	132	Z	-99999	H	0
;G30		P4	X	200	Y	200	Z	-99999	H	0	S5