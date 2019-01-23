; machine_stepperspeed.g
; October 1, 2018

; This sets the different speed limits of the X Y and Z steppers.
; A higher acceleration value makes for faster print speeds, but can also introduce ghosting and other artifacts.
; The maximum linear speed should only be changed if hardware has changed
; The maximum instantaneous speed change determines how slow the print head has to move before it can make
; abrupt direction changes.
; These are advanced feature values and should only be changed for good reason and if you know how they impact prints.

M201 X3000 Y3000 Z75 E150 ; Set accelerations (mm/s^2)
M203 X9000 Y9000 Z2300 E5000 ; Set maximum linear speeds
M566 X350 Y350 Z50 E60 ; Set maximum instantaneous speed changes/jerk (mm/min)
