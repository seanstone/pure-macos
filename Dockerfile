FROM --platform=linux/amd64 archlinux:latest
RUN pacman -Syu --noconfirm

RUN echo -e "\n[home_aggraef_arch_pure_Arch]\n" >> /etc/pacman.conf
RUN echo -e "SigLevel = Never\n" >> /etc/pacman.conf
RUN echo -e "Server = https://download.opensuse.org/repositories/home:aggraef:arch:pure/Arch/\$arch\n" >> /etc/pacman.conf
RUN echo -e "\n[home_aggraef_arch_pure-git_Arch]\n" >> /etc/pacman.conf
RUN echo -e "SigLevel = Never\n" >> /etc/pacman.conf
RUN echo -e "Server = https://download.opensuse.org/repositories/home:aggraef:arch:pure-git/Arch/\$arch\n" >> /etc/pacman.conf
RUN pacman -Sy
RUN pacman -S --noconfirm pure pure-docs

RUN pacman -S --noconfirm sudo
# create user "user" with password "pass"
RUN useradd --create-home --shell /bin/bash --user-group --groups wheel user
RUN sh -c 'echo "user:pass" | chpasswd'

RUN mkdir /home/user/pure
RUN chown -R user:users /home/user/pure
USER user
WORKDIR /home/user/pure