# distro-arch-rootfs

## Refs:

> Linux
- debian
    1. https://doi-janky.infosiftr.net/job/tianon/job/debuerreotype/
    2. https://github.com/initdc/debian-rootfs-tools/releases
- ubuntu
    1. https://cdimage.ubuntu.com/ubuntu-base/releases/
    2. https://cloud-images.ubuntu.com/minimal/releases/
- arch
    1. https://archive.archlinux.org/iso/
    2. https://archlinuxarm.org/platforms/armv8/generic
- manjaro
    1. https://manjaro.org/download/#generic
    2. https://github.com/manjaro-arm/rootfs/releases
- fedora
    1. https://fedoraproject.org/wiki/Architectures/ARM
    2. https://dl.fedoraproject.org/pub/fedora/linux/releases/
    3. https://alt.fedoraproject.org/alt/
- alpine
    1. https://www.alpinelinux.org/downloads/
    2. https://dl-cdn.alpinelinux.org/alpine/edge/
- opensuse
    1. http://download.opensuse.org/ports/aarch64/distribution/leap/
    2. http://download.opensuse.org/ports/riscv/tumbleweed/images/

> Others

- LibreELEC https://test.libreelec.tv/

- CoreELEC 
    1. https://relkai.coreelec.org/
    2. https://github.com/CoreELEC/CoreELEC/releases/

- Lakka https://nightly.builds.lakka.tv/latest/RK3399.aarch64/

## RUN

- Docker

    ```sh
    DOCKER_BUILDKIT=1 docker build --platform linux/arm64v8 -t rootfs:alp -f Dockerfile.alp .

    docker run --platform linux/arm64v8 -it rootfs:alp sh
    ```

- QEMU

    ```sh
    WIP
    ```