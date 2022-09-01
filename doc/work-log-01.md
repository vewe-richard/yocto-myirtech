# best tutorial
https://a4z.gitlab.io/docs/BitBake/guide.html

an easy tutorial
https://www.wolfssl.com/docs/yocto-openembedded-recipe-guide/

- bitbake -ccleanstate hello
  bitbake hello

python do_display_banner() {
   bb.plain("txt", d.getVar('WORKDIR', True) );
}

addtask display_banner before do_build

FILES_${PN}

#2 
./create_initramfs.sh
./qemu.sh x86-raspi

#3 
bitbake core-image-minimal


#4 x11vnc
bblayers.conf
  /home/richard/work/2022/yocto/poky/meta-openembedded/meta-oe \
bitbake vncx11

usermanual
https://docs.yoctoproject.org/2.0/ref-manual/ref-manual.html#ref-manual-intro


after change distro layer: 
https://docs.yoctoproject.org/2.0/ref-manual/ref-manual.html#distro-layer
meta-poky/conf/distro/poky.conf

DISTRO_FEATURES_remove = "x11"
DISTRO_FEATURES_append = " fbdev"

bitbake core-image-minimal  #make it setting

bitbake -e x11vnc > /tmp/log  => check DISTRO_FEATURES


bitbake -ccleansstate x11vnc
bitbake -vDDD x11vnc

check ./configure

https://a4z.gitlab.io/docs/BitBake/guide.html#_about_this_tutorial
