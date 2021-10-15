FROM ubuntu:latest
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y qemu-system
RUN apt-get install -y nasm
RUN apt-get install --reinstall make

VOLUME /home/ubuntu
WORKDIR /home/ubuntu