; startgcode.g
; called from the slicer

M117 Print Setup Starting

;G28 ;home all

G1 X5 Y40 Z20 F2000 ; move to left front edge, just enough to miss the clip

;Intro Line Near Left Edge
G1 Z0.3 F1000 ; move down to start intro purge line
G92 E0 ; zero extruder
G1 Y150 E35 F750 ; intro line
G1 Y175 F180 ; ooze it out buddy
G1 Y200 F5000 ; wipe off the ooze
;G1 Z5 F100 ; Lift off bed
G92 E0 ;zero extruder
M117 Ready to Print

M98 Pmachine_retraction_settings.g
M98 Pmachine_corexy_motion_settings.g