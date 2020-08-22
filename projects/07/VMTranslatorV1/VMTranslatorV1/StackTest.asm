@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
@17
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
D = M - D
M = 0
@END0
D;JNE
@SP
A = M
A = A - 1
M = -1
(END0)
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
@16
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
D = M - D
M = 0
@END1
D;JNE
@SP
A = M
A = A - 1
M = -1
(END1)
@16
D = A
@SP
A = M
M = D
@SP
M = M + 1
@17
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
D = M - D
M = 0
@END2
D;JNE
@SP
A = M
A = A - 1
M = -1
(END2)
@892
D = A
@SP
A = M
M = D
@SP
M = M + 1
@891
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
D = M - D
M = 0
@END3
D;JGE
@SP
A = M
A = A - 1
M = -1
(END3)
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
@892
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
D = M - D
M = 0
@END4
D;JGE
@SP
A = M
A = A - 1
M = -1
(END4)
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
@891
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
D = M - D
M = 0
@END5
D;JGE
@SP
A = M
A = A - 1
M = -1
(END5)
@32767
D = A
@SP
A = M
M = D
@SP
M = M + 1
@32766
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
D = M - D
M = 0
@END6
D;JLE
@SP
A = M
A = A - 1
M = -1
(END6)
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
@32767
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
D = M - D
M = 0
@END7
D;JLE
@SP
A = M
A = A - 1
M = -1
(END7)
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
@32766
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
D = M - D
M = 0
@END8
D;JLE
@SP
A = M
A = A - 1
M = -1
(END8)
@57
D = A
@SP
A = M
M = D
@SP
M = M + 1
@31
D = A
@SP
A = M
M = D
@SP
M = M + 1
@53
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
@112
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
@SP
A = M - 1
M = -M
@SP
M = M - 1
A = M
D = M
A = A - 1
M = D & M
@82
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
A = A - 1
M = D | M
@SP
A = M - 1
M = !M
