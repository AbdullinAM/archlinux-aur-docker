FROM archlinux:latest
MAINTAINER Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

WORKDIR /home
COPY . /home
RUN ./configure.sh

RUN useradd -m -G wheel arch-user
COPY sudoers /etc/sudoers

USER arch-user
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/package-query.git
WORKDIR /tmp/package-query
RUN makepkg
USER root
RUN pacman -U --noconfirm *.pkg.tar.zst

USER arch-user
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /tmp/yay
RUN makepkg
USER root
RUN pacman -U --noconfirm *.pkg.tar.zst

USER root
WORKDIR /tmp
RUN rm -rf package-query yay
