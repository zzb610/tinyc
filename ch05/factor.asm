FUNC @main:
; int i;
var i
; i = 0
push 0
pop i
; while(i < 0)
_beg_while:
  ; test i < 10
  push i
  push 10
  cmplt
  jz _end_while

  ; i = i + 1
  push i
  push 1
  add
  pop i

  ; if (i == 3 || i == 5) { contiue; }
  ; push i
  ; push 3
  ; cmpne
  ; ; i == 3 (i != 3 false)
  ; jz _beg_while
  ; ; i == 5
  ; push i
  ; push 5
  ; jz _beg_while

  _begin_if1:
  push i
  push 3
  cmpeq
  push i
  push 5
  cmpeq
  or
  ; if flase
  jz _end_if1
  ; if true
  jmp _beg_while 
  _end_if1:



  ; if (i == 8) { break; }
  ; push i
  ; push 8
  ; cmpne
  ; jz _end_while
  _begin_if2:
  ; i == 8
  push i
  push 8
  cmpeq
  ; if false
  jz _end_if2
  ; if true
  jmp _end_while
  _end_if2:


  ; print("%d! = %d", i, factor(i))
  push i
  push i
  $factor
  print "%d! = %d"

  jmp _beg_while

_end_while:

  ret 0
ENDFUNC

FUNC @factor:

arg n

; if (n < 2) { return 1; }
push n
push 2
cmplt
jz _recursive
;return 1
push 1
ret ~

_recursive:
; return n * factor(n-1)
push n
push n
push 1
sub
$factor
mul
ret ~


ENDFUNC