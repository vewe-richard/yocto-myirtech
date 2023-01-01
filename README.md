

### 1. create container for yocto working environment
Here create a container for yocto, refer
https://tutorialadda.com/yocto/quick-start-your-first-yocto-project-build

cd /home/richard/work/2022/yocto/poky
source oe-init-build-env
bitbake core-image-minimal


#in fact we did not use docker, just use ~/work/2022/yocto/poky
```
./docker.sh build    #xxx
./docker.sh create   #xxx
# enter container
./docker.sh          #xxx
```

### 2. build machine
#### 2.1 build a qemu-x86 machine
FAIL
#### 2.2 build raspiberrypi
Done
https://tutorialadda.com/yocto/create-your-own-linux-image-for-the-raspberry-pi-board-using-yocto-project
Note: there are lots of type error on this blog, be carefull

Follow doc/work-log.md


### Appendix
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>    Following is the list of potential problems / advisories:
>
>    Your system needs to support the en_US.UTF-8 locale.
Refer,
https://askubuntu.com/questions/162391/how-do-i-fix-my-locale-issue
select 159  3

> configure: error: I can't find the libraries for the thread implementation        
>                  posix. Please choose another thread implementation or        
>                   provide information on your thread implementation.  
> configure: error: ../../git/glib/configure failed for glib                             
> NOTE: The following config.log files may provide further information.                              
> NOTE: /home/richard/share/poky/build/tmp/work/x86_64-linux/pkgconfig-native/0.29.2+gitAUTOINC+d97db
> 4fae4-r0/build/glib/config.log /home/richard/share/poky/build/tmp/work/x86_64-linux/pkgconfig-native/0.29.2+gitAUTOINC+d97db4fae4-r0/build/config.log 
> ERROR: Task (virtual:native:/home/richard/share/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_configure) failed with exit code '1' 
fix steps:
> gcc: error: unrecognized command line option '-pthreads'; did you mean '-pthread'?
  ../../git/glib/configure
richard@dd946d25d2ed:~/share/poky$ find -name "configure" | grep git.glib
./build/tmp/work/x86_64-linux/pkgconfig-native/0.29.2+gitAUTOINC+d97db4fae4-r0/git/glib/configure
/home/richard/share/poky/meta/recipes-devtools/pkgconfig/


> ERROR: Variable IMAGE_INSTALL_append file: /home/richard/share/poky/build/conf/local.conf line: 277 contains an operation using the old override syntax. Please convert this layer/metadata before attempt
ing to use with a newer bitbake.

> ERROR: Nothing PROVIDES 'core-minimal-image'. Close matches: core-image-minimal-dev

> ERROR: bootfiles-20210527-r3 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"; export SSH_AGENT_PID="3489"; export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"; export PATH="/home/richard/work/2022/yocto/poky/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/richard/work/2022/yocto/poky/scripts:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot/usr/bin/crossscripts:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot-native/usr/sbin:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot-native/usr/bin:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot-native/sbin:/home/richard/work/2022/yocto/poky/build/tmp/work/raspberrypi4_64-poky-linux/bootfiles/20210527-r3/recipe-sysroot-native/bin:/home/richard/work/2022/yocto/poky/bitbake/bin:/home/richard/work/2022/yocto/poky/build/tmp/hosttools"; export HOME="/home/richard"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -O /home/richard/work/2022/yocto/poky/build/downloads/raspberrypi-firmware-1eb8921ae7158249894f89e8bb6c4bfb04ec7377.tar.gz -P /home/richard/work/2022/yocto/poky/build/downloads 'https://github.com/raspberrypi/firmware/archive/1eb8921ae7158249894f89e8bb6c4bfb04ec7377.tar.gz' --progress=dot -v failed with exit code 4, no output


