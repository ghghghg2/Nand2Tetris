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
(Sys.init)
// ====push const====
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ====push const====
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THAT
M = D
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
@0
D = D - A  // D = SP - 5 - 0
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@Sys.main
0;JMP
(Sys.init$ret.1)
// ====pop temp====
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
// ====push const====
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ====push const====
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ====push const====
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop====
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
// ====push const====
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop====
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
// ====push const====
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop====
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
// ====push const====
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====Call====
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
@Sys.add12
0;JMP
(Sys.main$ret.2)
// ====pop temp====
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
// ====push====
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
// ====push====
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
// ====push====
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
// ====push====
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
// ====push====
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
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
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
(Sys.add12)
// ====push const====
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ====push const====
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THAT
M = D
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
@12
D = A
@SP
A = M
M = D
@SP
M = M + 1
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
