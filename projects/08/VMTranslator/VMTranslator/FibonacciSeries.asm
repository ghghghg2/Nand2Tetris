@1 // replace by input i
D = A
@ARG // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
M = M - 1
A = M
D = M
@THAT
M = D
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
@0
D = A
@THAT
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
@1
D = A
@THAT
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
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
@0
D = A
@ARG
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
($MAIN_LOOP_START)
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
@SP
A=M-1
D=M+1
@$COMPUTE_ELEMENT
D;JEQ
@$END_PROGRAM
0;JMP
($COMPUTE_ELEMENT)
@0 // replace by input i
D = A
@THAT // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@1 // replace by input i
D = A
@THAT // replace by LCL, ARG, THIS, THAT
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
@2
D = A
@THAT
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@THAT
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
M = M + D
@SP
M = M - 1
A = M
D = M
@THAT
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
@0
D = A
@ARG
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@$MAIN_LOOP_START
0;JMP
($END_PROGRAM)
