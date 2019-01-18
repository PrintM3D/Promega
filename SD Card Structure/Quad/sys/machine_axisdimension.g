; machine_axisdimension.g
; June 29, 2018

; Set the minimum and maximum extent for each axis here.
; The minimum for the Z axis should not be more than 0.5mm past 0 under normal operation
; otherwise you risk crashing the bed when moving it too far into the nozzle.

; The max X and max Y should not need to be changed.
; The max Z needs to be at least the next higher integer than what the value was in the
; Z end stop configuration.  For example, if the Z end stop was at 376.4, max Z needs to be 377
; if the Z end stop was 377.2, max Z needs to be 378 etc.

M208 X0 Y0 Z-0.5 S1    ; Set axis minima
M208 X375 Y387 Z342 S0 ; Set axis maxima
