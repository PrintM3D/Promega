;_________Move the print head to a central position, and the bed to the bottom________

G90 ; Ensure we're absolute

; Move to a position off of XY axis
G0 X200 Y200

M98 Phomez.g ; Run the homez.g file
