; CONFIGURATION FILE FOR PROTOTYPE DEVELOPMENT PROMEGA + DUET 2 MAESTRO

; Executed by the firmware on start-up
; Headers within parentheses are headings in Duet3D documentation=https://duet3d.com/wiki/Configuring_RepRapFirmware_for_a_Cartesian_printer


; --- SECTION: GENERAL PREFERENCES ( ) ---

; M555 P2 ... Set firmware compatibility to look like Marlin


; --- SECTION: Z-PROBE & MESH COMPENSATION (Z PROBE SECTION) ---

M558 P1 X0 Y0 Z1 H5 F120 T5000 ; Set Z probe type
; PREVIOUS G31 OFFSET = X-22.75 Y-37.90
G31 P500 X-36.5 Y-39 Z0.685 ; z at level with -1.092 IR reading, added a 0.0 offset for less pressure on bed adhesion
M557 X0:300 Y0:300 S75 ; Define probing mesh compensation grid


; --- SECTION: DRIVES (MOVEMENT SECTION) & ENDSTOPS ---

M667 S1 ; set corexy on
M569 P0 S1 ; Drive 0 goes forwards
M569 P1 S0 ; Drive 1 reversed
M569 P2 S1 ; Drive 2 goes forwards
M569 P3 S1 ; Drive 3 goes forwards
M569 P4 S1 ; Drive 4 goes forwards
; M350, Microstepping at defaults

M574 X1 Y1 Z2 S0 ; Set xyz end-stops types (S0 is active low, applied to only X & Y)

M208 X0 Y0 Z-5 S1 ; Set axis minima
M208 X388 Y388 Z388 S0 ; Set axis maxima

M906 X600 Y600 Z600 E450:450 I60 ; Set motor currents (mA) and motor idle factor
M203 X7200 Y7200 Z600 E5000:5000 ; Set maximum speeds (mm/min)
M201 X1000 Y1000 Z100 E250:250 ; Set accelerations (mm/s^2)
M566 X500 Y500 Z50 E300:300 ; Set maximum instantaneous speed changes (mm/min)

M92 X79.8 Y79.8 Z281.9623 ; Set axis steps/mm
M92 E173 ; Set extruder steps per mm
G21 ; Work in millimetres
G90 ; Send absolute coordinates...
M84 S1 ; Set idle timeout


; --- SECTION: HEATERS (HEATER & THERMISTOR SECTION) ---

M570 H0 P25 T30 ;   Let heater be off by as much as 30C for 25 seconds
M570 H1 P25 T30 ;   Let heater be off by as much as 30C for 25 seconds
M570 H2 P25 T30 ;   Let heater be off by as much as 30C for 25 seconds

M305 P0 T100000 B4138 C0 R2200 ; Set thermistor + ADC parameters for heater 0
M301 H0 S0.8 P10 I0.1 D200 T0.4 W180 B30 ; Use PID on bed heater (may require further tuning)

M305 P1 X501 R2200 ; Define left side extruder PT1000
; Using M307 to automatically calculate the PID parameters, M301 H1 P1.7 I0.02 D8.1 T0.4 S0.20 W180 B30
M307 H1 A260.6 C73.2 D3.5 S1.00 B0 ; M303 auto-tune calibration settings, with Walle Fan On

M305 P2 X502 R2200 ; Define right side extruder PT1000 -- EL
; Using M307 to automatically calculate the PID parameters, M301 H2 P3.6 I0.043 D17.5 T0.4 S0.25 W180 B30
M307 H2 A246.1 C64.7 D2.0 S1.00 B0 ; M303 auto-tune calibration settings, with Walle Fan On

; M305 P3 X503 R2200

M302 P1 ; Allow Cold extrudes
M143 S320 ; Set maximum heater temperature to 320C


; --- SECTION: FANS ( ) ---

M106 P0 S0 I0 F4 H-1 L0.3 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%
M106 P1 S0 I0 F4 H-1 L0.3 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off, Minimum fan value 0.3, Speed 100%


; --- SECTION: TOOLS (TOOL DEFINITION SECTION) --- 

; Comment: H0 is typically heated bed
; Comment: D0 is the first driver after movement drives, which is extruder
; Comment: Dual nozzle setup is done by creating separate tools for each extruder, then switching between tools in slicer
; Comment: Left extruder has a +12 mm offset, considering right nozzle as origin (sic.)
M563 P0 D0 H1 S"Ktana Single Right" ; Define tool 0, right side tool (single extruder)
G10 P0 X0 Y0 Z0 ; Tool 0, set axis offsets
G10 P0 S0 R0 ; Tool 0, set active (S0) & standy temp (R) of 0.

M563 P1 D1 H2 S"Ktana Single Left" ; Define tool 1, left side tool (single extruder)
G10 P1 X12.45 Y0 Z0 ; Tool 1, set axis offsets
G10 P1 S0 R0 ; Tool 1, set active (S0) and standy temp (R) of 0

M563 P2 D0:1 H1 S"Mixing" ; Define tool 2, left & right side tool, one heater (mixing extruder)
G10 P2 X0 Y0 Z0 ; Tool 2, set axis offsets
G10 P2 R0 S0 ; Tool 2, set active (S0) & standby temp (R0) at 0.
M567 P2 E0.5:0.5 ; Set tool mix ratios for extruder
M568 P2 S1 ; Turn on tool mixing for the extruder

M563 P3 D0 H1 S"Mixing as Single Right"; Define tool 3, mixing nozzle only using right motor
M568 P3 S0 ; Turn off tool mixing

M563 P4 D1 H1 S"Mixing as Single Left" ; Define tool 4, mixing nozzle only using left motor
M568 P4 S0 ; Turn off tool mixing

T2 ; currently using mixing tool


; --- SECTION: NETWORKS (PROLOGUE & COMMUNCATIONS SECTION) ---

M111 S0 ; Debugging off
M550 Pprotox ; Set machine name, type protox.local/
; M551, No Machine Password
; M540 PBE:EF:DE:AD:FE:ED ; Set MAC address
M552 P0.0.0.0 S1 ; Set IP address and enable networking
M586 P0 S1 ; Enable HTTP
M586 P1 S0 ; Disable FTP
M586 P2 S0 ; Disable Telnet


; --- SECTION: MISCELLANEOUS --- 

; M572 D0:1 S0.4; Extruder Pressure Advance
; M501 ; Load saved parameters from config-override.g

