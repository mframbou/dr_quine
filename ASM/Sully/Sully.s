global main
extern dprintf
extern open
extern close
extern strcmp
extern printf
extern sprintf

section .rodata
  msg: db "global main%1$cextern dprintf%1$cextern open%1$cextern close%1$c%1$csection .rodata%1$c  msg: db %2$c%3$s%2$c, 0%1$c  filename: db %2$cGrace_kid.s%2$c, 0%1$c%1$c; open(file, 578, 420) = open(file, O_CREAT | O_RDWR | O_TRUNC, 0644)%1$c%1$csection .text%1$c%%macro pouet 0%1$c  main:%1$c    push rbp%1$c    mov rdi, filename%1$c    mov rsi, 578%1$c    mov rdx, 420%1$c    call open%1$c    mov rdi, rax%1$c    mov rsi, msg%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, msg%1$c    call dprintf%1$c    call close%1$c    pop rbp%1$c    mov rax, 0%1$c    ret%1$c%1$c%%endmacro%1$c%1$cpouet%1$c", 0
  sully_base_filename: db "Sully.s", 0
  filename_template: db "Sully_%d.s", 0
  cmd_template: db "nasm -f elf64 Sully_%1$d && ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o /usr/lib/x86_64-linux-gnu/crtn.o -lc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && true || ./Sully_%1$d", 0
  current_filename: db __FILE__, 0

section .text

_decrement_number:
  mov rax, [number]
  sub rax, 1
  mov [number], al
  ret

; sets the right number in the variable number (i-1 if needed else i)
set_right_number:
  mov rdi, current_filename
  mov rsi, sully_base_filename
  call strcmp
  cmp rax, 0
  jne _decrement_number
  ret

_exit:
  mov rax, 0
  ret

create_filename:
  mov rdi, out_filename
  mov rsi, filename_template
  movzx rdx, byte [number] ; mov with zero extend (since our int is only 1 byte)
  mov rax, 0
  call sprintf
  ret

create_cmd:
  mov rdi, cmd
  mov rsi, cmd_template
  movzx rdx, byte [number]
  mov rax, 0
  call sprintf
  ret

main:
  cmp byte [number], 0
  jbe _exit

  call set_right_number

  call create_filename
  call create_cmd

  mov rdi, out_filename
  mov rax, 0
  call printf

  mov rdi, cmd
  mov rax, 0
  call printf


  mov rdi, out_filename
  mov rsi, 578
  mov rdx, 420
  call open

  mov rdi, rax
  mov rsi, msg
  mov rdx, 10
  mov rcx, 34
  mov r8, msg
  mov rax, 0
  call dprintf
  call close

  mov rax, 0
  ret

section .data
  ; this is our int
  number: db 5
  ; our arrays (https://stackoverflow.com/questions/29545696/declaring-arrays-in-x86-assembly)
  out_filename: TIMES 50 db 0
  cmd: TIMES 300 db 0
