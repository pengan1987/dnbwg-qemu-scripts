#!/bin/bash
QEMUCMD="qemu"

if type qemu-system-i386 > /dev/null ; then
 QEMUCMD="qemu-system-i386"
fi
echo $QEMUCMD

pkill -f "websockify 45901 localhost:5901"
pkill -f "${QEMUCMD} -hda bluepoint-live.qcow2 -vga cirrus -vnc :1"
rm bluepoint-live.qcow2
qemu-img create bluepoint-live.qcow2 -f qcow2 -b bluepoint.qcow2
$QEMUCMD -hda bluepoint-live.qcow2 -vga cirrus -vnc :1 &
websockify 45901 localhost:5901 &
