#
# @author:Luka
# lw.s
#
# Test for load word (lw)
.globl _start

_start:
addi x1,x0,128		 # address 0x80

addi x2,x0,1         # x2 = 0x01
addi x3,x0,2         # x3 = 0x02
addi x4,x0,3         # x4 = 0x03
addi x5,x0,4         # x5 = 0x04
sb   x2,0(x1)
sb   x3,1(x1)
sb   x4,2(x1)
sb   x5,3(x1)

# mem [0x80..83] = 0x01020304

addi x6,x0,255  	 # x6 = 0xFF
addi x7,x0,254		 # x7 = 0xFE
addi x8,x0,253		 # x8 = 0xFD
addi x9,x0,252		 # x9 = 0xFC
sb   x6,4(x1)
sb   x7,5(x1)
sb   x8,6(x1)
sb   x9,7(x1)

# mem [0x84..87] = 0xFFFEFDFC

lw   x31,0(x1)     	 # x31 = 0x04030201
lw   x30,4(x1)        # x30 = 0xFCFDFEFF
lw   x29,2(x1)        # x29 = 0xFEFF0403

nop		# end of ID stage of the last instruction
nop		# end of EX stage of the last instruction
nop		# end of MEM stage of the last instruction
nop		# end of WB stage of the last instruction

# call exit (SYS_EXIT=93) with exit code 0 (argument in a0)
li a7,93
li a0,0
ecall
