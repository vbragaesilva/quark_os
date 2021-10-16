files := $(shell find src -name *.asm)  # LIST all .asm files
object := $(patsubst src/%.asm, src/boot/%.bin, $(files)) # Make a list of the output files

$(object): src/boot/%.bin : src/%.asm # Make sure there is a src/boot folder and output the bit files there
	mkdir -p $(dir $@) && \
	nasm -f bin $(patsubst src/boot/%.bin, src/%.asm, $@) -o $@ 
.PHONY: compile
compile: $(object)
	@echo COMPILED!

.PHONY: build_ubuntu
build_ubuntu:
	@docker build compiler-ubuntu -t ubuntu

.PHONY: qemu
qemu: 
	@echo "Running qemu..."
	@qemu-system-x86_64 -fda src/boot/boot.bin -nographic

.PHONY: ubuntu
ubuntu:
	@echo Initializing...
	@docker run --rm -it -v $$(pwd):/home/ubuntu ubuntu
	




