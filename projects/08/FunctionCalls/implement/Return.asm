@LCL
D=A
@5
D=D-A
A=D
D=M // D=*(LCL-5)
@R13
M=D // M[R13]=*(LCL-5)
@SP
A=M-1
D=M
@ARG
M=D // M[ARG] = pop()
D=A+1 
@SP
M=D // SP = ARG+1
@LCL
A=M-1
D=M
@THAT
M=D
@2
D=A
@LCL
A=M-D
D=M
@THIS
M=D
@3
D=A
@LCL
A=M-D
D=M
@ARG
M=D
@4
D=A
@LCL
A=M-D
D=M
@LCL
M=D
@R13
0;JMP
