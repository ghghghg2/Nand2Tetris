@256
D=A
@SP
M=D
@$ret.0
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=A
@5
D=D-A  // D = SP - 5
@$0
D = D - A  // D = SP - 5 - $0
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Sys.init
0;JMP
($ret.0)
(Main.fibonacci)
@0 // replace by input i
D = A
@ARG // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M-1
A = M
D = M
A = A - 1
D = M - D
M = 0
@Main.fibonacci$END0
D;JGE
@SP
A = M
A = A - 1
M = -1
(Main.fibonacci$END0)
@SP
A=M-1
D=M+1
@Main.fibonacci$IF_TRUE
D;JEQ
@Main.fibonacci$IF_FALSE
0;JMP
(Main.fibonacci$IF_TRUE)
@0 // replace by input i
D = A
@ARG // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
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
(Main.fibonacci$IF_FALSE)
@0 // replace by input i
D = A
@ARG // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M-1
A = M
D = M
A = A - 1
M = M - D
@Main.fibonacci$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=A
@5
D=D-A  // D = SP - 5
@$1
D = D - A  // D = SP - 5 - $1
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.1)
@0 // replace by input i
D = A
@ARG // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M-1
A = M
D = M
A = A - 1
M = M - D
@Main.fibonacci$ret.2
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=A
@5
D=D-A  // D = SP - 5
@$1
D = D - A  // D = SP - 5 - $1
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.2)
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
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
(Sys.init)
@4
D = A
@SP
A = M
M = D
@SP
M = M + 1
@Sys.init$ret.1
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=A
@5
D=D-A  // D = SP - 5
@$1
D = D - A  // D = SP - 5 - $1
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Main.fibonacci
0;JMP
(Sys.init$ret.1)
(Sys.init$WHILE)
@Sys.init$WHILE
0;JMP
