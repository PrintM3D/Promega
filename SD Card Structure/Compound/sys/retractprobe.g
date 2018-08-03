; Probe retraction routine: Lower bed away from nozzle, and prompt for probe retraction

G1 Z75 S1 ; lower bed by 75mm to give room for retracting probe

M291 P"Retract the Z Probe if needed. Press OK when done." S2
