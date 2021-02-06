;If you use a byte for every number in a date you wil need 24 bits. But not every byte will be used optimal.
;In this example we will store a date in 16 bits with minimal bitt loss.

JMP start

;day -> max 31 -> 5 bits
;month -> max 12 -> 4 bits
;year -> max ? -> 2 bytes = 16 bits. we already have 9 bits so we can use 7 bits for the year

;06-02-2020
;days	month	year
;00110	0010	0010100

first_byte: DB 00110001b
second_byte: DB 00010100b

start:
CALL year
CALL month
CALL day
HLT

year:
POP D
MOV A, [second_byte]
AND A, 01111111b
PUSH A
PUSH D
RET

month:
POP D
MOV A, [first_byte]
MOV B, [second_byte]
AND A, 00000111b
AND B, 10000000b
SHL A, 1
SHR B, 7
OR A, B
PUSH A
PUSH D
RET

day:
POP D
MOV A, [first_byte]
AND A, 11111000b
SHR A, 0x03;
PUSH A
PUSH D
RET
