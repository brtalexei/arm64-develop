FROM brt/binfmt-register:0.0.1 as enabler

FROM arm64v8/ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

COPY --from=enabler /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        sudo \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ADD start-image.sh /

# Remove the binary. It's unused in the final result
RUN rm -f /usr/bin/qemu-aarch64-static

WORKDIR /root
ENTRYPOINT ["/start-image.sh"]