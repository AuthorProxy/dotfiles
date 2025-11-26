# Configure custom tools and presets

## Starship [preset](https://starship.rs/config/)

```sh
ln -s $DOT_FILES/zsh/tools/starship/starship.toml $HOME/.config/starship.toml
```

## Warp [themes](https://docs.warp.dev/terminal/appearance/custom-themes#how-do-i-use-a-custom-theme-in-warp)

### Fallout custom theme with image background

```sh
mkdir -p $HOME/.warp/themes
ln -s $DOT_FILES/zsh/tools/warp/themes/fallout $HOME/.warp/themes/fallout
```

## qBittorrent [theme](https://github.com/catppuccin/qbittorrent?tab=readme-ov-file#client)

 > Open UI, select Preferences -> Behaviour -> Use custom UI theme and choose catppuccin theme `$DOT_FILES/zsh/tools/qBittorrent/catppuccin-frappe.qbtheme`
