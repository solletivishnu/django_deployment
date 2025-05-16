#!/bin/bash
cd /home/ubuntu/django_deployment || exit
echo "[AfterInstall] Pulling Docker images..."
docker-compose pull
