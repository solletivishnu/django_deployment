#!/bin/bash
cd /home/ubuntu/django_deployment || exit
echo "[ApplicationStart] Starting Docker containers..."
docker-compose up -d
