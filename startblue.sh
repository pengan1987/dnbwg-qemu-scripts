pkill -f "websockify 45901 localhost:5901"
pkill -f "qemu-system-i386 -hda bluepoint-live.qcow2 -vga cirrus -vnc :1"
rm bluepoint-live.qcow2
qemu-img create bluepoint-live.qcow2 -f qcow2 -b bluepoint.qcow2
qemu-system-i386 -hda bluepoint-live.qcow2 -vga cirrus -vnc :1 &
websockify 45901 localhost:5901 &
