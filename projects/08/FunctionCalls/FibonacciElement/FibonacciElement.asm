@256
D=A
@SP
M=D
// ====Call====
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
// ARG = SP-5-nArgs
@SP
D=M
@5
D=D-A  // D = SP - 5
@0
D = D - A  // D = SP - 5 - 0
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
// ====push====
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
// ====push const====
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====lt====
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
// ====If====
@SP
M=M-1
A=M
D=M
@Main.fibonacci$IF_TRUE
D;JNE
@Main.fibonacci$IF_FALSE
0;JMP
(Main.fibonacci$IF_TRUE)
// ====push====
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
// ====Return====
@LCL
D=M
@5
AD = D - A
D=M
@R13
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
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
A=M
0;JMP
(Main.fibonacci$IF_FALSE)
// ====push====
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
// ====push const====
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====sub====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M - D
// ====Call====
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
// ARG = SP-5-nArgs
@SP
D=M
@5
D=D-A  // D = SP - 5
@1
D = D - A  // D = SP - 5 - 1
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.1)
// ====push====
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
// ====push const====
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====sub====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M - D
// ====Call====
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
// ARG = SP-5-nArgs
@SP
D=M
@5
D=D-A  // D = SP - 5
@1
D = D - A  // D = SP - 5 - 1
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.2)
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
// ====Return====
@LCL
D=M
@5
AD = D - A
D=M
@R13
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
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
A=M
0;JMP
(Sys.init)
// ====push const====
@4
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====Call====
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
// ARG = SP-5-nArgs
@SP
D=M
@5
D=D-A  // D = SP - 5
@1
D = D - A  // D = SP - 5 - 1
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
