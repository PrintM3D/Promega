; homex.g
; called to home the X axis
;

; same as homey.g because of coreXY
; Front left corner is (0,0)

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
G1 Z10 F1200 S1

; ================== HOME Y ============================

; Rapid Y until limit switch triggers
G0 Y450 F3000 S1

; Back off to release limit switch
G0 Y-6 F3000

; Slow advance to trigger limit switch
G0 Y10 F120 S1

; Set this location as Y = 390mm
G92 Y390

; Move the gantry slightly away from back of printer, to allow travel past the bolt mounting the gantry bracket
G0 Y-5 F1200

; ============= HOME X ====================

; Rapid X until limit switch triggers
G0 X450 F3000 S1

; Back off to release limit switch
G0 X-6 F3000

; Slow advance to trigger limit switch
G0 X10 F120 S1

; Set this location as X = 383mm
G92 X383

; Move away from the limit switch, to prevent damage to it upon next move
G0 X-5 F3000

; ============ Post-Homing ==============

; Revert to absolute coordinates
G90

; Re-enable mesh leveling
G29 S1

; Set Axes Limits
M208 X0 Y0 Z0 S1 ; Set axis minima
M208 X383 Y385 Z376 S0 ; Set axis maxima

; Stop movement across limits, enable boundaries, homing requirement
M564 H1 S1

