global main
extern printf

section .rodata
  msg: db "global main%1$cextern printf%1$c%1$csection .rodata%1$c  msg: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c; https://stackoverflow.com/questions/44192287/printf-an-argument-twice , since printf doesnt want to work with multiple args (i tried D:)%1$c_print_quine:%1$c  push rbp%1$c  ; First 6 arguments for printf via RDI, RSI, RDX, RCX, R8, R9. The rest on the stack, mov rax to 0 (number of vector used (eg. floats))%1$c  mov rdi, msg%1$c  mov rsi, 10%1$c  mov rdx, 34%1$c  mov rcx, msg%1$c  mov rax, 0%1$c  call printf%1$c  pop rbp%1$c  ret%1$c%1$cmain:%1$c  call _print_quine%1$c  mov rax, 0%1$c  ret%1$c", 0

section .text
; https://stackoverflow.com/questions/44192287/printf-an-argument-twice , since printf doesnt want to work with multiple args (i tried D:)
_print_quine:
  push rbp
  ; First 6 arguments for printf via RDI, RSI, RDX, RCX, R8, R9. The rest on the stack, mov rax to 0 (number of vector used (eg. floats))
  mov rdi, msg
  mov rsi, 10
  mov rdx, 34
  mov rcx, msg
  mov rax, 0
  call printf
  pop rbp
  ret

main:
  call _print_quine
  mov rax, 0
  ret
