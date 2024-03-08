global main
extern dprintf
extern open
extern close
extern strcmp
extern printf

section .rodata
  msg: db "global main%1$cextern dprintf%1$cextern open%1$cextern close%1$c%1$csection .rodata%1$c  msg: db %2$c%3$s%2$c, 0%1$c  filename: db %2$cGrace_kid.s%2$c, 0%1$c%1$c; open(file, 578, 420) = open(file, O_CREAT | O_RDWR | O_TRUNC, 0644)%1$c%1$csection .text%1$c%%macro pouet 0%1$c  main:%1$c    push rbp%1$c    mov rdi, filename%1$c    mov rsi, 578%1$c    mov rdx, 420%1$c    call open%1$c    mov rdi, rax%1$c    mov rsi, msg%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, msg%1$c    call dprintf%1$c    call close%1$c    pop rbp%1$c    mov rax, 0%1$c    ret%1$c%1$c%%endmacro%1$c%1$cpouet%1$c", 0
  filename: db "Sully.s", 0
  format: db "%d - %s - %s", 10, 0
  current_filename: db __FILE__

section .text

_decrement_number:
  mov rax, [number]
  sub rax, 1
  mov [number], al
  ret

; returns the right i in rax
_get_right_i:
  mov rdi, filename
  mov rsi, current_filename
  call strcmp
  cmp rax, 0
  mov rax, [number]
  jne _decrement_number
  ret

main:
  push rax
  call _get_right_i
  mov rdi, format
  mov rsi, rax
  mov rdx, current_filename
  mov rcx, filename
  call printf
  pop rax
  ret
  ; push rbp
  ; mov rdi, filename
  ; mov rsi, 578
  ; mov rdx, 420
  ; call open
  ; mov rdi, rax
  ; mov rsi, msg
  ; mov rdx, 10
  ; mov rcx, 34
  ; mov r8, msg
  ; call dprintf
  ; call close
  ; pop rbp
  ; mov rax, 0
  ; ret

section .data
; this is our int
  number: db 5