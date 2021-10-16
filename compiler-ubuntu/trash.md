REMOVED FROM MAKEFILE
.PHONY: compile_test
compile_test: 
	@echo "Test compiled!" 
	@nasm -f elf32 test/test.asm -o test/obj/test.o
	@ld -m elf_i386 test/obj/test.o -o test/bin/test

REMOVED FROM DOCKERFILE
RUN apt-get install -y binutils