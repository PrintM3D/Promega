; machine_bedmesh.g
; June 29, 2018

; This file defines the extent and density of the bed mesh.
; The way this is calculated is by taking the max X, subtract the Z probe X offset
; from it and use that as the second of the X values.
; For example, if max X is 383 and the Z probe X offset is -43, the parameter would be X0:340
; For the Y parameter, make sure you don't start too far to the front or you will hit
; the bed clips with the hot end.  Anywhere between 35 and 40 is probably a good start.
; The S parameter defines the distance between two mesh points in mm.

M557 X0:340 Y35:380 S48 ; Define heightmap mesh
M376 H25 ; Define height(mm) over which to taper off heightmap compensation
