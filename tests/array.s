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
  call test1
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [r1_Global], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 0
  call test2
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [r2_Global], rax
  mov qword [g_Global], 2
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 4
  mov rsi, 4
  call allocate2
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [a_Global], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 0
  call fill
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [f_Global], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [a_Global]
  call test3
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [b_Global], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, 0
  call test4
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [c_Global], rax
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
fill:
  push rbp
  mov rbp, rsp
  sub rsp, 40
  push rbx
  push r12
  push r13
  push r14
  push r15
.block0:
  mov qword [rbp + -8], 0
.block1:
  cmp qword [rbp + -8], 4
  jl .block2
.block6:
  mov rax, rdi
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  mov qword [rbp + -16], 0
.block3:
  cmp qword [rbp + -16], 4
  jl .block4
.block5:
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -8], rax
  jmp .block1
.block4:
  cmp qword [a_Global], 0
  je null_error
  mov r10, qword [a_Global]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -24], rax
  cmp qword [rbp + -8], 0
  jl bound_error
  mov rax, qword [rbp + -24]
  cmp qword [rbp + -8], rax
  jnl bound_error
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -24], rax
  mov rax, qword [rbp + -24]
  shl rax, 3
  mov qword [rbp + -24], rax
  mov r10, qword [a_Global]
  add r10, qword [rbp + -24]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -40], rax
  mov rax, qword [rbp + -8]
  add rax, qword [rbp + -16]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -40], 0
  je null_error
  mov r10, qword [rbp + -40]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -24], rax
  cmp qword [rbp + -16], 0
  jl bound_error
  mov rax, qword [rbp + -24]
  cmp qword [rbp + -16], rax
  jnl bound_error
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -24], rax
  mov rax, qword [rbp + -24]
  shl rax, 3
  mov qword [rbp + -24], rax
  mov r10, qword [rbp + -40]
  add r10, qword [rbp + -24]
  mov rax, qword [rbp + -32]
  mov qword [r10 + 0], rax
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -16], rax
  jmp .block3
test1:
  push rbp
  mov rbp, rsp
  sub rsp, 40
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
  mov rdi, 10
  call allocate1
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -24], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -8]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
.block1:
  cmp qword [rbp + -8], 10
  jl .block2
.block3:
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -8]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  cmp qword [rbp + -24], 0
  je null_error
  mov r10, qword [rbp + -24]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -32], 0
  jng bound_error
  mov r10, qword [rbp + -24]
  mov rax, qword [r10 + 8]
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
  cmp qword [rbp + -24], 0
  je null_error
  mov r10, qword [rbp + -24]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -32], 9
  jng bound_error
  mov r10, qword [rbp + -24]
  mov rax, qword [r10 + 80]
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
  mov rax, qword [rbp + -16]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  cmp qword [rbp + -24], 0
  je null_error
  mov r10, qword [rbp + -24]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -8], 0
  jl bound_error
  mov rax, qword [rbp + -32]
  cmp qword [rbp + -8], rax
  jnl bound_error
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -32], rax
  mov rax, qword [rbp + -32]
  shl rax, 3
  mov qword [rbp + -32], rax
  mov r10, qword [rbp + -24]
  add r10, qword [rbp + -32]
  mov rax, qword [rbp + -8]
  mov qword [r10 + 0], rax
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -8], rax
  jmp .block1
test2:
  push rbp
  mov rbp, rsp
  sub rsp, 120
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
  mov rdi, 3
  mov rsi, 5
  mov rdx, 7
  call allocate3
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -48], rax
  mov qword [rbp + -8], 0
  mov qword [rbp + -16], 0
.block1:
  cmp qword [rbp + -16], 3
  jl .block2
.block9:
  cmp qword [rbp + -48], 0
  je null_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 0
  jng bound_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 8]
  mov qword [rbp + -80], rax
  cmp qword [rbp + -80], 0
  je null_error
  mov r10, qword [rbp + -80]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 0
  jng bound_error
  mov r10, qword [rbp + -80]
  mov rax, qword [r10 + 8]
  mov qword [rbp + -88], rax
  cmp qword [rbp + -88], 0
  je null_error
  mov r10, qword [rbp + -88]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 0
  jng bound_error
  mov r10, qword [rbp + -88]
  mov rax, qword [r10 + 8]
  mov qword [rbp + -40], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -40]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  cmp qword [rbp + -48], 0
  je null_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 1
  jng bound_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 16]
  mov qword [rbp + -96], rax
  cmp qword [rbp + -96], 0
  je null_error
  mov r10, qword [rbp + -96]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 3
  jng bound_error
  mov r10, qword [rbp + -96]
  mov rax, qword [r10 + 32]
  mov qword [rbp + -104], rax
  cmp qword [rbp + -104], 0
  je null_error
  mov r10, qword [rbp + -104]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 4
  jng bound_error
  mov r10, qword [rbp + -104]
  mov rax, qword [r10 + 40]
  mov qword [rbp + -40], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -40]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  cmp qword [rbp + -48], 0
  je null_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 2
  jng bound_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 24]
  mov qword [rbp + -112], rax
  cmp qword [rbp + -112], 0
  je null_error
  mov r10, qword [rbp + -112]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 4
  jng bound_error
  mov r10, qword [rbp + -112]
  mov rax, qword [r10 + 40]
  mov qword [rbp + -120], rax
  cmp qword [rbp + -120], 0
  je null_error
  mov r10, qword [rbp + -120]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -56], 6
  jng bound_error
  mov r10, qword [rbp + -120]
  mov rax, qword [r10 + 56]
  mov qword [rbp + -40], rax
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  mov rdi, qword [rbp + -40]
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov rax, qword [rbp + -40]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  mov qword [rbp + -24], 0
.block3:
  cmp qword [rbp + -24], 5
  jl .block4
.block8:
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -16], rax
  jmp .block1
.block4:
  mov qword [rbp + -32], 0
.block5:
  cmp qword [rbp + -32], 7
  jl .block6
.block7:
  mov rax, qword [rbp + -24]
  add rax, 1
  mov qword [rbp + -24], rax
  jmp .block3
.block6:
  cmp qword [rbp + -48], 0
  je null_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -16], 0
  jl bound_error
  mov rax, qword [rbp + -56]
  cmp qword [rbp + -16], rax
  jnl bound_error
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -56], rax
  mov rax, qword [rbp + -56]
  shl rax, 3
  mov qword [rbp + -56], rax
  mov r10, qword [rbp + -48]
  add r10, qword [rbp + -56]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -64], rax
  cmp qword [rbp + -64], 0
  je null_error
  mov r10, qword [rbp + -64]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -24], 0
  jl bound_error
  mov rax, qword [rbp + -56]
  cmp qword [rbp + -24], rax
  jnl bound_error
  mov rax, qword [rbp + -24]
  add rax, 1
  mov qword [rbp + -56], rax
  mov rax, qword [rbp + -56]
  shl rax, 3
  mov qword [rbp + -56], rax
  mov r10, qword [rbp + -64]
  add r10, qword [rbp + -56]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -72], rax
  cmp qword [rbp + -72], 0
  je null_error
  mov r10, qword [rbp + -72]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  cmp qword [rbp + -32], 0
  jl bound_error
  mov rax, qword [rbp + -56]
  cmp qword [rbp + -32], rax
  jnl bound_error
  mov rax, qword [rbp + -32]
  add rax, 1
  mov qword [rbp + -56], rax
  mov rax, qword [rbp + -56]
  shl rax, 3
  mov qword [rbp + -56], rax
  mov r10, qword [rbp + -72]
  add r10, qword [rbp + -56]
  mov rax, qword [rbp + -8]
  mov qword [r10 + 0], rax
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -8], rax
  mov rax, qword [rbp + -32]
  add rax, 1
  mov qword [rbp + -32], rax
  jmp .block5
test3:
  push rbp
  mov rbp, rsp
  sub rsp, 72
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
  mov rdi, 4
  call allocate1
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov qword [rbp + -8], rax
  mov qword [rbp + -16], 0
.block1:
  cmp qword [rbp + -16], 4
  jl .block2
.block6:
  mov rax, qword [rbp + -8]
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  mov qword [rbp + -24], 0
.block3:
  cmp qword [rbp + -24], 4
  jl .block4
.block5:
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -16], rax
  jmp .block1
.block4:
  cmp qword [rbp + -8], 0
  je null_error
  mov r10, qword [rbp + -8]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -16], 0
  jl bound_error
  mov rax, qword [rbp + -32]
  cmp qword [rbp + -16], rax
  jnl bound_error
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -32], rax
  mov rax, qword [rbp + -32]
  shl rax, 3
  mov qword [rbp + -32], rax
  mov r10, qword [rbp + -8]
  add r10, qword [rbp + -32]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -40], rax
  cmp rdi, 0
  je null_error
  mov rax, qword [rdi + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -16], 0
  jl bound_error
  mov rax, qword [rbp + -32]
  cmp qword [rbp + -16], rax
  jnl bound_error
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -32], rax
  mov rax, qword [rbp + -32]
  shl rax, 3
  mov qword [rbp + -32], rax
  mov r10, qword [rbp + -32]
  mov rax, qword [rdi * 1 + r10 + 0]
  mov qword [rbp + -48], rax
  cmp qword [rbp + -48], 0
  je null_error
  mov r10, qword [rbp + -48]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -24], 0
  jl bound_error
  mov rax, qword [rbp + -32]
  cmp qword [rbp + -24], rax
  jnl bound_error
  mov rax, qword [rbp + -24]
  add rax, 1
  mov qword [rbp + -32], rax
  mov rax, qword [rbp + -32]
  shl rax, 3
  mov qword [rbp + -32], rax
  mov r10, qword [rbp + -48]
  add r10, qword [rbp + -32]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -56], rax
  mov rax, qword [rbp + -40]
  add rax, qword [rbp + -56]
  mov qword [rbp + -64], rax
  cmp qword [rbp + -8], 0
  je null_error
  mov r10, qword [rbp + -8]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -32], rax
  cmp qword [rbp + -16], 0
  jl bound_error
  mov rax, qword [rbp + -32]
  cmp qword [rbp + -16], rax
  jnl bound_error
  mov rax, qword [rbp + -16]
  add rax, 1
  mov qword [rbp + -32], rax
  mov rax, qword [rbp + -32]
  shl rax, 3
  mov qword [rbp + -32], rax
  mov r10, qword [rbp + -8]
  add r10, qword [rbp + -32]
  mov rax, qword [rbp + -64]
  mov qword [r10 + 0], rax
  mov rax, qword [rbp + -24]
  add rax, 1
  mov qword [rbp + -24], rax
  jmp .block3
test4:
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
.block1:
  cmp qword [rbp + -8], 4
  jl .block2
.block3:
  cmp qword [b_Global], 0
  je null_error
  mov r10, qword [b_Global]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -16], rax
  cmp qword [g_Global], 0
  jl bound_error
  mov rax, qword [rbp + -16]
  cmp qword [g_Global], rax
  jnl bound_error
  mov rax, qword [g_Global]
  add rax, 1
  mov qword [rbp + -16], rax
  mov rax, qword [rbp + -16]
  shl rax, 3
  mov qword [rbp + -16], rax
  mov r10, qword [b_Global]
  add r10, qword [rbp + -16]
  mov rdi, qword [r10 + 0]
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
  call output
  pop r11
  pop r10
  pop r9
  pop r8
  pop rdi
  pop rsi
  pop rdx
  pop rcx
  mov rax, rdi
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
  leave
  ret
.block2:
  cmp qword [b_Global], 0
  je null_error
  mov r10, qword [b_Global]
  mov rax, qword [r10 + 0]
  mov qword [rbp + -16], rax
  cmp qword [rbp + -8], 0
  jl bound_error
  mov rax, qword [rbp + -16]
  cmp qword [rbp + -8], rax
  jnl bound_error
  mov rax, qword [rbp + -8]
  add rax, 1
  mov qword [rbp + -16], rax
  mov rax, qword [rbp + -16]
  shl rax, 3
  mov qword [rbp + -16], rax
  mov r10, qword [b_Global]
  add r10, qword [rbp + -16]
  mov rdi, qword [r10 + 0]
  push rcx
  push rdx
  push rsi
  push rdi
  push r8
  push r9
  push r10
  push r11
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
  add rax, 1
  mov qword [rbp + -8], rax
  jmp .block1
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
r1_Global: resq 1
r2_Global: resq 1
g_Global: resq 1
a_Global: resq 1
f_Global: resq 1
b_Global: resq 1
c_Global: resq 1
