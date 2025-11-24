# Configure linked git submodules

To add new submodule (for root dotfiles location): `git submodule add https://github.com/catppuccin/eza ./zsh/external/catppuccin-eza`

## Catppuccin Ghostty [theme](https://github.com/catppuccin/ghostty)

```sh
mkdir -p $HOME/.warp/themes
ln -s $DOT_FILES/zsh/external/catppuccin-warp/themes $HOME/.warp/themes/cattppuccin
```

## Catppuccin WARP [theme](https://github.com/catppuccin/warp)

```sh
mkdir -p $HOME/.warp/themes
ln -s $DOT_FILES/zsh/external/catppuccin-warp/themes $HOME/.warp/themes/cattppuccin
```

## Catppuccin OMZ [theme](https://github.com/JannoTjarks/catppuccin-zsh)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-zsh/catppuccin.zsh-theme ~/.oh-my-zsh/themes
ln -s $DOT_FILES/zsh/external/catppuccin-zsh/catppuccin-flavors ~/.oh-my-zsh/themes/catppuccin-flavors
```

## Catppuccin LSD [theme](https://github.com/catppuccin/lsd)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-lsd/themes/catppuccin-frappe/colors.yaml $XDG_CONFIG_HOME/lsd/colors.yml
```


## Catppuccin EZA [theme](https://github.com/catppuccin/eza)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-eza/themes/frappe/catppuccin-frappe-mauve.yml $XDG_CONFIG_HOME/eza/theme.yml
```


## Catppuccin LazyGit [theme](https://github.com/catppuccin/lazygit/tree/main?tab=readme-ov-file#if-you-want-to-use-our-preset)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-lazygit/themes-mergable/frappe/mauve.yml $XDG_CONFIG_HOME/lazygit/catppuccin-frappe.yml
```


## Catppuccin NVIM [theme](https://github.com/catppuccin/https://github.com/catppuccin/nvim)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-lazygit/themes-mergable/frappe/mauve.yml $XDG_CONFIG_HOME/lazygit/theme.yml
```
