# archlinux-docker

Custom Arch Linux Docker container for package builds via GitHub workflows.
Available at https://hub.docker.com/repository/docker/qzed/archlinux.

Recent glibc updates on Arch break the official image running on hosts with kernels older than 5.8.
This image replaces glibc with [glibc-linux4](https://aur.archlinux.org/packages/glibc-linux4/) from AUR.
See https://bugs.archlinux.org/task/69563 for the original bugreport, which has been closed as WONTFIX.
