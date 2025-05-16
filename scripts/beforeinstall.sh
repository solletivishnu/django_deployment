#!/bin/bash
echo "[BeforeInstall] Stopping existing Docker containers (if any)..."
docker ps -q | xargs -r docker stop
docker system prune -af
