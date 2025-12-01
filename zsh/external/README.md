# Configure linked git submodules

To add new submodule (for root dotfiles location):
`git submodule add --depth 1 https://github.com/catppuccin/eza ./zsh/external/catppuccin-eza`

To add directly just for reference, better to use submodules

```sh
wget -P "$(bat --config-dir)/themes" <https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme>
```

## Catppuccin Ghostty [theme](https://github.com/catppuccin/ghostty)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-ghostty/themes $XDG_CONFIG_HOME/ghostty/themes
```

```properties
# sh$> nano $XDG_CONFIG_HOME/ghostty/config

## custom theme from $XDG_CONFIG_HOME/ghostty/themes
theme = catppuccin-frappe.conf

## or a built-in one
# theme = Catppuccin Frappe

#... other settings
```

## Catppuccin WARP [theme](https://github.com/catppuccin/warp)

```sh
mkdir -p $HOME/.warp/themes
ln -s $DOT_FILES/zsh/external/catppuccin-warp/themes $HOME/.warp/themes/cattppuccin
```

## Catppuccin Fish [theme](https://github.com/catppuccin/fish)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-fish/themes $XDG_CONFIG_HOME/fish/themes
```

```sh
# sh$> fish
# fish$> fish_config
to run local webui where you can choose theme or run
# fish$> fish_config theme save "Catppuccin Frappe"
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

## Yazi + Catppuccin [theme](https://github.com/yazi-rs/flavors)

```sh
ln -s $DOT_FILES/zsh/external/proxy-yazi/yazi $XDG_CONFIG_HOME/yazi
```

## Catppuccin LazyGit [theme](https://github.com/catppuccin/lazygit/tree/main?tab=readme-ov-file#if-you-want-to-use-our-preset)

```sh
ln -s $DOT_FILES/zsh/external/catppuccin-lazygit/themes-mergable/frappe/mauve.yml $XDG_CONFIG_HOME/lazygit/catppuccin-frappe.yml
```

## NeoVim + LazyVim + Catppuccin [theme](https://www.lazyvim.org/plugins/colorscheme)

FirstL: install NeoVim with brew

Second: download lazyvim-starter fork (with already setuped catppuccin theme) and make symlink

```sh
ln -s $DOT_FILES/zsh/external/lazyvim-starter $XDG_CONFIG_HOME/nvim
```

Third: check that all dependencies are installed

```sh
# sh$> nvim
# nvim$> :checkhealth
```

## ZSH Syntax Highlighting + Catppuccin [theme]

```sh
ln -s $DOT_FILES/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh $XDG_CONFIG_HOME/ghostty/themes
```

## OBS Studio Catppuccin [theme](https://github.com/catppuccin/obs)

```sh
ln -s "$DOT_FILES/zsh/external/catppuccin-obs/themes" "$HOME/Library/Application Support/obs-studio/themes"
```
