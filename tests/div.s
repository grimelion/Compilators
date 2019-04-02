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
  mov rsi, 0
  mov rdx, 100
  call test
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [x_Global], rax
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
test:
  push rbp
  mov rbp, rsp
  sub rsp, 24
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
  call input
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -8], rax
  mov qword [rbp + -24], 10
  mov rax, qword [rbp + -24]
  mov r10, rdx
  mov rdx, 0
  mov rax, rax
  idiv qword [rbp + -8]
  mov rax, rax
  mov rdx, r10
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
  mov rdi, rdx
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov rax, qword [rbp + -16]
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
x_Global: resq 1
