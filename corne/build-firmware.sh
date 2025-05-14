#!/bin/bash
set -e

# Create necessary directories
mkdir -p build firmware

# Build the Docker image if it doesn't exist
if ! docker image inspect zmk-corne-build >/dev/null 2>&1; then
  echo "Building Docker image for ZMK builds..."
  docker build -t zmk-corne-build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
fi

# Run the Docker container
echo "Starting ZMK build process in Docker..."
docker run --rm -it \
  -v "$(pwd)/build:/app/build" \
  -v "$(pwd)/config:/app/config:ro" \
  -v "$(pwd)/build.yaml:/app/build.yaml:ro" \
  -v "$(pwd)/firmware:/app/firmware" \
  zmk-corne-build

echo "Build complete! Firmware files are in the 'firmware' directory."
