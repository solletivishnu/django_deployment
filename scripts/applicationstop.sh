#!/bin/bash
set -e

echo "[ApplicationStop] Stopping containers..."
cd /home/ubuntu/django_deployment || exit 1
docker-compose down

echo "[ApplicationStop] Containers stopped."
