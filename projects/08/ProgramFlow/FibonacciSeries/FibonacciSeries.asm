// ====push====
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
// ====pop pointer====
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ====push const====
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop====
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
// ====push const====
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ====pop====
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
// ====pop====
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
// ====If====
@SP
M=M-1
A=M
D=M
@$COMPUTE_ELEMENT
D;JNE
@$END_PROGRAM
0;JMP
($COMPUTE_ELEMENT)
// ====push====
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
// ====push====
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
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
// ====pop====
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
// ====push pointer====
@THAT
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
// ====add====
@SP
M = M-1
A = M
D = M
A = A - 1
M = M + D
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
// ====pop====
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
