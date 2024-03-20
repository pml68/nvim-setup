# nvim-setup

My custom Neovim setup

# Installation

After copying the repo contents to your Neovim config directory, install Silicon and add the Palenight theme

```sh
mkdir -p ~/.config/silicon/themes/
cp Palenight.tmTheme ~/.config/silicon/themes/
cd ~/.config/silicon/
silicon --build-cache
```

If you get an error related to syntaxes, create the missing folder (you don't need to put anything in it)

```sh
mkdir -p ~/.config/silicon/syntaxes/
silicon --build-cache
```
