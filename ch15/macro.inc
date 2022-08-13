%macro print 1
  [section .data]
    %%string: db %1, 10, 0
  [section .text]
    push dword %%string
    call PRINT
    shl eax, 2
    add esp, eax
%endmacro

%macro exit 1
  mov eax, 1
  mov ebx, %1
  int 0x80
%endmacro

%macro readint 1
  [section .data]
    %%string: db %1, 0
  [section .text]
    push dword %%string
    call READINT
    MOV [esp], eax
%endmacro


%macro add 0
  pop eax
  add dword [esp], eax
%endmacro

%macro sub 0
  pop eax
  sub dword [esp], eax
%endmacro

%macro cmpeq 0
  mov eax, [esp+4]
  cmp eax, [esp]
  pushf
  pop eax
  shr eax, 6
  and eax, 0x1
  add esp, 4
  mov [esp], eax
%endmacro

%macro not 0
  mov eax, [esp]
  or  eax, eax
  pushf
  pop eax
  shr eax, 6
  and eax, 0x1
  mov [esp], eax
%endmacro

%macro jz 1
  pop eax
  or  eax, eax
  JZ  %1
%endmacro

%macro jmp 1
  JMP %1
%endmacro

%macro push 1
  push dword %1
%endmacro

%macro pop 0-1
  %IFIDN %0, 0
    add esp, 4
  %ELSE
    pop dword %1
  %ENDIF
%endmacro

%macro FUNC 1
  %1
  push ebp
  mov  ebp, esp
%endmacro

%macro ret 0-1
  %ifidn %0, 1
    %ifidn %1, ~
      mov eax, [esp]
    %else
      mov eax, %1
    %endif
    leave
    ret
%endmacro


extern PRINT, READINT
global _start

[section .text]
_start: