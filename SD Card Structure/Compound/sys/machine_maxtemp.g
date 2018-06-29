; machine_maxtemp.g
; June 29, 2018

; This document sets the maximum temperatures for the bed and the hot ends.
; This should only be changed if hardware modifications have been made that
; can handle the higher temperatures!
; FIRE HAZARD - USE AT YOUR OWN RISK!!!!!!

M143 H0 S120 ; Set maximum bed temperature to 120 C
M143 H1 S320 ; Set maximum heater temperature to 320C for hot end 1
M143 H2 S320 ; Set maximum heater temperature to 320C for hot end 2
