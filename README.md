# Extract-Bytecode
#python extract_bytecode.py file_name.txt
Extract bytecode and format shellcode in Linux

Run extract_bytecode.py to extract byte code from output text file

ex1:
nasm -f elf sh1.asm
ld -o sh1 sh1.o
objdump -d sh1 > sh1.txt	#sh1.txt hasn't contain bad char.
#python extract_bytecode.py sh1.txt

ex2:
nasm -f elf sh2.asm
ld -o sh2 sh2.o
objdump -d sh2 > sh2.txt	#sh2.txt has conain 2 bad char \x00.
#python extract_bytecode.py sh2.txt

