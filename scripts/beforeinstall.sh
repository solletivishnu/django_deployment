##!/bin/bash
set -e

echo "[BeforeInstall] Stopping existing Docker containers (if any)..."
docker ps -q | xargs -r docker stop || true
docker system prune -af || true

echo "[BeforeInstall] Creating deployment directory..."
mkdir -p /home/ubuntu/django_deployment

echo "[BeforeInstall] Setting permissions..."
chown -R ubuntu:ubuntu /home/ubuntu/django_deployment
chmod -R u+rwX /home/ubuntu/django_deployment
chmod +x /home/ubuntu/django_deployment/scripts/*.sh || true

echo "[BeforeInstall] Done."


#!/bin/bash

#cd /home/ubuntu/django_deployment || exit 1
#if [ ! -f .env ]; then
  #echo ".env file is missing!"
  #exit 1
#fi
#docker compose down || true

#!/bin/bash
#echo "[BeforeInstall] Stopping existing containers..."
#cd /home/ubuntu/django_deployment || exit 1

#docker compose down || true

