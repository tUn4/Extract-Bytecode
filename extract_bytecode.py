#extract_bytecode.py
#Author		: tUn4
#email 		: anhnt121@gmail.com
#Extract bytecode from text file that output of objdump -d

import sys
FIX_LEN = 60
count = 0
chk = 0

def extract(name_file):
    global count
    global chk
    f = open(name_file, "r")
    f1 = f.read()
    if(f1.find("Disassembly of section .text:") != -1):
        chk = 1
        print f1[75:]
    f.close()
    
    f2 = f1.replace("  ", "")
    f2 = f2.split("\t")
    l = len(f2)
    if(l&1):
        l -= 1
    shell = ""
    for i in xrange(1, l, 2):
        f3 = f2[i].rstrip().split(" ")
        for j in xrange(len(f3)):
            if(f3[j] == "00" or f3[j] == "0A" or f3[j] == "0D"):
                count += 1
            shell += "\\x" + f3[j]

    return shell

def format(sh):
    last_sh = ""
    if(not chk):
        print "\n[-]Waring: Invalid text file. Check your text file again."
        return ""
    print "\n[+]Your shellcode after format is:\n"
    if(len(sh) > FIX_LEN):
        for i in xrange(0, len(sh), FIX_LEN):
            last_sh += "\"" + sh[i: i+FIX_LEN] + "\"\n"
    return last_sh


if __name__ == "__main__":
    if(len(sys.argv) < 2):
        print "Vui long nhap tham so thu nhat la ten file.\nUsage: \n\tpython dump_shell <ten_file>.txt\n\nex: \tpython dump_shell shellcode.txt"
        sys.exit(-1)
    print format(extract(sys.argv[1]))
    if(count > 0):
        print "[-]Warning: Dectect {0} common bad char\nShellcode has contain common bad char \\x0A, \\x0D, \\x00. Check shellcode again.!".format(count)


