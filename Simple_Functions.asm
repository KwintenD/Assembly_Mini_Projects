PUSH 0x2
CALL MultiplyByTwo ; call function
POP A
HLT

MultiplyByTwo: ; function
POP D
POP A
SHL A, 1
PUSH A
PUSH D
RET
