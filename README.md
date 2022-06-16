# distro-arch-rootfs

## Refs:

> Linux

- ubuntu https://cdimage.ubuntu.com/ubuntu-base/releases/
- arch https://archlinuxarm.org/platforms/armv8/generic
- manjaro
    1. https://manjaro.org/download/#generic
    2. https://github.com/manjaro-arm/rootfs/releases
- fedora 
    1. https://fedoraproject.org/wiki/Architectures/ARM
    2. https://dl.fedoraproject.org/pub/fedora/linux/releases/
    3. https://alt.fedoraproject.org/alt/
- alpine https://www.alpinelinux.org/downloads/
- opensuse
    1. https://en.opensuse.org/HCL:Chroot
    2. http://download.opensuse.org/ports/aarch64/distribution/leap/15.3/appliances/

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