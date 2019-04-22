;_____________Mesh Bed_____________
M291 P"Do you want to Mesh Your Bed?" S3
M291 R"PREPARING BED COMPENSATION (MESHING)" P"Now homing and heating up (nozzle & bed). Wait for further instructions." S0

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

;Beep 3 times
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401
M300 S600 P250
G4 P401

M291 R"(CHECKPOINT)" P"Deploy the Z Probe. Press OK when done." S2
M291 R"NOTICE" P"Bed Mesh Starting." S2
G32 ; Executes the bed mesh procedure defined in bed.g

;Finish song
M300 S1500 P200
G4 P250
M300 S1000 P200
G4 P250
M300 S500 P200
G4 P250
M300 S1500 P200
G4 P250
M300 S1000 P200
G4 P250
M300 S500 P200
G4 P250
M300 S1500 P200
G4 P250
M300 S1000 P200
G4 P250
M300 S3500 P200
G4 P250
M300 S3500 P200
G4 P250
M300 S3500 P200
G4 P250
M300 S3500 P200
G4 P250

G1 X200 Y200 Z100 F1500 ; Move the bed to Z 100mm from the nozzle so that there is room to retract the z probe if desired.
M291 R"IMPORTANT: PLEASE READ" P"Retract the Z Probe, if you're not going to re-run this macro. Press OK when done." S2

M291 R"NOTICE" P"Do you want to turn off your heaters (Bed & Nozzle)?" S3

M140 S0 	; turn off heated bed
G10 P0 S0 ;turn on extruder
G10 P1 S0 ;turn on extruder
G10 P2 S0 ;turn on extruder