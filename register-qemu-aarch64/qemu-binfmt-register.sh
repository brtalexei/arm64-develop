#!/bin/sh

# original: https://github.com/qemu/qemu/blob/master/scripts/qemu-binfmt-conf.sh

aarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7\x00'
aarch64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
aarch64_family=arm

aarch64_be_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7'
aarch64_be_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
aarch64_be_family=armeb

qemu_check_access() {
    if [ ! -w "$1" ] ; then
        echo "ERROR: cannot write to $1" 1>&2
        exit 1
    fi
}

qemu_check_bintfmt_misc() {
    # load the binfmt_misc module
    if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
      if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc ; then
          exit 1
      fi
    fi

    qemu_check_access /proc/sys/fs/binfmt_misc/register
}

qemu_set_binfmts() {
    cpu=$1
    qemu=/usr/bin/qemu-$1-static

    # register the interpreter for cpu except for the native one
    magic=$(eval echo \$${cpu}_magic)
    mask=$(eval echo \$${cpu}_mask)
    family=$(eval echo \$${cpu}_family)

    if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ] ; then
        echo "INTERNAL ERROR: unknown cpu $cpu" 1>&2
        continue
    fi

    echo "Setting $qemu as binfmt interpreter for $cpu"
    echo ":qemu-$cpu:M::$magic:$mask:$qemu:$FLAGS" > /proc/sys/fs/binfmt_misc/register
}

qemu_clear_binfmts() {
    cpu=$1

    if [ ! -f /proc/sys/fs/binfmt_misc/qemu-${cpu} ]; then
        echo "qemu-${cpu} not registered"
        exit 1
    fi

    echo -1 > /proc/sys/fs/binfmt_misc/qemu-${cpu}
}

qemu_check_linux_platform() {
    if [ $(uname) != "Linux" ]; then
        echo "the script is only run in Linux"
        exit 1
    fi
}

qemu_check_linux_platform
qemu_check_bintfmt_misc

case "$1" in
set)
    qemu_set_binfmts $2 
    ;;
clear)
    qemu_clear_binfmts $2 
    ;;
esac
