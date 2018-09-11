;_____________Check Bed Corners_____________
M291 P"Do you want to check the bed corners for level? You should already be homed." S3



G29 S2 ; Disable bed mesh
G29 S2 ; Disable bed mesh

M291 P"Deploy the Z Probe if needed. Press OK when done." S2

;Do not home, you wan to run this sequence repeatedly until close enough.
;G28 ; Home all

;I do not heat the bed. For coarse leveling it should not be required. But knock yourself out if you think it will help.

;Disable stealthchop for bed safety
M569 P2 D2 F8

;Run corners in reverse order so the user can more easily see Front Left, Front Right, Back Right, Back Left in the G-Code Console from top to bottom.

;Go to X/Y Point 1
G1 X50 Y375 F9000
;Move to safe Z position
G1 Z20
;Probe Point 1 - Back Left
G30 S-1

;If the position is not reliably reported to the console, enable these four lines and run the macro with DWC at full size.
;M291 P"Record Z Position Press OK to Continue." S2

;Move to safe Z position
G1 Z20
;Go to X/Y Point 2
G1 X375 Y350 F9000

;Probe Point 2 - Back Right
G30 S-1
;M291 P"Record Z Position Press OK to Continue." S2

;Move to safe Z position
G1 Z20
;Go to X/Y intermediate point to prevent wires getting caught in mechanism
;G1 X250 Y350 F9000
;Go to X/Y Point 3
G1 X375 Y25 F9000
;Probe Point 3 - Front Right
G30 S-1
;M291 P"Record Z Position Press OK to Continue." S2

;Move to safe Z position
G1 Z20
;Go to X/Y Point 4
G1 X50 Y25 F9000

;Probe Point 4 - Front Left
G30 S-1
;M291 P"Record Z Position Press OK to Continue." S2

;Enable stealthchop for quietness
M569 P2 D3

G1 Z100 ;Move to a good-ish spot to adjust the bed corners.

M291 P"Top to bottom in G-Code Console FL, FR, BL, BR" S2
