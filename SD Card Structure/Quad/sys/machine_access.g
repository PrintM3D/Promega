; machine_access.g
; June 29, 2018

; Set the machine name and IP address in here
; Follow http://promega.printm3d.com/books/user-manual/page/network-setup, for more help

M111 S0                       ; Debugging off
M550 PpromegaQuad                 ; Set machine name, type promega/ in your browser!

; M551, No Machine Password
; M540 PBE:EF:DE:AD:FE:ED     ; Set MAC address, this can be used to assign a given IP in the DHCP
M552 P0.0.0.0 S1             ; Use this to enable DHCP
; M552 P192.168.1.82 S1        ; Set Static IP address and enable networking
