#!/bin/bash

case $1 in
	x86-raspi)
	/home/richard/work/knet/qemu/build/qemu-system-aarch64 \
	  -M virt,highmem=off\
	  -smp 1 \
          -m 2G \
          -cpu cortex-a72 \
	  -kernel poky/build/tmp/deploy/images/raspberrypi4-64/Image \
	  -append "debug console=ttyAMA0" \
	  -initrd tmp/initramfs-hello.cpio.gz \
	  -nographic
  	 ;;



	*)
		echo "Unknown command $1"
	;;
esac
