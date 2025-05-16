#!/bin/bash
#echo "[BeforeInstall] Stopping existing Docker containers (if any)..."

#docker ps -q | xargs -r docker stop
#docker system prune -af


#!/bin/bash

#cd /home/ubuntu/django_deployment || exit 1
#if [ ! -f .env ]; then
  #echo ".env file is missing!"
  #exit 1
#fi
#docker compose down || true

#!/bin/bash
echo "[BeforeInstall] Stopping existing containers..."
cd /home/ubuntu/django_deployment || exit 1

docker compose down || true

