#!/bin/bash
#cd /home/ubuntu/django_deployment || exit
#echo "[AfterInstall] Pulling Docker images..."
#docker-compose pull
#!/bin/bash

cd /home/ubuntu/django_deployment || exit 1

echo "[AfterInstall] Pulling the Docker image..."

# Check for image_tag.txt
if [ ! -f image_tag.txt ]; then
  echo "image_tag.txt not found!"
  exit 1
fi

IMAGE_TAG=$(cat image_tag.txt)

echo "Using IMAGE_TAG=$IMAGE_TAG"

docker pull vishnu9/todo-app:$IMAGE_TAG
