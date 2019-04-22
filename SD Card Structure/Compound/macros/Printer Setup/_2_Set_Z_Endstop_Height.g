;_____________Set Z Endstop Height_____________
M291 P"Do you want to set the Z endstop height?" S3
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

;Beep 3 times
M300 S600 P250
G4 P401
M300 S300 P250
G4 P401
M300 S600 P250
G4 P401

M291 R"AFTER THE PROMPT" P"Record the Z value displayed in the Machine Status Table..." S2
G4 S2; dwell for 2 seconds.
M291 R"WHAT IS NEXT?" P"If the value is 0, click CANCEL. Run the _3_Mesh_Bed.g macro. Otherwise, click OK." S3
M291 R"IMPORTANT: PLEASE READ" P"The following messages(steps) are saved on the g-code console screen. All steps are to be done AFTER THE PROMPTS." S2
M291 R"WHAT IS NEXT?" P"Quick Tutorial: How to Change Your Z Endstop Height" S2
M291 R"TUTORIAL" P"Go to file machine_zendstop.g. Change the G92 Z value." S2
M291 R"TUTORIAL" P"If the recorded Z value is - (negative), ADD it from the current Z value." S2
M291 R"TUTORIAL" P"If the recorded Z value is + (positive), SUBTRACT it from the current Z value." S2
M291 R"TUTORIAL" P"Save and Exit. Go to file machine_axisdimension.g. Look for the Z value labeled AXIS MAXIMA." S2
M291 R"TUTORIAL" P"Replace the maximum Z with the new G92 Z value ROUNDED UP." S2
M291 R"TUTORIAL" P"Save and Exit. Run the _2_Set_Z_Endstop_Height.g macro AGAIN until no correction is needed" S2
M291 R"IMPORTANT: REMINDER" P"These messages (in more detail) are also displayed on the g-code console screen." S2

; Display commands on the console screen

M118 S"... END OF Z ENDSTOP SETUP TUTORIAL(MESSAGE)... " P0
G4 P500
M118 S"7) Save and Exit. Run the _2_Set_Z_Endstop_Height.g macro AGAIN until no correction is needed. " P0
G4 P500
M118 S"6) Click EDIT machine_axisdimension.g. Replace the maximum Z with the new G92 Z value ROUNDED UP. " P0
G4 P500
M118 S"5) Save and Exit. Go to machine_axisdimension.g (located in the System Editor tab, under SETTINGS tab). Look for the Z value labeled AXIS MAXIMA. " P0
G4 P500
M118 S"4b) If the recorded Z value is + (positive), SUBTRACT it from the current Z value. " P0
G4 P500
M118 S"4a) If the recorded Z value is - (negative), ADD it to the current Z value. " P0
G4 P500
M118 S"3) Otherwise, Go to file machine_zendstop.g (located in System Editor tab, under SETTINGS tab). Look for the G92 Z value. " P0
G4 P500
M118 S"2) If the value is 0, then skip to running the _3_Mesh_Bed.g macro. " P0
G4 P500
M118 S"1) Record the Z axis value displayed in the Machine Status Table. " P0
G4 P500
M118 S"... START OF Z ENDSTOP SETUP TUTORIAL(MESSAGE)... " P0