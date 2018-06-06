; homey.g
; called to home the Y axis
;

; Same as homex.g because coreXY

; ============= PRE-HOMING SEQUENCE =====================

; Ignore Machine boundaries
M564 H0 S0

;Disable bed leveling while homing
M561
G29 S2

; Switch to Origin Tool
T0

; Relative positioning
G91

; Provide Z height clearance
G1 Z10 F1200 S1


; ================== HOME Y ============================

; Move away from x limit to prevent damage to endstop
G0 X35 F3000

; Rapid Y until limit switch triggers
G0 Y-450 F3000 S1

; Back off to release limit switch
G0 Y6 F3000

; Slow advance to trigger limit switch
G0 Y-10 F120 S1

; Set this location as Y = 0mm
G92 Y0

; ============= HOME X ====================

; Move the gantry slightly away from back of printer, to allow travel past the bolt mounting the gantry bracket
G0 Y12 F1200

; Rapid X until limit switch triggers
G0 X-450 F3000 S1

; Back off to release limit switch
G0 X6 F3000

; Slow advance to trigger limit switch
G0 X-10 F120 S1

; Move away from the limit switch, to prevent damage to it upon next move
G0 X5 F3000

; Set this location as X = 0mm
G92 X0

; Revert to absolute coordinates
G91

;Re-enable mesh leveling
G29 S1

; Enable Machine Boundaries
M564 H0 S1