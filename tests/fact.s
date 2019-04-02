[section .text align=16]
global main

extern signal_error
extern input
extern output
extern allocate1
extern allocate2
extern allocate3
extern allocate4
extern allocate5
extern allocate6
extern allocate7

main:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  push rbx
  push r12
  push r13
  push r14
  push r15
.block0:
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 0
  call exec
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [v_Global], rax
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
iter_fact:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  push rbx
  push r12
  push r13
  push r14
  push r15
.block0:
  mov qword [rbp + -8], 1
.block1:
  cmp rdi, 0
  jg .block2
.block3:
  mov rax, qword [rbp + -8]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  mov rax, qword [rbp + -8]
  imul rax, rdi
  mov qword [rbp + -8], rax
  mov rdi, rdi
  sub rdi, 1
  jmp .block1
rec_fact:
  push rbp
  mov rbp, rsp
  sub rsp, 24
  push rbx
  push r12
  push r13
  push r14
  push r15
.block0:
  mov qword [rbp + -8], 1
  cmp rdi, 0
  je .block1
.block2:
  mov rax, rdi
  sub rax, 1
  mov qword [rbp + -16], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -16]
  call rec_fact
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -24], rax
  mov rax, rdi
  imul rax, qword [rbp + -24]
  mov qword [rbp + -8], rax
  mov rax, qword [rbp + -8]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block1:
  mov rax, qword [rbp + -8]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
exec:
  push rbp
  mov rbp, rsp
  sub rsp, 24
  push rbx
  push r12
  push r13
  push r14
  push r15
.block0:
  mov qword [rbp + -8], 0
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  call input
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov rdi, rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  call iter_fact
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -16], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -16]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  call rec_fact
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -16], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -16]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov rax, qword [rbp + -8]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
bound_error:
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 0
  call signal_error
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
null_error:
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 1
  call signal_error
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
[section .bss align=16]
default rel
v_Global: resq 1
