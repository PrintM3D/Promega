; print_startgcode.g
; April 15, 2019

; NOTE: call from the slicer

M291 P"Print Setup Starting"

M290 R0 S0 ; clear babystepping

G28 ;home all

G1 X5 Y40 Z20 F2000 ; move to left front edge, just enough to miss the clip

;Intro Line Near Left Edge
G1 Z0.3 F1000 			; move down to start intro purge line
G92 E0 					; zero extruder
G1 Y150 E35 F750 		; intro line
G1 Y175 F180 			; ooze it out buddy
G1 Y200 F5000 			; wipe off the ooze
;G1 Z5 F100 			; Lift off bed
G92 E0 					;zero extruder
M291 P"Ready to Print"