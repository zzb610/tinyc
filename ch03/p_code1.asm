; int a,b
var a, b

; a = 1 + 2;
push 1
push 2
add
pop a

; b = a * 2;
push a
push 2
mul
pop b

;print("a=%d, b=%d", a, b);
push a
push b
print "a=%d, b=%d"

;jmp/jz
jmp Code
push 1
Code:
push 0
jz Label
print "stack top is NOT zero !"
Label:
print "stack top is zero !!!"

; Run
; python pysim.py p_code1.asm