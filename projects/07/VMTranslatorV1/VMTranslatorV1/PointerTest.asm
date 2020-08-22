@3030
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
@THIS
M = D
@3040
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
@THAT
M = D
@32
D = A
@SP
A = M
M = D
@SP
M = M + 1
@2
D = A
@THIS
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@46
D = A
@SP
A = M
M = D
@SP
M = M + 1
@6
D = A
@THAT
D = M + D
@SP
M = M - 1
A = M
D = D + M
A = D - M
M = D - A
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
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
@2 // replace by input i
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
M = M - D
@6 // replace by input i
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
