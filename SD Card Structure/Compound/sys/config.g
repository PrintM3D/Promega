; CONFIGURATION FILE FOR Duet Maestro 
 
; LAST UPDATED: 06/05/18 4:22 PM 

; Executed by the firmware on start-up

; Headers within parenthesis are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer

; --- SECTION: GENERAL PREFERENCES ( ) ---

M564 H0 ; Disables Homing Requirement For Motor Activation

; --- SECTION: Z-PROBE & MESH COMPENSATION (Z PROBE SECTION) ---

; Toggle by uncommenting, depending on preference
; M558 P1 X0 Y0 Z1 H5 F120 T5000 ; Set Z probe type -- SET AS IR_PROBE
M558 P4 I1 X0 Y0 Z1 H5 F100 T5000 ; Set Z probe type -- SET AS LIMIT SWITCH

; G31 P450 X-30.4 Y-30.7 Z2.6 ; Set Z probe (IR) trigger value and offset
G31 P999 X40 Y-28.5 Z2.3 ; Set Z probe (limit switch) trigger value, offset

M557 X50:370 Y10:350 S30 ; Define heightmap mesh

G29 S1 ; Load heightmap after power cycle

; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---

M667 S1  ; set corexy on
M569 P0 S1 ; Drive 0 goes forwards, CoreXY_1
M569 P1 S0 ; Drive 1 goes forwards, CoreXY_2
M569 P2 S1 ; Drive 2 goes forwards, Z Motor
M569 P3 S0 ; Drive 3 goes forwards, Left Extruder
M569 P4 S1 ; Drive 4 goes forwards, Right Extruder
M574 X2 Y2 Z2 S0 ; Set xyz end-stops types (S0 is active low, applied to XYZ)
M906 X680 Y680 Z600 E350:350 I60; Set motor currents (mA) and idle current percentage
M201 X1000 Y1000 Z75 E250:250 ; Set accelerations (mm/s^2)
M203 X4200 Y4200 Z2300 E5000:5000 ; Set maximum linear speeds
M566 X500 Y500 Z50 E300:300 ; Set maximum instantaneous speed changes (mm/min)
M208 X0 Y0 Z-5 S1 ; Set axis minima
M208 X371 Y385 Z377 S0 ; Set axis maxima
M92 X79.8 Y79.8 Z282.6961 ; Set axis steps/mm
M92 E180.4:180.4 ; Extruder Steps/mm
M350 X256 Y256 Z256 E256:256 ; Setting microstepping to 1/256. 
G21 ; Work in millimetres
G90 ; Set to absolute coordinates...
M84 S1 ; Set idle timeout

; --- SECTION: HEATERS (HEATER & THERMISTOR SECTION) ---

M570 H0 P25 T30 ;   Let heater be off by as much as 30C for 25 seconds
M570 H1 P15 T30 ;   Let heater be off by as much as 30C for 15 seconds
M570 H2 P15 T30 ;   Let heater be off by as much as 30C for 15 seconds
M305 P0 T100000 B4138 C0 R2200 ; Set thermistor + ADC parameters for heater 0, For heated Bed thermistor
M305 P1 X501 R2200; Define left side extruder PT1000 
M305 P2 X502 R2200; Define right side extruder PT1000 
M307 H0 A78.9 C265.2 D9.5 S1.00 V24.0 B0 ; Forcing heated bed PID control after power-cycle. Basic bed heating auto-tune
M307 H1 A279.4 C88.7 D2.4 S1.00 V24.1 B0 ; Set PID values use M303 auto-tune calibration settings
M307 H2 A310.9 C95.0 D3.4 S1.00 V24.1 B0 ; Set PID values use M303 auto-tune calibration settings
M302 P1 ; Allow Cold extrudes
M143 S320 ; Set maximum heater temperature to 320C

; --- SECTION: FANS ( ) ---

M106 P0 S0 I0 F4 H-1 L0.3; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P1 S0 I0 F4 H-1 L0.3; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P2 S0 I0 F4 H-1 L0.3; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%

; --- SECTION: TOOLS (TOOL DEFINITION SECTION) --- 

; Comment: H0 is typically heated bed
; Comment: D0 is the first driver after movement drives, which is extruder
; Comment: Dual nozzle setup is done by creating seperate tools for each extruder, then switching between tools in slicer
; Comment: Left extruder has a +12.45 mm offset, considering right nozzle as origin

; Compound Nozzle Tools
; Mixing Tool T0
M563 P0 D0:1 H1 S"Mixing" ; Define tool 2, left & right side tool, one heater (mixing extruder)
G10 P0 X0 Y0 Z0 ; Tool 2, set axis offsets
G10 P0 R0 S0 ; Tool 2, set active (S0) & standby temp (R0) at 0.
M567 P0 E0.5:0.5 ; Set tool mix ratios for extruder
M568 P0 S1 ; Turn on tool mixing for the extruder
; Right Only T1
M563 P2 D0 H1 S"Mixing as Single Right"; Define tool 3, mixing nozzle only using right motor
M568 P2 S0 ; Turn off tool mixing
; Left Only T2
M563 P3 D1 H1 S"Mixing as Single Left" ; Define tool 4, mixing nozzle only using left motor
M568 P3 S0 ; Turn off tool mixing

; K'tana Tools (Commented)
; M563 P4 D0 H1 S"Ktana Single Right" ; Define tool 0, right side tool (single extruder)
; G10 P4 X0 Y0 Z0 ; Tool 0, set axis offsets
; G10 P4 S0 R0 ; Tool 0, set active (S0) & standy temp (R) of 0.
; M563 P5 D1 H2 S"Ktana Single Left" ; Define tool 1, left side tool (single extruder)
; G10 P5 X12.45 Y0 Z0 ; Tool 1, set axis offsets
; G10 P5 S0 R0 ; Tool 1, set active (S0) and standy temp (R) of 0

T0 ; Automatic tool select

; --- SECTION: NETWORKS (PROLOGUE & COMMUNCATIONS SECTION) ---

M111 S0 ; Debugging off
M550 PProMega ; Set machine name, type protox.local/
; M551, No Machine Password
; M540 PBE:EF:DE:AD:FE:ED ; Set MAC address
M552 P0.0.0.0 S1 ; Set IP address and enable networking
M586 P0 S1 ; Enable HTTP
M586 P1 S0 ; Disable FTP
M586 P2 S0 ; Disable Telnet

; --- SECTION: MISCELLANEOUS --- 

; Comment: POSITIVE S values (in seconds) start extruder before motion system. When set too high there's not enough filamanet left to finish an extrude command, leaving gaps before a croner. NEGATIVE values delay extrusion until after movement has started. Too high leads to gaps after a corner -- AG

M572 D0:1 S0.07 ; Extruder Pressure Advance 