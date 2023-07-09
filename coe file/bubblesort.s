lw r1 , 0 ( r0 )    
add r2 , r1         
addi r2 , -2    
for:  
lw r3 , 0 ( r0 )   
addi r3 , -2
comp r11 , r10
add r3 , r11
add r11 , r2
bltz r11 , exit:
addi r10 , 1
xor r8 , r8
for2:
xor r9 , r9
comp r9 , r8
add r9 , r3
bltz r9 , for:
lw r4 , 2 ( r8 )
lw r5 , 3 ( r8 )
comp r4 , r4
add r4 , r5
bltz r4 , swap:
addi r8 , 1
b for2:
swap: 
lw r6 , 2 ( r8 )
sw r6 , 3 ( r8 )
sw r5 , 2 ( r8 )
addi r8 , 1
b for2:
exit:
return