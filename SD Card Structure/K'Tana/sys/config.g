; CONFIGURATION FILE FOR Duet Maestro 
; K'Tana Nozzle
 
; LAST UPDATED: 06/14/18 10:38 AM 

; Executed by the firmware on start-up

; Headers within parenthesis are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer
; Visit https://reprap.org/wiki/G-code for an explanation of G-code commands

; --- SECTION: GENERAL PREFERENCES ( ) ---

M564 H1 S1 ; Enable axes limits and homing requirement for motor activation

; --- SECTION: Z-PROBE & MESH COMPENSATION (Z PROBE SECTION) ---

M98 Pmachine_zprobe.g ; Call macro to configure the z probe

M98 Pmachine_bedmesh.g ; Call macro to configure the bed mesh

G29 S1 								; Load heightmap after power cycle

; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---

M667 S1  ; Enable coreXY mode
M569 P0 S0 ; Drive 0 goes forwards, CoreXY_1
M569 P1 S1 ; Drive 1 goes forwards, CoreXY_2
M569 P2 S1 ; Drive 2 goes forwards, Z Motor
M569 P3 S0 ; Drive 3 goes forwards, Left Extruder
M569 P4 S1 ; Drive 4 goes forwards, Right Extruder
M574 X2 Y2 Z2 S0 ; Set xyz end-stops types (S0 is active low, applied to XYZ)
M98 Pmachine_steppercurrent.g ; Call macro to set stepper currents
M98 Pmachine_stepperspeed.g ; Call macro to set stepper speeds
M98 Pmachine_axisdimension.g ; Call macro to configure the axes dimensions
M98 Pmachine_axissteps.g ; Call macro to configure the axes steps per mm
M98 Pmachine_extruderstep.g ; Call macro to configure the extruder steps
M350 X32 Y32 Z32 E32:32 ; Setting microstepping to 1/32. 
G21 ; Work in millimetres
G90 ; Set to absolute coordinates...
M84 S1 ; Set idle timeout

; --- SECTION: HEATERS (HEATER & THERMISTOR SECTION) ---
; H0 is bed
; H1 is heater
; H2 is heater

M570 H0 P25 T30 					; Allow heater to be off by as much as 30C for 25 seconds
M570 H1 P15 T30 					; Allow heater to be off by as much as 30C for 15 seconds
M570 H2 P15 T30 					; Allow heater to be off by as much as 30C for 15 seconds
M305 P0 T100000 B4138 C0 R2200 		; Set thermistor + ADC parameters for heater 0, For heated Bed thermistor
M305 P1 X501 R2200					; Define PT1000 
M305 P2 X502 R2200					; Define PT1000 
M307 H0 A78.9 C265.2 D9.5 S1.00 V24.0 B0 ; Forcing heated bed PID control after power-cycle. Basic bed heating auto-tune
M307 H1 A309 C96 D5.2 S0.75 V24.1 B0 ; Set PID values use M303 auto-tune calibration settings
M307 H2 A309 C96 D5.2 S0.75 V24.1 B0 ; Set PID values use M303 auto-tune calibration settings
M302 P1 							; Allow Cold extrudes
M98 Pmachine_maxtemp.g ; set bed and extruder max temperatures

; --- SECTION: FANS ( ) ---

M106 P0 S0 I0 F4 H-1 L0.3			; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P1 S0 I0 F4 H-1 L0.3			; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P2 S0 I0 F4 H-1 L0.3			; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%

; --- SECTION: TOOLS ( ) --- 

; Comment: H0 is heated bed
; Comment: D0 is the first driver after movement drives, which is extruder port E0
; Comment: Dual nozzle setup is done by creating seperate tools for each extruder, then switching between tools in slicer
; Comment: Left nozzle has a -12.0 mm offset, considering right nozzle as origin

; K'tana Tools
M563 P0 D1 H1 F2 S"Ktana Single Right" ; Define tool 0, right side tool (single extruder)
G10 P0 X0 Y0 Z0 					; Tool 0, set axis offsets
G10 P0 S0 R0 						; Tool 0, set active (S0) & standy temp (R) of 0.
M563 P1 D0 H2 F2 S"Ktana Single Left" ; Define tool 1, left side tool (single extruder)
G10 P1 X-12.0 Y0 Z0 				; Tool 1, set axis offsets
G10 P1 S0 R0 						; Tool 1, set active (S0) and standy temp (R) of 0

T0 									; Automatic tool 0 select

; --- SECTION: NETWORKS (PROLOGUE & COMMUNCATIONS SECTION) ---
; For more assistance with network follow: http://promega.printm3d.com/books/user-manual/page/network-setup

M111 S0 							; Debugging off
M98 Pmachine_access.g ; set machine name and IP
M586 P0 S1 							; Enable HTTP
M586 P1 S0 							; Disable FTP
M586 P2 S0 							; Disable Telnet

; --- SECTION: MISCELLANEOUS --- 

M572 D0:1 S0.07 					; Extruder Pressure Advance 