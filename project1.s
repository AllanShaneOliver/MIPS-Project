.data
#PritStat: .asciiz "Using my Howard student ID Number, I determined that (02940666 % 11) + 10 is 29. Therefore, all conversions will be completed from Base 29. \n Please input the number you wish to convert from Base 29 to decimal: \n"
list: .space 11 #can store 10 characters into a string named "list"

.text
.globl main

main:
  li $v0, 8 #reads strings into list string
  la $a0, list
  li $a1, 10 #input no more than 10 characters
  syscall
  move $t1, $a0

li $s1, '0' #character 0
li $s2, '9' #character 9
li $t4, 'a' #character a - lower boundary for base 29
li $t5, 's' #character s - upper boundary for base 29
li $t6, 'A' #character A - lower boundary for base 29
li $t7, 'S' #character S - upper boundary for base 29
li $s3, 0 #result variable
li $s4, 0 #variable kept at 0

begin:
  li $t2, 0 #$i=0;
  li $s5, 10 #exit condition - exit loop if at 10th character

loop:
    beq $s5, $t2, afterloop #or use exit if not working
    addi $t2, $t2, 1 #add 1 after each iteration, i++;
    lb $t0, 0($t1) #loads byte of user input into $t0
    addi $t1, $t1, 1

L1: blt $t0, $s1, L2 #test the next condition if this falls through
    bgt $t0, $s2, L2 #move to L2 if this isn't true
    addi $s3, $t0, -48 #subtract 48, place result into $s3
    j FN

L2: blt $t0, $t4, L3 #test the next condition if this falls through
    bgt $t0, $t5, L3 #move to L3 if this isn't true
    addi $s3, $t0, -87 #subtract 87, place result into $s3
    j FN

L3: blt $t0, $t6, EL #test the next condition if this falls through
    bgt $t0, $t7, EL #move to ELSE if this isn't true
    addi $s3, $t0, -55 #subtract 55, place result into $s3
    j FN

EL: move $s3, $s4
FN: j loop

afterloop:
  add $v0, $s3, $zero #copy sum into register $v0
  li $v0, 1
  move $a0, $s3
  syscall

exit:
  jr $ra #exit program

