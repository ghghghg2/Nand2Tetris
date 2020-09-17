// ====push====
@$i // replace by input i
D = A
@$seg // replace by LCL, ARG, THIS, THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1