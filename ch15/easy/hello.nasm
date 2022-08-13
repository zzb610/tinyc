GLOBAL _start

[SECTION .TEXT]
_start:
  MOV EAX, 4
  MOV EBX, 1
  MOV ECX, msg
  MOV EDX, len
  INT 0x80

  MOV EAX, 1
  MOV EBX, 0
  INT 0x80

[SECTION .DATA]
  msg: DB "Hello, Word!", 10
  len: EQU $-msg
