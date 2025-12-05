
<h3 align="center">
 <img
    alt="logo"
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png"
    width="100"
    alt="Logo"
  />
  <img
    alt="transparent"
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />

Settings for different <a href="https://github.com/AuthorProxy/dotfiles">Proxy Dotfiles</a> <img
    alt="transparent"
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />

</h3>
<p align="center">
  <a href="https://github.com/AuthorProxy/dotfiles/stargazers">
    <img
      alt="badge-stars"
      src="https://img.shields.io/github/stars/AuthorProxy/dotfiles?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"
    />
  </a>
  <a href="https://github.com/AuthorProxy/dotfiles/issues">
    <img
      alt="badge-issues"
      src="https://img.shields.io/github/issues/AuthorProxy/dotfiles?colorA=363a4f&colorB=f5a97f&style=for-the-badge"
    />
  </a>
  <a href="https://github.com/AuthorProxy/dotfiles/contributors">
    <img
      alt="badge-contribs"
      src="https://img.shields.io/github/contributors/AuthorProxy/dotfiles?colorA=363a4f&colorB=a6da95&style=for-the-badge"
    />
  </a>
</p>

---

# General Settings

## MAKE FILE

### Modes

`DOT_FILES_MODE=0` read-only mode, only validates

`DOT_FILES_MODE=1` enable force symlinking (after confirmation)

### Running

- run all rules, read-only

```sh
make run
```

- run all rules with fixing (after confirmation)

```sh
make run DOT_FILES_MODE=1
```

- run specific rule(s) with fixing (after confirmation)

```sh
make run run-shell run-git DOT_FILES_MODE=1
```

## ZSH

```sh
# at first add alias until you linked $DOT_FILES/zsh/.zshrc
alias lnse='f() { if [ ! -e "$1" ]; then echo "Error: source file \"$1\" does not exist"; return 1; fi; ln -s "$1" "$2"; }; f'
```

```sh
lnse $DOT_FILES/zsh/.zshrc $HOME/.zshrc
lnse $DOT_FILES/zsh/.zshenv $HOME/.zshenv
lnse $DOT_FILES/zsh/.zprofile $HOME/.zprofile
```

## GIT

```sh
lnse $DOT_FILES/tools/git/.gitattributes $HOME/.gitattributes
lnse $DOT_FILES/tools/git/.gitconfig $HOME/.gitconfig
lnse $DOT_FILES/tools/git/.gitmessage $HOME/.gitmessage
```

## VSCODE

```sh
lnse $DOT_FILES/IDEs/vscode/snippets $HOME/Library/Application\ Support/Code/User/snippets
lnse $DOT_FILES/IDEs/vscode/mcp.json $HOME/Library/Application\ Support/Code/User/mcp.json
lnse $DOT_FILES/IDEs/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
lnse $DOT_FILES/IDEs/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
```

## OTHERS

```sh
lnse $DOT_FILES/tools/.editorconfig $HOME/.editorconfig
lnse $DOT_FILES/tools/frontend/.prettierrc $HOME/.prettierrc
lnse $DOT_FILES/tools/.markdownlint.yaml $HOME/.markdownlint.yaml
```

---

[![Pushes and Commits of AuthorProxy/dotfiles](https://next.ossinsight.io/widgets/official/analyze-repo-pushes-and-commits-per-month/thumbnail.png?repo_id=81084900&image_size=auto&color_scheme=dark)](https://next.ossinsight.io/widgets/official/analyze-repo-pushes-and-commits-per-month?repo_id=81084900)

<p align="center">
  <img alt="bg"
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true"
  />
</p>

<p align="center">
  Copyright &copy; 2017-present <a href="https://github.com/AuthorProxy" target="_blank">Proxy Solutions</a>
</p>

<p align="center">
  <a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE">
    <img
      alt="_bg"
      src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"
    />
  </a>
</p>
