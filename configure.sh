#!/bin/bash

pacman -Syy --noconfirm
pacman -S --noconfirm archlinux-keyring
pacman -Su --noconfirm
pacman-db-upgrade

trust extract-compat

# install required packages
pacman -S --noconfirm \
	gcc \
	make \
	binutils \
	fakeroot \
	sudo \
	awk \
	pkgconf \
	diffutils \
	gettext \
	wget \
	git \
	yajl \
	go

