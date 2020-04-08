#!/bin/bash
QEMUCMD="qemu"

if type qemu-system-i386 > /dev/null ; then
 QEMUCMD="qemu-system-i386"
fi
echo $QEMUCMD

pkill -f "websockify 45900 localhost:5900"
pkill -f "${QEMUCMD} -hda redflag-live.qcow2 -vga cirrus -vnc :0"
rm redflag-live.qcow2
qemu-img create redflag-live.qcow2 -f qcow2 -b redflag.qcow2
$QEMUCMD -hda redflag-live.qcow2 -vga cirrus -vnc :0 &
websockify 45900 localhost:5900 &
