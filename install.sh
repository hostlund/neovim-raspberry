#!/bin/bash
set -eu

if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker to continue."
    exit 1
fi

NEOVIM_VERSION=${1:-latest}

docker build --build-arg NEOVIM_VERSION="${NEOVIM_VERSION}" -t neovim-build .

# Remove any stale container with the same name
docker rm -f neovim-build >/dev/null 2>&1 || true

# Keep container alive so we can query the .deb name (cpack naming varies by arch/version)
docker run -d --name neovim-build neovim-build sleep infinity

# Always remove the long-lived container, even if a later step fails
trap 'docker rm -f neovim-build >/dev/null 2>&1 || true' EXIT

# Resolve the actual .deb path (e.g. nvim-linux-arm64.deb, nvim-linux-x86_64.deb)
DEB_PATH=$(docker exec neovim-build sh -c 'ls /neovim/build/*.deb 2>/dev/null | head -n 1')

if [ -z "${DEB_PATH}" ]; then
    echo "Could not find .deb in /neovim/build. Build may have failed."
    docker exec neovim-build sh -c 'ls -l /neovim/build/ || true'
    exit 1
fi

echo "Found ${DEB_PATH}, copying..."
docker cp "neovim-build:${DEB_PATH}" ./nvim.deb
sudo apt install -y ./nvim.deb
rm -f ./nvim.deb
docker rm -f neovim-build
docker rmi neovim-build
