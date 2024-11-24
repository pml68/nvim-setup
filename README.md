# nvim-setup

My custom Neovim setup

## Installation

Download into your config directory

```sh
git clone --depth=1 https://github.com/pml68/nvim-setup ~/.config/nvim
```

## Usage with Docker

Build the image
```sh
docker build -t neovim .
```

And then run it
```sh
docker run -it neovim:latest bash
```

The image size is somewhere around 5.9GB due to every language I use being included (C# with .NET, Java 21 and 17 etc.)
