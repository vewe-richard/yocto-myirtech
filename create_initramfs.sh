CNT_INITRAMFS=${PWD}/initramfs
CNT_BUSYBOX=${PWD}/poky/build/tmp/work/raspberrypi4_64-poky-linux/core-image-minimal/1.0-r0/rootfs/

if [ ! -d "$CNT_BUSYBOX" ]; then
	echo "$CNT_BUSYBOX is not a directory"
	exit -1
fi

rm -rf $CNT_INITRAMFS
mkdir -p $CNT_INITRAMFS/{bin,dev,etc,home,mnt,proc,sys,usr,lib,sbin}	
cp -ar $CNT_BUSYBOX/bin $CNT_INITRAMFS/ >/dev/null 2>&1
cp -ar $CNT_BUSYBOX/sbin $CNT_INITRAMFS/>/dev/null 2>&1
cp -ar $CNT_BUSYBOX/usr $CNT_INITRAMFS/>/dev/null 2>&1
cp -ar $CNT_BUSYBOX/lib $CNT_INITRAMFS/>/dev/null 2>&1
cp init $CNT_INITRAMFS/
cd $CNT_INITRAMFS
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio
gzip -f ../initramfs.cpio
