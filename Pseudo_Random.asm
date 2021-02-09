MOV [0xAF], 0x05 ; start seed

.loop:
MOV A, [0xAF]
MUL 8
MOV B, A
DIV 11
MUL 11
SUB B, A
MOV [0xAF], B
PUSH B
JMP .loop
