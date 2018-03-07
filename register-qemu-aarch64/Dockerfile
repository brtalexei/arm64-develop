FROM ubuntu:16.04 as builder

# Use tw's mirror
RUN sed -i 's/archive.ubuntu.com/tw.archive.ubuntu.com/g' /etc/apt/sources.list

# Install build prerequisties
RUN apt-get update \
    && apt-get install -y autoconf libtool bison flex wget python pkg-config \
        zlib1g zlib1g-dev libglib2.0-dev build-essential libpixman-1-dev

# Install qemu-aarch64-static
RUN mkdir -p /qemu \
    && mkdir -p /qemu/build \
    && cd /qemu \
    && wget https://download.qemu.org/qemu-2.11.1.tar.xz \
    && tar xvJf qemu-2.11.1.tar.xz \
    && echo "Start to build qemu" \
    && cd build \
    && ../qemu-2.11.1/configure --prefix=/qemu/qemu-static \
       --target-list=aarch64-linux-user --static \
    && make -j8 \
    && make install


FROM alpine

WORKDIR /qemu

COPY --from=builder /qemu/qemu-static/bin/qemu-aarch64  /usr/bin/qemu-aarch64-static
COPY ./qemu-binfmt-register.sh .

ENTRYPOINT ["/qemu/qemu-binfmt-register.sh"]
CMD ["set", "aarch64"]
