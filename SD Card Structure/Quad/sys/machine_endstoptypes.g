; machine_endstoptypes.g
; July 17, 2018

; This file defines what type of end-stops the printer is using.
; Make sure you set the correct end-stop type or your printer will grind the belts trying to reach an end-stop that isn't responding!!!

; Use this if you have an optical Z endstop
;M574 X2 Y2 S0 ; Set xy end-stops types (S0 is active low, applied to XY)
;M574 Z2 S1 ; Set z end-stops types (S1 is active high, applied to Z)

; Use this if you have a mechanical Z endstop
M574 X2 Y2 Z2 S0 ; Set xy end-stops types (S0 is active low, applied to XY)
