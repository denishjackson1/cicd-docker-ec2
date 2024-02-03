#!/bin/bash

# Define variables
DOCKER_IMAGE="${DOCKERHUB_USERNAME}/your-image-name:latest"
CONTAINER_NAME="your-container-name"
NETWORK_NAME="your-network-name"

# Pull the Docker image from Docker Hub
docker pull $DOCKER_IMAGE

# Stop and remove the existing container (if it exists)
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run the Docker container
docker run -d \
  --name $CONTAINER_NAME \
  --network $NETWORK_NAME \
  -p 80:80 \
  $DOCKER_IMAGE
