from jiangjqian/buildkernel

USER root
RUN apt-get update
RUN apt-get install -y tmux gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential 
RUN apt-get install -y chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils 
RUN apt-get install -y debianutils iputils-ping 
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y xterm
#RUN apt-get install -y liblz4-tool zstd locales
USER richard

ENTRYPOINT ["tail", "-f", "/dev/null"]
