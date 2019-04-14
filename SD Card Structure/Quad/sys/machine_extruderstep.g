; machine_extruderstep.g
; July 19, 2018

; This document allows you to calibrate the extruder steps.
; This is important to verify as it can lead to over or under extrusion if the values are wrong.
; Here is a link to how to calibrate extruder steps:
; http://print.theporto.com/posts/how-to-calibrate-your-3d-printer-extruder-steps/

M92 E2140:2140:2140:2140 ; Extruder Steps/mm (This is approximate for the Quad. It could be calibrated for individual extruder variances.)
M350 E16:16:16:16    ; Setting microstepping.
