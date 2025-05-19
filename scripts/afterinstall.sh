#!/bin/bash
#cd /home/ubuntu/django_deployment || exit
#echo "[AfterInstall] Pulling Docker images..."
#docker-compose pull
#!/bin/bash

#!/bin/bash
#cd /home/ubuntu/django_deployment || exit 1
#echo "[AfterInstall] Pulling the Docker image..."
# Confirm presence of the file
#if [ ! -f image_tag.txt ]; then
  #echo "image_tag.txt not founded in /home/ubuntu/django_deployment!"
  #exit 1
#fi
# Read the tag and pull the image
#IMAGE_TAG=$(cat image_tag.txt)
#echo "Using IMAGE_TAG=$IMAGE_TAG"
#docker pull vishnu9/todo-app:$IMAGE_TAG


#!/bin/bash
set -e
cd /home/ubuntu/django_deployment || exit 1

echo "[AfterInstall] Pulling the Docker image..."

if [ ! -f image_tag.txt ]; then
  echo "image_tag.txt not found in /home/ubuntu/django_deployment!"
  exit 1
fi

IMAGE_TAG=$(cat image_tag.txt)
echo "Using IMAGE_TAG=$IMAGE_TAG"
docker pull vishnu9/todo-app:$IMAGE_TAG

echo "[AfterInstall] Fetching secrets from AWS Secrets Manager..."

SECRET_JSON=$(aws secretsmanager get-secret-value \
  --secret-id prod/db/credentials \
  --query SecretString \
  --output text)

POSTGRES_USER=$(echo "$SECRET_JSON" | jq -r .POSTGRES_USER)
POSTGRES_PASSWORD=$(echo "$SECRET_JSON" | jq -r .POSTGRES_PASSWORD)
POSTGRES_HOST=$(echo "$SECRET_JSON" | jq -r .POSTGRES_HOST)
POSTGRES_PORT=$(echo "$SECRET_JSON" | jq -r .POSTGRES_PORT)
POSTGRES_DB=$(echo "$SECRET_JSON" | jq -r .POSTGRES_DB)

# Write to .env file for Docker Compose or Django to use
cat <<EOF > /home/ubuntu/django_deployment/.env
POSTGRES_USER=$POSTGRES_USER
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
POSTGRES_HOST=$POSTGRES_HOST
POSTGRES_PORT=$POSTGRES_PORT
POSTGRES_DB=$POSTGRES_DB
EOF

echo "[Secrets] .env file created successfully."