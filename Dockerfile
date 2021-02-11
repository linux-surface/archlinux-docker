# Pull base image
FROM archlinux:base-devel

# Update system
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm git

# Add a build user for makepkg
RUN useradd build
RUN echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

# Workaround for being stuck at "checking keys in keyring"...
RUN pacman -S --noconfirm gd lib32-gcc-libs python

# Install glibc-linux4 as workaround
RUN git clone https://aur.archlinux.org/glibc-linux4.git/
RUN chown -R build glibc-linux4
RUN su build --pty -p -s /bin/bash -c 'cd glibc-linux4 && makepkg -f --syncdeps --skippgpcheck --nocheck --noconfirm'
RUN yes | /bin/bash -c 'pacman -U glibc-linux4/*pkg.tar.zst'
RUN rm -rf glibc-linux4

WORKDIR /workdir

ENV LANG=en_US.UTF-8
CMD ["/bin/bash"]
