; Network access override
M550 PQC_Promega							;Set machine name
M552 P192.168.1.240 S1						;Set Static IP address and enable networking

; Start QC
M106 S255									;Nozzle cooling fan check
G92 X200 Y200 Z200							;Fake coordinates to test Z-probe
G30											;Test Z-probe
M208 X375 Y387 Z342 S0						;Set axis maxima
G28											;Home to check limit switches and establish real coordinates
M104 T0 S150								;Begin heating nozzle
M140 S40									;Begin heating bed

; Configure motion testing variables
M201 X3200 Y3200 Z120 E250		    		;Set max acceleration, above recommended
M203 X9200 Y9200 Z2500 E5000				;Set max Speed, above recommended
M566 X500 Y500 Z50 E300						;Set jerk, above recommended
M208 X0 Y0 Z0 S1							;Set axis minima
M564 S1 H1									;Enable limits

; Move through buildspace
G1 X0 Y0 Z5 F9000							;Move to origin, front left, Z up
G1 X0 Y385 Z340 S1 F9000					;Move to back left, Z down
G1 X373 Y0 Z5 F9000							;Move to front right, Z up
G1 X373 Y385 Z340 S1 F9000					;Move to back right, Z down

; Move through buildspace again
;G1 X0 Y0 Z5 F9000							;Move to origin, front left, Z up
;G1 X0 Y385 Z340 S1 F9000					;Move to back left, Z dow
;G1 X373 Y0 Z5 F9000						;Move to front right, Z up
;G1 X373 Y385 Z340 S1 F9000					;Move to back right, Z down

; Center extruder for convenience
G1 Y220.5 X189.5 Z150 F9000


