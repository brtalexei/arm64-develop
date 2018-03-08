FROM brt/binfmt-register:0.0.1 as enabler

FROM arm64v8/alpine:3.7

COPY --from=enabler /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static

ADD hello /

# Remove the binary. It's unused in the final result
RUN rm -f /usr/bin/qemu-aarch64-static

WORKDIR /root
ENTRYPOINT ["/hello"]