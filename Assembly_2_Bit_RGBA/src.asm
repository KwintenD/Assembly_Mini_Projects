MOV B, 0x00
JMP start

color: DB 11011011b	; alpha 1, red 1, green 0.667, blue 0.333
ASCII_table: DB "0123"

start:
MOV A, [color]
MOV C, 00000011b
SHL C, B
AND A, C
SHR A, B

MOV C, 0x00
CALL check_value
PUSH D

ADD B, 0x02
CMP B, 0x08
JNZ start

CALL print

HLT

check_value:
CMP A, C
JZ set_char
INC C
JMP check_value

set_char:
MOV D, ASCII_table
ADD D, C
MOV D, [D]
RET

print:
POP A

MOV [0xE8], 'R'
MOV [0xEE], 'G'
MOV [0xF4], 'B'
MOV [0xFA], 'A'

MOV C, 0xFE
.loop:
MOV [C], '3'
DEC C
MOV [C], '/'
DEC C
POP B
MOV [C], B
DEC C
MOV [C], ':'
SUB C, 2
MOV [C], ','
DEC C
CMP C, 0xE6
JNZ .loop

PUSH A
RET
