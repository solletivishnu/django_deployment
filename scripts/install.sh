#!/bin/bash

#echo "[Install] Pulling latest changes and dependencies"
# No git pull needed here — CodeDeploy does the sync
#!/bin/bash
#cd /home/ubuntu/django_deployment || exit
#!/bin/bash
#!/bin/bash
set -e

echo "[Install] Setting ownership and permissions..."
chown -R ubuntu:ubuntu /home/ubuntu/django_deployment
chmod -R u+rwX /home/ubuntu/django_deployment

echo "[Install] Done."
