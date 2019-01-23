; Network access override
M550 PQC_Promega					;Set machine name
M552 P192.168.1.240 S1				;Set Static IP address and enable networking

; Start QC
M106 S255							;Nozzle cooling fan check
G92 X200 Y200 Z200					;Fake coordinates to test Z-probe
G30									;Test Z-probe
G28									;Home to check limit switches and establish real coordinates
M104 T0 S230						;Begin heating nozzle
M104 T1 S230						;Begin heating second nozzle, for K'Tana
M140 S40							;Begin heating bed

; Configure motion testing variables
M201 X3200 Y3200 Z120 E250:250		;Set max acceleration, above recommended
M203 X9200 Y9200 Z2500 E5000:5000	;Set max Speed, above recommended
M566 X500 Y500 Z50 E300:300			;Set jerk, above recommended
M208 X0 Y0 Z20 S1					;Set axis minima
M208 X370 Y342 Z377 S0				;Set axis maxima
M564 S1 H1							;Enable limits

; Move through buildspace
G1 X0 Y0 Z25 F9000					;Move to origin, front left, Z up
G1 X0 Y342 Z375 S1 F9000			;Move to back left, Z down
G1 X370 Y0 Z25 F9000				;Move to front right, Z up
G1 X370 Y342 Z375 S1 F9000			;Move to back right, Z down

; Move through buildspace again
G1 X0 Y0 Z25 F9000					;Move to origin, front left, Z up
G1 X0 Y342 Z375 S1 F9000			;Move to back left, Z down
G1 X370 Y0 Z25 F9000				;Move to front right, Z up
G1 X370 Y342 Z375 S1 F9000			;Move to back right, Z down

; Center extruder for convenience
G1 Y220.5 X189.5 Z150 F9000

;Extrusion
T0									;Select appropriate tool
M109 T0 S230						;Finish heating nozzle
M83									;Set relative extrusion mode
G1 T0 E150 F240						;Test extrusion
M104 T0 S0							;Turn off heater
G1 T0 E-120 F600					;Retract filament

;Secondary extrusion, for K'Tana
T1									;Select appropriate tool
M109 T1 S230						;Finish heating nozzle
M83									;Set relative extrusion mode
G1 T1 E150 F240						;Test extrusion
M104 T1 S0							;Turn off heater
G1 T1 E-120 F600					;Retract filament
