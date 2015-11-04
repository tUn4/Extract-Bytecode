# ExtractShellcode
Extract bytecode and format shellcode in Linux

#NOTE 1: source file .asm MUST BE Intel syntax

[+]Build object file: 
	nasm -f elf <ten_file>.asm
	ex: nasm -f elf shellcode.asm

[+] Link object sang executable file
	ld -o <ten_file executable> <ten_file>.o
	ex: ld -o shellcode shellcode.o

[+] Disassemble de lay duoc byte code
	objdump -d <ten_file executable>
	ex: objdump -d sh1

[+] Disassemble lay bytecode va luu output vao file de tach duoc bytecode
	objdump -d <ten_file executable> > <out_put text>
	ex: objdump -d sh1 > a.txt

Run dump_shell.py to extract byte code from output text file
ex1:
nasm -f elf sh1.asm
ld -o sh1 sh1.o
objdump -d sh1 > sh1.txt	#sh1.txt hasn't contain bad char.
python dump_shell.py sh1.txt

ex2:
nasm -f elf sh2.asm
ld -o sh2 sh2.o

objdump -d sh2 > sh2.txt	#sh2.txt has conain 2 bad char \x00.

python dump_shell.py sh2.txt

