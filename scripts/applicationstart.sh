#!/bin/bash
#cd /home/ubuntu/django_deployment || exit
#echo "[ApplicationStart] Starting Docker containers..."
#docker-compose up -d
#export IMAGE_TAG=$(cat /home/ubuntu/django_deployment/image_tag.txt)
#docker pull vishnu9/todo-app:$IMAGE_TAG
#docker-compose -f docker-compose.yml up -d --build

#!/bin/bash

#cd /home/ubuntu/django_deployment || exit 1

# Load IMAGE_TAG from the file created by CodeBuild
#export IMAGE_TAG=$(cat image_tag.txt)

# Pull the exact image version
#docker pull vishnu9/todo-app:$IMAGE_TAG

# Start services with the correct tag
#docker compose --env-file image_tag.env up -d


#!/bin/bash
#echo "[ApplicationStart] Starting Docker container..."
#cd /home/ubuntu/django_deployment || exit 
# Load IMAGE_TAG from file
#export IMAGE_TAG=$(cat image_tag.txt)
# Create an env file to pass IMAGE_TAG into docker-compose
#echo "IMAGE_TAG=$IMAGE_TAG" > image_tag.env
# Start the app with correct tag
#docker compose --env-file image_tag.env up -d

#!/bin/bash
set -e
echo "[ApplicationStart] Starting Docker container..."
cd /home/ubuntu/django_deployment || exit 1
# Check image_tag.txt exists and is not empty
if [ ! -s image_tag.txt ]; then
  echo "Error ErrorS: image_tag.txt not found or empty!"
  exit 1
fi
# Load IMAGE_TAG from file
export IMAGE_TAG=$(cat image_tag.txt)
echo "Using IMAGE_TAG=$IMAGE_TAG"
# Write tag to env file
echo "IMAGE_TAG=$IMAGE_TAG" >> .env
# Start container
docker-compose up -d
echo "[ApplicationStart] Containers started."

echo "[ApplicationStart] Waiting for container to be healthy..."
sleep 10  # Give time for DB and web to fully start

# Get the running web container ID or name (adjust "web" if your service has a different name)
WEB_CONTAINER=$(docker ps --filter "name=web" --format "{{.ID}}" | head -n 1)

if [ -n "$WEB_CONTAINER" ]; then
  echo "[ApplicationStart] Running database migrations..."
  docker exec "$WEB_CONTAINER" python manage.py migrate
else
  echo "Error: Web container not running. Migration skipped."
  exit 1
fi
