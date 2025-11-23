# Configure linked git submodules

To add new submodule (for root dotfiles location): `git submodule add https://github.com/catppuccin/warp ./zsh/external/catppuccin-warp`

## Catppuccin OMZ [theme](https://github.com/JannoTjarks/catppuccin-zsh)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-zsh/catppuccin.zsh-theme ~/.oh-my-zsh/themes
ln -s $DOT_FILES/zsh/external/catppuccin-zsh/catppuccin-flavors ~/.oh-my-zsh/themes/catppuccin-flavors
```

## Catppuccin LSD [theme](https://github.com/catppuccin/lsd)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-lsd/themes/catppuccin-frappe/colors.yaml $HOME/.config/lsd/colors.yml
```

## Catppuccin WARP [theme](https://github.com/catppuccin/warp)

```sh
mkdir -p $HOME/.warp/themes
ln -s $DOT_FILES/zsh/external/catppuccin-warp/themes $HOME/.warp/themes/cattppuccin
```
