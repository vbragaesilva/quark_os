# Quark

## Quick Start

<br><br>

### Building the container
---

\
This command will build the container with the essential tools we need:
```
/workspace$ docker build compiler-ubuntu -t ubuntu 
```  
`compiler-ubuntu` : Location of the Dockfile \
`-t ubuntu` : custom image name 

<br><br>

### Runnung the container
---
After building our container, we can run it using: 
```
/workspace$ docker run --rm -it -v $(pwd):/home/ubuntu ubuntu
```
Run interactivelly `-it` . \
The current directory is shared with the the container work directory `-v $(pwd):/home/ubuntu`. \
Name of our image `ubuntu`. \
The container will automatically stop ater exiting `--rm` \
Use `exit` to exit the container.

We can make this step simpler using the Makefile:
```
/workspace$ make ubuntu
```

<br><br>

### Compile the asm files
---
All the `*.asm` files in `src` will automatically be compiled to `src/boot/*.bin` using:
```
/home/ubuntu$ make compile
```
But they can be compiled manually by using:
```
/home/ubuntu$ nasm -f bin src/<name>.asm -o src/boot/<name>.bin
```

<br><br>

### Simulating the OS using QEmu
---
After everything is compiled, we can simulete the OS. To do this, use:  
```
/home/ubuntu$ qemu-system-x86_64 -fda src/boot/boot.bin -nographic
```
Or use the cleaner version:
```
/home/ubuntu$ make qemu
```
Qemu will look for `boot.bin` in the folder `src/boot`.

Now, our Operating System is ready!
