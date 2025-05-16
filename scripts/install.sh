#!/bin/bash
cd /home/ubuntu/django_deployment || exit
echo "[Install] Pulling latest changes and dependencies"
# No git pull needed here — CodeDeploy does the sync
