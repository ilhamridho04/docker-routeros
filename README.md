# RouterOS Docker Image

Repositori ini berisi setup Docker untuk menjalankan RouterOS menggunakan QEMU. Image Docker ini dibangun di atas Alpine Linux dan dikonfigurasi untuk mengekspos berbagai port untuk RouterOS dan layanan VPN.

## Prasyarat

- Docker
- Docker Compose

## Memulai
### Menggunakan docker hub
#### Untuk menarik image Docker dari Docker Hub, gunakan perintah berikut:
```sh
docker pull ilhamridho/routeros:latest
```

#### Menjalankan Container Docker
Gunakan perintah berikut untuk menjalankan container dengan image yang telah diunduh. Perintah ini mengekspos berbagai port yang digunakan oleh RouterOS dan layanan VPN:
```sh
docker run -d \
  --name routeros-container \
  -p 5900:5900 \
  -p 2221:21 \
  -p 2222:22 \
  -p 2223:23 \
  -p 2280:80 \
  -p 2443:443 \
  -p 8291:8291 \
  -p 8728:8728 \
  -p 8729:8729 \
  -p 50:50 \
  -p 51:51 \
  -p 500:500/udp \
  -p 4500:4500/udp \
  -p 1194:1194/tcp \
  -p 1194:1194/udp \
  -p 1701:1701 \
  -p 1723:1723 \
  ilhamridho/routeros:latest
```

### Clone Repository

```sh
git clone https://github.com/ilhamridho/routeros-docker.git
cd routeros-docker
```

### Struktur
```
routeros-docker/
├── docker-compose.yml
└── scripts/
    └── entrypoint.sh
```

## Kustomisasi
#### Variabel Lingkungan
Anda dapat menyesuaikan versi RouterOS dengan mengatur variabel lingkungan berikut di file `docker-compose.yml`:
- `ROUTEROS_VERSION`: Versi RouterOS yang akan diunduh (default: 6.46.5).
- `ROUTEROS_IMAGE`: Nama file image (default: chr-$ROUTEROS_VERSION.vdi).

#### Script
File `scripts/entrypoint.sh` berisi script startup untuk container. Anda dapat memodifikasi script ini untuk menyesuaikan perilaku startup.

## Membangun dan Menjalankan Container Docker
1. Membangun Image Docker
   Jika Anda belum membangun image, Anda dapat membangunnya menggunakan Docker Compose:
   ```sh
   docker-compose build
   ```

2. Menjalankan Container Docker
   Mulai container menggunakan Docker Compose:
   ```sh
   docker-compose up -d
   ```

3. Verifikasi Container
   Periksa apakah container sedang berjalan:
   ```sh
   docker-compose ps
   ```

## Mengakses RouterOS
Setelah container berjalan, Anda dapat mengakses RouterOS melalui port yang diekspos. Berikut adalah port yang dapat digunakan:

- `VNC: 5900` - Akses melalui VNC
- `FTP: 2221` - Akses melalui FTP
- `SSH: 2222` - Akses melalui SSH
- `Telnet: 2223` - Akses melalui Telnet
- `HTTP: 2280` - Akses melalui HTTP
- `HTTPS: 2443` - Akses melalui HTTPS
- `Winbox: 8291` - Akses melalui Winbox
- `API: 8728` - Akses melalui API
- `API-SSL: 8729` - Akses melalui API-SSL

Selain itu, layanan VPN diekspos pada port berikut:

- `IPSec (ESP): 50`
- `IPSec (AH): 51`
- `IKE: 500/udp`
- `NAT-T: 4500/udp`
- `OpenVPN: 1194/tcp, 1194/udp`
- `L2TP: 1701`
- `PPTP: 1723`


### Ringkasan
README.md ini menyediakan informasi yang lebih detail mengenai penggunaan port dan contoh koneksi ke layanan yang diekspos oleh container RouterOS. Ini juga mencakup instruksi untuk memulai, membangun, dan menjalankan container.
