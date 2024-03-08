global main
extern dprintf
extern open
extern close

section .rodata
  msg: db "global main%1$cextern dprintf%1$cextern open%1$cextern close%1$c%1$csection .rodata%1$c  msg: db %2$c%3$s%2$c, 0%1$c  filename: db %2$cGrace_kid.s%2$c, 0%1$c%1$c; open(file, 578, 420) = open(file, O_CREAT | O_RDWR | O_TRUNC, 0644)%1$c%1$csection .text%1$c%%macro pouet 0%1$c  main:%1$c    push rbp%1$c    mov rdi, filename%1$c    mov rsi, 578%1$c    mov rdx, 420%1$c    call open%1$c    mov rdi, rax%1$c    mov rsi, msg%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, msg%1$c    call dprintf%1$c    call close%1$c    pop rbp%1$c    mov rax, 0%1$c    ret%1$c%1$c%%endmacro%1$c%1$cpouet%1$c", 0
  filename: db "Grace_kid.s", 0

; open(file, 578, 420) = open(file, O_CREAT | O_RDWR | O_TRUNC, 0644)

section .text
%macro pouet 0
  main:
    push rbp
    mov rdi, filename
    mov rsi, 578
    mov rdx, 420
    call open
    mov rdi, rax
    mov rsi, msg
    mov rdx, 10
    mov rcx, 34
    mov r8, msg
    call dprintf
    call close
    pop rbp
    mov rax, 0
    ret

%endmacro

pouet
