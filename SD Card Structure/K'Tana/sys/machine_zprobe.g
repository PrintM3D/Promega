; machine_probe.g
; June 29, 2018

; This document tells the printer which Z probe to use and what the offsets of that probe are.
; For X and Y offset, use a caliper and measure the distance between the center of the nozzle
; and the part of the probe that measures the bed.
; If the probe is to the right of the nozzle, the X value is positive
; If the probe is to the left of the nozzle, the X value is negative
; If the probe is behind the nozzle, the Y value is positive
; If the probe is in front of the nozzle, the Y value is negative

; To select which probe to use, comment / uncomment ONE of the two M558 lines below.

; Determine the Probe Z Offset:
; 1. Home your printer
; 2. Heat the bed to 60C and the nozzle to 150C
; 3. Disable bed leveling with G29 S2, otherwise this can conflict with your new Z-probe offset
; 4. Move the head near the center with G1 X200 Y200
; 5. Move the bed near the nozzle with G1 Z20
; 6. Deploy the probe if necessary
; 7. Get the Z Probe value with G30 S-1
; 8. Note the printer Z value in the Web UI and update it in the G31 Z parameter below
; 9. Retract the Z probe if necessary
; 10. Enable bed leveling compensation again with G29 S1

; Toggle by uncommenting, depending on preference
; M558 P1 X0 Y0 Z1 H5 F120 T5000 	; Set Z probe type -- Enable IR_PROBE
M558 P4 I1 X0 Y0 Z1 H5 F100 T5000 	; Set Z probe type -- Enable LIMIT SWITCH

; Remember to update your Z-probe offset with the Z parameter below: http://promega.printm3d.com/books/user-manual/page/bed-leveling-probing#bkmrk-the-limit-switch-pro
; G31 P450 X25 Y30 Z10.0 			; Set Z probe (IR) trigger value and offset
G31 P999 X-52 Y30 Z10.0 				; Set Z probe (limit switch) trigger value, offset
