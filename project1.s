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
