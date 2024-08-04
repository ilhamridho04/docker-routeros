#!/bin/bash

#!/bin/bash

# Allow necessary ports through UFW
ufw allow 5900
ufw allow 2221
ufw allow 2222
ufw allow 2223
ufw allow 2280
ufw allow 2443
ufw allow 8291
ufw allow 8728
ufw allow 8729
ufw allow 50
ufw allow 51
ufw allow 500/udp
ufw allow 4500/udp
ufw allow 1194/tcp
ufw allow 1194/udp
ufw allow 1701
ufw allow 1723

# Jalankan QEMU dengan image RouterOS
qemu-system-x86_64 -hda /routeros/$ROUTEROS_IMAGE -boot d -m 256M -smp 1 -net nic -net user,hostfwd=tcp::2221-:21,hostfwd=tcp::2222-:22,hostfwd=tcp::2223-:23,hostfwd=tcp::2280-:80,hostfwd=tcp::2443-:443,hostfwd=tcp::8291-:8291,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=udp::500-:500,hostfwd=udp::4500-:4500 -nographic
