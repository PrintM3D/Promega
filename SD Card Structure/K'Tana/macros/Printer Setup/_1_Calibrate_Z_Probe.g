;_____________Calibrate Z Probe_____________
M291 P"Do you want to Calibrate the Z Probe?" S3
M291 P"Calibrating Z Probe, this will home the printer, heat the bed and nozzle and then give you further instructions." S0

M140 S60 ; Start heating bed to 60c
G10 P0 S150 ;turn on extruder
G10 P1 S150 ;turn on extruder
G10 P2 S150 ;turn on extruder

G28 ; Home all
G28 Z ; Home z
G28 Z ; Home z again

M190 S60 ; wait for heat bed to get to 60c

G1 Z200 ; move the bed to 200mm from the nozzle

G29 S2 ; Disable bed mesh
G29 S2 ; Disable bed mesh

G1 X200 Y200 Z20 F1500 ; center extruder and raise bed.

M564 S0 ; Disable movement boundaries.

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"Slowly move the bed up until nozzle is touching. Press OK when done." S2 Z1

G92 Z0 ; set the current Z position as 0
G1 Z20 ; lower bed by 20mm

M291 P"Deploy the Z Probe if needed. Press OK when done." S2
G30 S-1 ; this will measure the Z Probe Z offset from 0

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 P"Retract the Z Probe if needed. Press OK to continue." S2
M291 P"Record the Z axis value displayed in the Machine Status and set the G31 Z value in machine_zprobe.g to the value recorded." S2
M291 P"After the file has been saved run the _2_Set_Z_Endstop_Height.g macro" S2
M291 P"These messages are also displayed on the g-code console screen." S2

; Display commands on the console screen

M118 S"After the file has been saved run the _2_Set_Z_Endstop_Height.g macro" P0
M118 S"Record the Z axis value displayed in the Machine Status and set the G31 Z value in machine_zprobe.g to the value recorded." P0
