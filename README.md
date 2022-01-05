# Bits-Detector

## Explanation

Design a sequential circuit that detects consecutive inputs: "1" and directly followed by '0'. The overlapped sequence is permitted.  
Codes are written in Verilog.  

## Why designing this?

I planned to design this project originally because I found it difficult to understand digital circuit's sequential behaviour due to clock synchronization. It was strange because I was not very sure whether the signals inside "always" block were evaluated first and then their value were updated or these two events occured simultaneously. After spending so much time, I managed to get the idea for that. Furthermore, I learned by doing and finally made simple FSM in three different code structures: three different blocks (output block, next state logics block, and state register block) written explicitly, two different blocks (next state logics block and state register block), and two different blocks with implicitly written nextstate logics. The first one is covered in "fsm2.v" file. The second one is realised in "fsm1.v", while the last one is in "fsm3.v".
