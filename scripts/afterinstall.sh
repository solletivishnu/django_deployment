#!/bin/bash
#cd /home/ubuntu/django_deployment || exit
#echo "[AfterInstall] Pulling Docker images..."
#docker-compose pull
#!/bin/bash

#!/bin/bash

cd /home/ubuntu/django_deployment || exit 1

echo "[AfterInstall] Pulling the Docker image..."

# Confirm presence of the file
if [ ! -f image_tag.txt ]; then
  echo "image_tag.txt not founded in /home/ubuntu/django_deployment!"
  exit 1
fi

# Read the tag and pull the image
IMAGE_TAG=$(cat image_tag.txt)
echo "Using IMAGE_TAG=$IMAGE_TAG"
docker pull vishnu9/todo-app:$IMAGE_TAG
