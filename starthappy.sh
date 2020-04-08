#!/bin/bash
QEMUCMD="qemu"

if type qemu-system-i386 > /dev/null ; then
 QEMUCMD="qemu-system-i386"
fi
echo $QEMUCMD

pkill -f "websockify 45903 localhost:5903"
pkill -f "${QEMUCMD} -hda happylinux-live.qcow2 -vga cirrus -vnc :3"
rm happylinux-live.qcow2
qemu-img create happylinux-live.qcow2 -f qcow2 -b happylinux.qcow2
$QEMUCMD -hda happylinux-live.qcow2 -vga cirrus -vnc :3 &
websockify 45903 localhost:5903 &
