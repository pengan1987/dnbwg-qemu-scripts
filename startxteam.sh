#!/bin/bash
QEMUCMD="qemu"

if type qemu-system-i386 > /dev/null ; then
 QEMUCMD="qemu-system-i386"
fi
echo $QEMUCMD

pkill -f "websockify 45902 localhost:5902"
pkill -f "${QEMUCMD} -hda xteam-live.qcow2 -vga cirrus -vnc :2"
rm xteam-live.qcow2
qemu-img create xteam-live.qcow2 -f qcow2 -b xteam.qcow2
$QEMUCMD -hda xteam-live.qcow2 -vga cirrus -vnc :2 &
websockify 45902 localhost:5902 &
