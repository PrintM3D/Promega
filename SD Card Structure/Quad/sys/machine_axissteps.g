; machine_axissteps.g
; July 19, 2018

; These values define how many steps make 1mm of movement.
; Please note, only change the calibration if the measurements are always
; off by the same amount, no matter what the material, layer height or print speed.

; Here is a link on how to properly calibrate your step values.
; http://print.theporto.com/posts/how-to-calibrate-your-3d-printer-for-accurate-printing/

M92 X79.8 Y79.8 Z282.6961 ; Set axis steps/mm
M350 X32 Y32 Z32          ; Setting microstepping to 1/32.
