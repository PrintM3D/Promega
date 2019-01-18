; machine_zendstop.g
; June 29, 2018

; IMPORTANT: should you drop the bed or skip a tooth, this value might change and has to be recalibrated!!!

; This file sets the Z position of the Z end stop.  It is used to determine the height of the build volume.
; If this value is incorrect, you either have a nozzle that drags on the bed or is too far from the bed that
; the filament won't stick to the surface.  It is the single most important file to get right so do spend
; some time verifying the Z position after making changes here.

; Instructions
; 1. Home All
; 2. Disable the bed mesh with G29 S2 twice
; 3. Run G1 X200 Y200 Z20 F1500
; 4. Manually jog the bed up using the <Z-10 to <Z-0.1 using smaller steps as you get close to the nozzle
; 5. Have bed touching the nozzle, do not leave a gap.  If you can't reach the nozzle, estimate how far the
;    bed is from the nozzle and add that value to the Z value in the G92 command below and start over.
; 6. Record your Z height number as shown in the DWC Machine Status Head Position Window
; 7. Calculate the new Z value for the G92 command below:
;
;    If your Z value was positive, subtract the value from the current Z value in the G92 command below.
;    Example: If the measured Z value of the bed touching the nozzle was 2.5 and the current Z value was
;             376.4, the new Z value would be 376.4 - 2.5 = 373.9
;             Don't forget to set the Max Z value in machine_axisdimension.g to 374

;    If your Z value was negative, add the value to the current Z value in the G92 command below.
;    Example: If the measured Z value of the bed touching the nozzle was -0.7 and the current Z value was
;             376.4, the new Z value would be 376.4 + 0.7 = 377.1
;             Don't forget to set the Max Z value in machine_axisdimension.g to 378

;    If your Z value was 0, congratulations, no changes to this file are needed.

; 8. Re-enable your bed leveling compensation with G29 S1

; Set this location as Z = 343mm (Normally the Default Factory Number for Quad)
G92 Z343 ; With glass bed and Quad
