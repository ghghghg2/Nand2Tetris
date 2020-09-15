(Sys.init)
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
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
@$0
D = D - A  // D = SP - 5 - $0
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Sys.main
0;JMP
(Sys.init$ret.1)
@1
D = A
@5
D = A + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
(Sys.init$LOOP)
@Sys.init$LOOP
0;JMP
(Sys.main)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1
@1
D = A
@LCL
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1
@2
D = A
@LCL
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1
@3
D = A
@LCL
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1
@Sys.main$ret.2
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
@Sys.add12
0;JMP
(Sys.main$ret.2)
@0
D = A
@5
D = A + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@0 // replace by input i
D = A
@LCL // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@1 // replace by input i
D = A
@LCL // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@2 // replace by input i
D = A
@LCL // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@3 // replace by input i
D = A
@LCL // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@4 // replace by input i
D = A
@LCL // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
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
M = M + D
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
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
(Sys.add12)
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@$s
M = D
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
@12
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
