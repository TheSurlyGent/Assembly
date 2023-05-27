#int cube_sum(int n){int sum = 0;
#for(int i = 0; i <= n;i++)sum+=cube(i);
#return sum;}
cube_sum:
# Compute and return cube_sum number
#Push $ra $s0, and $s1 to stack
addi $sp,$sp,-16
sw $ra,0($sp)   #storing return address in stack
sw $s0,4($sp)   #storing first saved register in stack
sw $s1,8($sp)   #storing second saved register in stack
sw $s2,12($sp)   #storing third saved register in stack

move $s0, $a0	#n is now stored in $s0
move $s2, $zero	#sum is now stored in $s2 and initialized to zero
addi $s1, $zero, 1	#i is stored in $s1 and initialized to 1
for: slt $t0, $s0, $s1
bne $t0, $zero, exit
#body of for loop
move $a0, $s1
jal cube
add $s2, $s2, $v0	#sum += cube(i)
#end of for loop
addi $s1, $s1, 1
j for
exit:
move $v0, $s2	#returning sum
lw $ra,0($sp)   #restoring return address from stack
lw $s0,4($sp)   #restoring first saved register from stack
lw $s1,8($sp)   #restoring second saved register from stack
lw $s2,12($sp)   #restoring third saved register from stack
addi $sp,$sp,16
jr $ra

#int cube(int n){
#	return n*n*n;
#}
cube:
#compute the cube of a number
mul $t0, $a0, $a0
mul $t0, $t0, $a0
move $v0, $t0
jr $ra