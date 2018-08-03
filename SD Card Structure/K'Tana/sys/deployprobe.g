; Probe deployment routine: Lower bed away from nozzle, and prompt for probe deployment

G1 Z75 S1 ; lower bed by 75mm to give room for deploying probe

M291 P"Deploy the Z Probe if needed. Press OK when done." S2
