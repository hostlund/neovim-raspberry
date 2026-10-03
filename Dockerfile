FROM debian:stable

ARG NEOVIM_VERSION=stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    git cmake make ninja-build libtool libtool-bin autoconf automake pkg-config unzip gettext ca-certificates dpkg-dev \
    && rm -rf /var/lib/apt/lists/*

RUN if [ "$NEOVIM_VERSION" = "latest" ]; then \
    git clone --depth 1 https://github.com/neovim/neovim; \
    else \
    git clone --branch "${NEOVIM_VERSION}" --depth 1 https://github.com/neovim/neovim; \
    fi

WORKDIR /neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo && cd build && cpack -G DEB

CMD ["echo", "nothing to look here"]
