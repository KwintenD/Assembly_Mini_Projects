JMP start

sentence:
DB "Is dit een geheime zin??"
DB 0x00

start:
MOV B, 0x00
MOV C, sentence
MOV D, 0xE8
CALL print

MOV C, sentence
CALL encrypt

MOV C, sentence
MOV D, 0xE8
CALL print

MOV C, sentence
CALL decrypt

MOV C, sentence
MOV D, 0xE8
CALL print

HLT

print:
MOV A, [C]
MOV [D], A
INC C
INC D  
CMP B, [C]
JNZ print
RET

encrypt:
MOV A, [C]
MOV D, A
AND D, 11100000b
SHR D, 5
SHL A, 3
OR A, D
XOR A, 11010001b
MOV [C], A
INC C
CMP B, [C]
JNZ encrypt
RET

decrypt:
MOV A, [C]
XOR A, 11010001b
MOV D, A
AND D, 00000111b
SHL D, 5
SHR A, 3
OR A, D
MOV [C], A
INC C
CMP B, [C]
JNZ decrypt
RET
