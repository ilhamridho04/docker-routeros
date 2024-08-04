# Gunakan Alpine Linux versi 3.11 sebagai image dasar
FROM alpine:3.11

# Expose port untuk akses VNC
EXPOSE 5900

# Expose port default dari RouterOS
EXPOSE 21 22 23 80 443 8291 8728 8729

# Expose port untuk berbagai layanan VPN
EXPOSE 50 51 500/udp 4500/udp 1194/tcp 1194/udp 1701 1723

# Ubah direktori kerja (juga akan membuat folder ini jika belum ada)
WORKDIR /routeros

# Install dependencies
RUN set -xe \
 && apk add --no-cache --update \
    netcat-openbsd qemu-x86_64 qemu-system-x86_64 \
    busybox-extras iproute2 iputils \
    bridge-utils iptables jq bash python3

# Environments yang mungkin berubah
ENV ROUTEROS_VERSION="6.46.5"
ENV ROUTEROS_IMAGE="chr-$ROUTEROS_VERSION.vdi"
ENV ROUTEROS_PATH="https://download.mikrotik.com/routeros/$ROUTEROS_VERSION/$ROUTEROS_IMAGE"

# Unduh VDI image dari situs remote
RUN wget "$ROUTEROS_PATH" -O "/routeros/$ROUTEROS_IMAGE"

# Salin script ke folder routeros
ADD ["./scripts", "/routeros"]

# Tentukan entrypoint untuk container
ENTRYPOINT ["/routeros/entrypoint.sh"]
