FROM alpine:edge AS base
WORKDIR /root
SHELL ["/bin/sh", "-c"]

RUN apk add --no-cache git \
                       lazygit \
                       neovim \
                       man-pages \
                       alpine-sdk \
                       bash \
                       eza \
                       ncurses \
                       util-linux-misc \
                       curl \
                       --update

# install deps needed by neovim
RUN apk add --no-cache wget \
                       gzip \
                       neovim-doc \
                       ripgrep \
                       rustup \
                       python3 \
                       openjdk21 \
                       openjdk17 \
                       gradle \
                       go \
                       dotnet8-sdk \
                       clang19-extra-tools \
                       nodejs \
                       npm 

# install TeX
RUN apk add --no-cache texlive \
                       texlive-binextra \
                       texmf-dist-fontutils \
                       texmf-dist-fontsrecommended \
                       texmf-dist-langenglish \
                       texmf-dist-langeuropean \
                       texmf-dist-latexextra \
                       texmf-dist-latexrecommended \
                       texmf-dist-pictures \
                       texmf-dist-plaingeneric 

# pre-download lazy.nvim
RUN git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable /root/.local/share/nvim/lazy/lazy.nvim

# set up Rust
RUN rustup-init -y --default-toolchain none && /root/.cargo/bin/rustup toolchain install nightly --allow-downgrade --profile minimal --component rustfmt,rust-src,clippy,rust-analyzer && echo -e "[unstable]\ngc = true" > /root/.cargo/config.toml

# copy config files
COPY .bashrc .bashrc
COPY . .config/nvim

FROM base
SHELL ["/bin/bash", "-c"]
WORKDIR /root
RUN nvim --headless +"Lazy! sync" +qa; rm -rf /root/.cache

# symlink the clangd executable, since it can't be installed with mason
# also symlink rust-analyzer
RUN ln -sf /usr/bin/clangd /root/.local/share/nvim/mason/bin/clangd && ln -sf /root/.rustup/toolchains/nightly-x86_64-unknown-linux-musl/bin/rust-analyzer /root/.local/share/nvim/mason/bin/rust-analyzer

ENTRYPOINT ["/bin/bash"]
