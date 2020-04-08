#!/bin/bash
QEMUCMD="qemu"

if type qemu-system-i386 > /dev/null ; then
 QEMUCMD="qemu-system-i386"
fi
echo $QEMUCMD

pkill -f "websockify 45904 localhost:5904"
pkill -f "${QEMUCMD} -hda clelinux-live.qcow2 -vga cirrus -vnc :4"
rm clelinux-live.qcow2
qemu-img create clelinux-live.qcow2 -f qcow2 -b clelinux.qcow2
$QEMUCMD -hda clelinux-live.qcow2 -vga cirrus -vnc :4 &
websockify 45904 localhost:5904 &
