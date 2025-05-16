#!/bin/bash
cd /home/ubuntu/django_deployment/scripts || exit
docker-compose down || true
