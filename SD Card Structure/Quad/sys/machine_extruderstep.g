; machine_extruderstep.g
; April 15, 2019

; This document allows you to calibrate the extruder steps.
; This is important to verify as it can lead to over or under extrusion if the values are wrong.
; Here is a link to how to calibrate extruder steps:
; http://print.theporto.com/posts/how-to-calibrate-your-3d-printer-extruder-steps/

M350 E16		; Confirming default 1/16 microstepping mode for calculation, in case firmware default changes

M92 E2140 ; Extruder microteps/mm

M350 E128    ; Set microstepping mode to 1/128.