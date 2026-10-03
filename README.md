# neovim-raspberry

Repo for installing neovim building it from source with Docker.

## Remote install
```bash
curl -fsSL https://s.archfan.com/nvim-install | bash # -s "v0.9.0"
```

## Description
This repository provides a script for installing Neovim on a Raspberry Pi (64-bit). It uses Docker to build and install Neovim, ensuring compatibility with the Raspberry Pi architecture.
App is installed via `apt`, for removing neovim just run `apt remove -y neovim`.

## Prerequisites
- Raspberry Pi with a 64-bit OS.
- Docker installed on the Raspberry Pi.

## Installation

To install the latest stable version of Neovim, simply run the following command:

```sh
chmod +x ./install.sh && ./install.sh
```

Pick a version explicitly: a tag (e.g. `v0.10.4`), `stable` (default) or `latest` (development master branch):

```sh
./install.sh v0.10.4
./install.sh latest
```

Keep the docker build image for fast cached rebuilds (otherwise it is removed to save ~1.5 GB disk):

```sh
./install.sh --keep-image
KEEP_IMAGE=1 ./install.sh
```

> [!NOTE]
>The script defaults to the stable branch if no version argument is provided. If an invalid version is specified, the script will fail with an error message.
