;_____________Calibrate Z Probe_____________
M291 P"Do you want to calibrate your Z probe?" S3
M291 R"PREPARING CALIBRATION" P"Now homing and heating up (nozzle & bed). Wait for further instructions." S0

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

M291 R"SLOWLY MOVE THE BED UP" P"Touch the nozzle with the bed. Press OK when done." S2 Z1

G92 Z0 ; set the current Z position as 0
G1 Z20 ; lower bed by 20mm

M291 P"Deploy the Z Probe. Press OK when done." S2
G30 S-1 ; this will measure the Z Probe Z offset from 0

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 R"(IF NEEDED)" P"Retract the Z Probe. Press OK to continue." S2

M291 R"AFTER THE PROMPT" P"Record Z value displayed in Machine Status Table." S2
G4 S4; dwell for 4 seconds
M291 R"AFTER THE PROMPT" P"Set the G31 Z value (in sys file: machine_zprobe.g) to the recorded value. " S2
M291 R"AFTER THE PROMPT" P"Run the _2_Set_Z_Endstop_Height.g macro" S2
M291 R"IMPORTANT" P"These messages are also displayed on the g-code console screen." S2

; Display commands on the console screen

M118 S" ... END OF MESSAGE... " P0
G4 P500
M118 S"3) After the file has been saved, run the _2_Set_Z_Endstop_Height.g macro." P0
G4 P500
M118 S"2) Set the G31 Z value in machine_zprobe.g to the value recorded. " P0
G4 P500
M118 S"1) Record the Z value displayed in the Machine Status Table. " P0
G4 P500
M118 S" ... START OF MESSAGE ..." P0