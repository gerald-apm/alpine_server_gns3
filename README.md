# Alpine Linux GNS3 Container Appliance

Berikut ini adalah GNS3 container untuk setup Alpine Linux untuk keperluan testing automation menggunakan Ansible (/24 only)

Docker repo:

```
docker pull geraldapm/alpine-server:latest
```

Requirements: Hostname bernomor seperti:

```
AlpineLinux-1
```

Kebutuhan ENV

```
# Prefix IP, contoh: 192.168.0.1 maka prefixnya adalah 192.168.p
IP_PREFIX='192.168.0'

# Hitungan mulai penomoran IP, contoh jika diset 2 maka penomoran mulai dari 3
IP_START=100
```

Usage:
Ketika container baru saja di-start dari GNS3, pastikan untuk set ENV di menu dan menjalankan command berikut

```
# setup-ip
```

Kemudian anda bisa dengan lancar jaya koneksi ke host lain bahkan koneksi ke internet jika anda sudah setup internet sebelumnya.

Please enjoy :D
