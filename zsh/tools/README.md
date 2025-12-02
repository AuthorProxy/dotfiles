# Configure custom tools and presets

## Starship [preset](https://starship.rs/config/)

```sh
lnse $DOT_FILES/zsh/tools/starship/starship.toml $HOME/.config/starship.toml
```

## Warp [themes](https://docs.warp.dev/terminal/appearance/custom-themes#how-do-i-use-a-custom-theme-in-warp)

### Fallout custom theme with image background

```sh
mkdir -p $HOME/.warp/themes
lnse $DOT_FILES/zsh/tools/warp/themes/fallout $HOME/.warp/themes/fallout
```

## Yazi + Catppuccin [theme](https://github.com/yazi-rs/flavors)

```sh
lnse $DOT_FILES/zsh/tools/yazi $XDG_CONFIG_HOME/yazi
```

## qBittorrent [theme](https://github.com/catppuccin/qbittorrent?tab=readme-ov-file#client)

 > Open UI, select Preferences -> Behaviour -> Use custom UI theme and choose catppuccin theme `$DOT_FILES/zsh/tools/qBittorrent/catppuccin-frappe.qbtheme`
