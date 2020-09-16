@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
@0
D = A
@LCL
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
($LOOP_START)
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
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
@0
D = A
@LCL
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
M=M-1
A=M
D=M
@$LOOP_START
D;JNE
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
