; homez.g
; called to home the Z axis
;

; ============= PRE-HOMING SEQUENCE =====================

; Ignore Machine boundaries
M564 H0 S0

; Disable mesh leveling while homing
M561
G29 S2

; Switch to Origin Tool
T0

; Relative positioning
G91

; Provide Z height clearance
G1 Z10 F1200 S1


; ============ HOME Z ==============

; Rapid Z until limit switch triggers
G0 Z450 F3000 S1

; Back off to release limit switch
G0 Z-6 F3000

; Slow advance to trigger limit switch
G0 Z10 F120 S1

; Set this location as Z = 378.8mm
G92 Z377 ;Z378.8

; Revert to absolute coordinates
G91

;Re-enable mesh leveling
G29 S1

; Set Axes Limits
M208 X0 Y0 Z-5 S1 ; Set axis minima
M208 X371 Y385 Z377 S0 ; Set axis maxima

; Stop movement across limits
M564 H0 S1
