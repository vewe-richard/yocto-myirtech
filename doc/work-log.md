# DAY 1

1. target
   a. build image for qemu, add recipe
   b. build image for imx vm, rasp? in qemu, add recipe
   c. analysis customers requirements

2. Learning log
- guide
follow
https://a4z.gitlab.io/docs/BitBake/guide.html

#DAY 2 building image and add recipe

Problem: Can not mount root drive
  - Analysis: Package rootfs as initrd, enter and check, like built in filesystems 
    * Problem: Do not enter initramfs
      Analysis:
        Debug inside the kernel
          How to build kernel: 
            https://www.yoctoproject.org/docs/1.6.1/kernel-dev/kernel-dev.html
	    Source code location: build/tmp/work-shared/raspberrypi4-64/kernel-source$
            Compile command: bitbake -vDDD linux-raspberrypi -c compile -f
            Deploy command: bitbake linux-raspberrypi -c deploy
          Fix: add customized init script (or repack?), enter initramfs terminal
    * Problem: can not find disk (/proc/partition, /sys/bus/pci/devices)
	Debug: Enable virtio_blk
            bitbake linux-raspberrypi -c menuconfig
	Comment: Also need enable pci bus, so ... use initramfs or another kernel with this rootfs.

Task 1: add a simple recipe
  Follow: https://tutorialadda.com/yocto/create-a-new-meta-layer-and-write-new-recipe-in-yocto-project
  Commands: 
        bitbake-layers create-layer ../meta-tutorial
        bitbake-layers add-layer ../meta-tutorial
        # edit a helloworld c program
	bitbake core-image-minimal
	# test in qemu
  Result: It works without any problem, though still not clear about how it interacts with cross compiling tools
  
Task 2: customize busybox
  For example, add printenv
  Commands: bitbake -c menuconfig busybox
            bitbake busybox
            bitbake core-image-minimal
  Result: test ok
            

Task 3: add an opensource package
  Case 1. Add a package which has receipe file inside one meta layer, for example xz_5.2.4
    Commands: bitbake-layers show-layers # list layers
              # find xz in /meta/recipes-extended/xz/
              bitbake -v xz -c compile -f
              bitbake -v xz -c install -f (??? needed?}
              bitbake core-image-minimal
              ... not installed
    Problem: xz is not installed to rootfs
              Add below line to build/conf/local.conf
              IMAGE_INSTALL_append = " xz"
              bitbake core-image-minimal
    Result: test OK
  Case 2. Add a new package
    Follow: https://www.yoctoproject.org/docs/1.6.1/dev-manual/dev-manual.html#new-recipe-writing-a-new-recipe    
    TODO ...

