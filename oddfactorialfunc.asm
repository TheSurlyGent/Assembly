#int sum_odd_factorial(int n){
     #int sum = 0;
    #for(int i = 1; i <= n;i+=2)
        #sum += factorial(i);
    #return sum;
#}
odd_fact_sum:
# Compute and return odd_fact_sum number
#Push $ra $s0, and $s1 to stack
addi $sp,$sp,-16
sw $ra,0($sp)   #storing return address in stack
sw $s0,4($sp)   #storing first saved register in stack
sw $s1,8($sp)   #storing second saved register in stack
sw $s2,12($sp)   #storing third saved register in stack

move $s0, $a0	#n is now stored in $s0
move $s1, $zero	#sum is now stored in $s1 and initialized to zero
addi $t0, $zero, 1
for: slt $t1, $s0, $t0
bne $t1, $zero, exit
#body of for loop
jal factorial
add $s1, $s1, $v0 # sum += factorial(i
addi $t0, $t0, 2 # i += 2
j for
exit:
lw $ra,0($sp)   #restoring return address from stack
lw $s0,4($sp)   #restoring first saved register from stack
lw $s1,8($sp)   #restoring second saved register from stack
lw $s2,12($sp)   #restoring third saved register from stack
addi $sp,$sp,16
jr $ra

#int factorial(int n){
#	 int rv = 1;
#    for(int i = 1; i <= n;i++)
#       rv *= i;
#    return rv;
#}
factorial:
#compute the factorial of a number
addi $sp,$sp,-16
sw $ra,0($sp)   #storing return address in stack
sw $s0,4($sp)   #storing first saved register in stack
sw $s1,8($sp)   #storing second saved register in stack
sw $s2,12($sp)   #storing third saved register in stack

move $s0, $a0	# n is now stored in $s0
addi $s1, $zero, 1 # rv is now initialized in s1 to 1
addi $t0, $zero, 1 # i =1
for slt $t1, $s0, $t0
bne $t1, $zero, exit
#body of for loop
mul $s1, $s1, $t0
addi $t0, $t0, 1
j for
exit:

lw $ra,0($sp)   #restoring return address from stack
lw $s0,4($sp)   #restoring first saved register from stack
lw $s1,8($sp)   #restoring second saved register from stack
lw $s2,12($sp)   #restoring third saved register from stack
addi $sp,$sp,16
jr $ra

