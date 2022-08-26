#!/bin/bash

case $1 in
	x86-raspi)
	qemu-system-aarch64 \
	  -M virt,highmem=off\
	  -smp 1 \
          -m 2G \
	  -cpu cortex-a53 \
	  -kernel poky/build/tmp/deploy/images/raspberrypi4-64/Image \
	  -append "debug console=ttyAMA0" \
	  -initrd initramfs.cpio.gz \
	  -nographic

          #-cpu cortex-a7 \
  	 ;;



	*)
		echo "Unknown command $1"
	;;
esac
