@$currentFunction$ret.$countCall
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
@$nArgs
D = D - A  // D = SP - 5 - $nArgs
@ARG
M=D
@SP
D=M
@LCL
M=D  //LCL = SP
@$functionName
0;JMP
($currentFunction$ret.$countCall)
