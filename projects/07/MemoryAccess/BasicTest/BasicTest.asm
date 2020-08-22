@10
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
@21
D = A
@SP
A = M
M = D
@SP
M = M + 1
@22
D = A
@SP
A = M
M = D
@SP
M = M + 1
@2
D = A
@ARG
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@1
D = A
@ARG
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@36
D = A
@SP
A = M
M = D
@SP
M = M + 1
@6
D = A
@THIS
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@42
D = A
@SP
A = M
M = D
@SP
M = M + 1
@45
D = A
@SP
A = M
M = D
@SP
M = M + 1
@5
D = A
@THAT
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
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
@510
D = A
@SP
A = M
M = D
@SP
M = M + 1
@6
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
@5 // replace by input i
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
M = M-1
A = M
D = M
A = A - 1
M = M - D
@6 // replace by input i
D = A
@THIS // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
@6 // replace by input i
D = A
@THIS // replace by LCL, ARG, THIS, THAT
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
M = M - D
@6
D = A
@5
D = A + D
A = D
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
