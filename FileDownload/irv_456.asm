#.include "test1.asm"
#.include "test2.asm"
#.include "test3.asm"
.include "test4.asm"
.data
Intro: .asciiz "I am 456\n"
.text
la $a0, Intro
li $v0, 4
syscall

la $a0, num1
li $v0, 4
syscall
