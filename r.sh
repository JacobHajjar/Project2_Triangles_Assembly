#  Author information
#  Author name: Jacob Hajjar
#  CPSC240-1
#  Author email: hajjarj@csu.fullerton.edu
#  Program name: Right Triangle Calculator
rm *.o
rm *.out
nasm -f elf64 -l triangle.lis -o triangle.o triangle.asm

gcc -c -Wall -m64 -no-pie -o pythagoras.o pythagoras.c -std=c17

gcc -m64 -no-pie -o a.out -std=c11 pythagoras.o triangle.o

./a.out