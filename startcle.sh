pkill -f "websockify 45904 localhost:5904"
pkill -f "qemu-system-i386 -hda clelinux-live.qcow2 -vga cirrus -vnc :4"
rm clelinux-live.qcow2
qemu-img create clelinux-live.qcow2 -f qcow2 -b clelinux.qcow2
qemu-system-i386 -hda clelinux-live.qcow2 -vga cirrus -vnc :4 &
websockify 45904 localhost:5904 &
