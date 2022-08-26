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


