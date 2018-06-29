; homez.g
; called to home the Z axis
;

; ============= PRE-HOMING =====================

; Ignore Machine boundaries
M564 H0 S0

; Turn off bed leveling during homing
G29 S2 ; Does the same as M561!


; Switch to Origin Tool
T0

; Relative positioning
G91

; Provide Z height clearance
G1 Z10 F750 S1


; ============ HOME Z ==============

; Rapid Z until limit switch triggers
G0 Z450 F1500 S1

; Back off to release limit switch
G0 Z-6 F1500

; Slow advance to trigger limit switch
G0 Z10 F120 S1

M98 Pmachine_zendstop.g ; Set Z Endstop height

; ============ Post-Homing ==============

; Revert to absolute coordinates
G90

; Re-enable mesh leveling
G29 S1

M98 Pmachine_axisdimension.g ; Set Axes Limits

; Stop movement across limits, enable boundaries, homing requirement
M564 H1 S1
