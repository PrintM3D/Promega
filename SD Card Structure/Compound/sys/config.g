; CONFIGURATION FILE for Duet Maestro
; Compound Nozzle

; Executed by the firmware on start-up

; Headers within parenthesis are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer
; Visit https://reprap.org/wiki/G-code for an explanation of G-code commands

; --- SECTION: GENERAL PREFERENCES ( ) ---

M564 S1 H1 ; Enables Homing Requirement For Motor Activation and set axes limits

; --- SECTION: Z-PROBE & MESH COMPENSATION ---

M98 Pmachine_zprobe.g ; configure the z probe

M98 Pmachine_bedmesh.g ; configure the bed mesh

G29 S1 ; Load heightmap after power cycle

; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---

M667 S1  ; Enable coreXY mode
M569 P0 S0 ; Drive 0 goes forwards, CoreXY_1
M569 P1 S1 ; Drive 1 goes forwards, CoreXY_2
M569 P2 S1 ; Drive 2 goes forwards, Z Motor
M569 P3 S0 ; Drive 3 goes forwards, Left Extruder
M569 P4 S1 ; Drive 4 goes forwards, Right Extruder
M98 Pmachine_endstoptypes.g   ; set endstop types
M98 Pmachine_steppercurrent.g ; set stepper currents
M98 Pmachine_stepperspeed.g   ; set stepper speeds
M98 Pmachine_axisdimension.g  ; configure the axes dimensions
M98 Pmachine_axissteps.g      ; configure the axes steps per mm
M98 Pmachine_extruderstep.g   ; configure the extruder steps
G21 ; Work in millimetres
G90 ; Set to absolute coordinates...
M84 S1 ; Set idle timeout

; --- SECTION: HEATERS, BED & THERMISTOR ---
; H0 is bed
; H1 is left heater
; H2 is right heater

M570 H0 P25 T30                           ; Allow heater to be off by as much as 30C for 25 seconds
M570 H1 P15 T30                           ; Allow heater to be off by as much as 30C for 15 seconds
M570 H2 P15 T30                           ; Allow heater to be off by as much as 30C for 15 seconds
M305 P0 T100000 B4138 C0 R2200            ; Set thermistor + ADC parameters for heater 0, For heated Bed thermistor
M305 P1 X501 R2200                        ; Define left side extruder PT1000 
M305 P2 X502 R2200                        ; Define right side extruder PT1000 
M307 H0 A78.9 C265.2 D9.5 S1.00 V24.0 B0  ; Forcing heated bed PID control after power-cycle. Basic bed heating auto-tune
M307 H1 A241.4 C104.5 D3.5 S1.00 V23.9 B0 ; Set PID values use M303 auto-tune calibration settings
M302 P1                                   ; Allow Cold extrudes
M98 Pmachine_maxtemp.g                    ; set bed and extruder max temperatures

; --- SECTION: FANS ( ) ---

M106 P0 S0 I0 F4 H-1 L0.3 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P1 S0 I0 F4 H-1 L0.3 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P2 S0 I0 F4 H-1 L0.3 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%

; --- SECTION: TOOLS ( ) --- 

; Comment: Remember! H0 is the heated bed!
; Comment: D0 is the first driver after movement (X, Y and Z) drives, which is left extruder
; D1 is right extruder

M98 Pmachine_compound_tools.g ; Define compound tools

T0 ; Automatic tool select

; --- SECTION: NETWORKS (PROLOGUE & COMMUNCATIONS SECTION) ---
M98 Pmachine_access.g ; set machine name and IP
M586 P0 S1 ; Enable HTTP
M586 P1 S0 ; Disable FTP
M586 P2 S0 ; Disable Telnet

; --- SECTION: MISCELLANEOUS --- 

M572 D0:1 S0.07 ; Extruder Pressure Advance 