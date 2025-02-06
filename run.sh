#!/usr/bin/env bash

# Build Docker image
echo "Building Docker image..."
docker build -t pngv2 .

# Run Docker container
echo "Running Docker container..."
docker run -d -v .:/app --name pptx_converter pngv2
