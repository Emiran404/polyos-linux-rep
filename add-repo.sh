#!/bin/bash
# PolyOS Viewer Repository Ekleme Scripti
# Kullanım: wget -O - http://<SERVER_IP>:3001/polyos/viewer/add-repo.sh | bash

# Sunucu/Repo Konfigürasyonu (GitHub)
REPO_URL="https://raw.githubusercontent.com/Emiran404/polyos-linux-rep/main"

if [ "$(id -u)" != "0" ]; then
   echo "Bu script root yetkisi ile çalıştırılmalıdır."
   echo "Lütfen 'sudo' ile tekrar deneyin veya root olun."
   exit 1
fi

echo "PolyOS Viewer GitHub deposu ekleniyor..."

# List dosyasını oluştur
echo "deb [trusted=yes] $REPO_URL ./" > /etc/apt/sources.list.d/polyos-viewer.list

echo "Depo listesi güncelleniyor..."
apt-get update

echo "PolyOS Viewer yükleniyor/güncelleniyor..."
apt-get install -y polyos-viewer

echo "Kurulum tamamlandı! 'polyos-viewer' komutuyla başlatabilirsiniz."
