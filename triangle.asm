;Author information
;  Author name: Jacob Hajjar
;  CPSC240-1
;  Author email: hajjarj@csu.fullerton.edu
;  Program name: Project 2 Right Triangles

extern scanf

extern printf

extern atof

global triangle

segment .data

name_prompt db "Please enter your last name: ", 0
title_prompt db "Please enter your title: ", 0
sides_prompt db "Please enter the sides of your triangle seperated by ws: ", 0
area_message  db "The area of this triangle is %.5lf square units", 10, 0
length_message db "The length of the hypotenuse is %.9lf units.", 10, 0
enjoy_message db "Please enjoy your triangles %s %s.", 10, 0
stringform db "%s", 0


segment .bss
last_name resd 4
title resd 4
side_1 resq 1
side_2 resq 1

segment .text

triangle: 

;register backup
mov qword rax, 0

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf 

;prompt user for last name
mov qword rax, 0
mov rdi, stringform
mov rsi, name_prompt
call printf

;take in users last name and store into reserved memory
mov qword rax, 0
mov      rdi, stringform
mov      rsi, last_name
call      scanf

;prompt user for their title
mov qword rax, 0
mov rdi, stringform
mov rsi, title_prompt
call printf

;take in users title and store into memory
mov qword rax, 0
mov      rdi, stringform
mov      rsi, title
call     scanf

;prompt user for sides of the triangle
mov qword rax, 0
mov rdi, stringform
mov rsi, sides_prompt
call printf

;take in first side as a string, then convert to double and store in reserved memory
mov qword rax, 0
mov      rdi, stringform
mov      rsi, rsp
call      scanf
mov qword rax, 1
mov rdi, rsp
call atof
movq [side_1], xmm0


;take in second side as a string, then convert to double and store in reserved memory
mov qword rax, 0
mov      rdi, stringform
mov      rsi, rsp
call      scanf
mov qword rax, 1
mov rdi, rsp
call atof
movq [side_2], xmm0


;calculate the are by multiplying the sides and dividing by 2 since its a right triangle

movsd xmm10, [side_1] ;put value of side 1 into register
movsd xmm11, [side_2] ;put value of side 2 into register
mulsd xmm10, xmm11 ;distance squared and stored in xmm10

mov rax,  0x4000000000000000
movq xmm9, rax
divsd xmm10, xmm9

;print calculated area
movsd xmm0, xmm10
mov rax, 1
mov rdi, area_message
call printf

;calculate hypotenuse of the sides
movsd xmm10, [side_1] ;put value of side 1 into register
mulsd xmm10, xmm10 ;square side 1 in xmm10

movsd xmm11, [side_2] ;put value of side 2 into register
mulsd xmm11, xmm11 ;square side 2 in xmm11

addsd xmm10, xmm11 ;add xmm11 (side 2) to xmm10 and store there
sqrtsd xmm10, xmm10 ;square root register and store back in itself

;print calculated hypotenuse
mov qword rax, 0
movsd xmm0, xmm10
mov rax, 1
mov rdi, length_message
call printf

;print enjoy message
mov rdi, enjoy_message
mov rsi, title
mov rdx, last_name
call printf

pop rax ;some stuff to fix a seg fault ,pop rax and push qword 0 
push qword 0

movsd xmm0, xmm10

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp     

ret

