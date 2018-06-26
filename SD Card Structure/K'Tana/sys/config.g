; CONFIGURATION FILE FOR Duet Maestro 
; K'Tana Nozzle
 
; LAST UPDATED: 06/14/18 10:38 AM 

; Executed by the firmware on start-up

; Headers within parenthesis are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer
; Visit https://reprap.org/wiki/G-code for an explanation of G-code commands

; --- SECTION: GENERAL PREFERENCES ( ) ---

M564 H1 S1 ; Enable axes limits and homing requirement for motor activation

; --- SECTION: Z-PROBE & MESH COMPENSATION (Z PROBE SECTION) ---

; Toggle by uncommenting, depending on preference
; M558 P1 X0 Y0 Z1 H5 F120 T5000 	; Set Z probe type -- Enable IR_PROBE
M558 P4 I1 X0 Y0 Z1 H5 F100 T5000 	; Set Z probe type -- Enable LIMIT SWITCH

; Remember to update your Z-probe offset with the Z parameter below: http://promega.printm3d.com/books/user-manual/page/bed-leveling-probing#bkmrk-the-limit-switch-pro
; G31 P450 X25 Y30 Z10.0 			; Set Z probe (IR) trigger value and offset
G31 P999 X-52 Y30 Z10.0 				; Set Z probe (limit switch) trigger value, offset

M557 X0:325 Y30:380 S30 			; Define heightmap mesh
M376 H25							; Define height(mm) over which to taper off heightmap compensation

G29 S1 								; Load heightmap after power cycle

; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---

M667 S1  							; set corexy on
M569 P0 S0 							; Drive 0 goes forwards, CoreXY_1
M569 P1 S1 							; Drive 1 goes forwards, CoreXY_2
M569 P2 S1 							; Drive 2 goes forwards, Z Motor
M569 P3 S0 							; Drive 3 goes forwards, Left Extruder
M569 P4 S1 							; Drive 4 goes forwards, Right Extruder
M574 X2 Y2 Z2 S0 					; Set xyz end-stops types (S0 is active low, applied to XYZ)
M906 X680 Y680 Z600 E350:350 I60	; Set motor currents (mA) and idle current percentage
M201 X1000 Y1000 Z75 E250:250 		; Set accelerations (mm/s^2)
M203 X4200 Y4200 Z2300 E5000:5000 	; Set maximum linear speeds
M566 X150 Y150 Z50 E100:100 		; Set maximum instantaneous speed changes (mm/min)
M92 X79.8 Y79.8 Z282.6961 			; Set axis steps/mm
M92 E180.4:180.4 					; Extruder Steps/mm
M350 X32 Y32 Z32 E32:32 			; Setting microstepping to 1/32. 
M208 X0 Y0 Z0 S1 					; Set axis minima
M208 X383 Y388 Z376 S0 				; Set axis maxima
G21 								; Work in millimetres
M84 S1 								; Set idle timeout

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
M143 H0 S120 						; Set maximum bed temperature to 120 C
M143 H1 S320 						; Set maximum heater temperature to 320C for hot end 1
M143 H2 S320 						; Set maximum heater temperature to 320C for hot end 2

; --- SECTION: FANS ( ) ---

M106 P0 S0 I0 F4 H-1 L0.3			; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P1 S0 I0 F4 H-1 L0.3			; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P2 S0 I0 F4 H-1 L0.3			; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%

; --- SECTION: TOOLS ( ) --- 

; Comment: H0 is heated bed
; Comment: D0 is the first driver after movement drives, which is extruder port E0
; Comment: Dual nozzle setup is done by creating seperate tools for each extruder, then switching between tools in slicer
; Comment: Left nozzle has a -12.0 mm offset, considering right nozzle as origin

; Compound Nozzle Tools (Commented)
; Mixing Tool T0
; M563 P0 D0:1 H1 F2 S"Mixing" 		; Define mixing tool
; G10 P0 X0 Y0 Z0 					; set axis offsets
; G10 P0 R0 S0 						; set active (S0) & standby temp (R0) at 0.
; M567 P0 E0.5:0.5 					; Set tool mix ratios for extruder
; M568 P0 S1 						; Turn on tool mixing for the extruder
; Right Only T1
; M563 P2 D0 H1 F2 S"Mixing as Single Right"; mixing nozzle only using right motor
; M568 P2 S0 						; Turn off tool mixing
; Left Only T2
; M563 P3 D1 H1 F2 S"Mixing as Single Left" ; mixing nozzle only using left motor
; M568 P3 S0 						; Turn off tool mixing

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
M550 PPromega 						; Set machine name, type promega/ in your browser!
M552 P0.0.0.0 S1 					; Set IP address and enable networking
M586 P0 S1 							; Enable HTTP
M586 P1 S0 							; Disable FTP
M586 P2 S0 							; Disable Telnet

; --- SECTION: MISCELLANEOUS --- 

M572 D0:1 S0.07 					; Extruder Pressure Advance 