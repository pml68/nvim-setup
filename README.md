# nvim-setup

My custom Neovim setup

## Installation

Download into your config directory

```sh
git clone --depth=1 https://github.com/pml68/nvim-setup ~/.config/nvim
```

## Usage with Docker

Pull the image
```sh
docker pull ghcr.io/pml68/neovim:latest
```

Or build it
```sh
docker build -t neovim -f Dockerfile .
```

And then run it
```sh
docker run -it neovim:latest
```

The image size is somewhere around 4.5GB due to every language I use being included (C# with .NET, Java 21 and 17 etc.)

### TeX

There is also an image that contains texlive packages I use on top of everything in the base image. The size is ~5.4GB.

Pull or build the image
```sh
docker pull ghcr.io/pml68/neovim-tex:latest

# OR

docker build -t neovim-tex -f Dockerfile.tex .
```

And run it
```sh
docker run -it neovim-tex:latest
```
