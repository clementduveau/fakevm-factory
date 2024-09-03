#!/bin/bash

# Usage: ./deploy.sh [number of containers]

# Generate docker-compose.yml
./generate-compose.sh $1

# Build and deploy
podman build
podman-compose up -d
