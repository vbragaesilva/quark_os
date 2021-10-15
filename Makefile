files := $(shell find src -name *.asm)
object := $(patsubst src/%.asm, src/boot/%.bin, $(files))

$(object): src/boot/%.bin : src/%.asm
	mkdir -p $(dir $@) && \
	nasm -f bin $(patsubst src/boot/%.bin, src/%.asm, $@) -o $@
.PHONY: compile

compile: $(object)
	echo DONE!


.PHONY: qemu
qemu: 
	qemu-system-x86_64 -fda src/boot/boot.bin -nographic

.PHONY: ubuntu
ubuntu:
	docker run --rm -it -v $$(pwd):/home/ubuntu ubuntu
	
