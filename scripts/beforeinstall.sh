#!/bin/bash
cd /home/ubuntu/django_deployment || exit
docker-compose down || true
