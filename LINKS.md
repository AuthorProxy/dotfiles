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
lnse $DOT_FILES/tools/backend/.bake.toml $HOME/.bake.toml
lnse $DOT_FILES/tools/.editorconfig $HOME/.editorconfig
lnse $DOT_FILES/tools/frontend/.prettierrc $HOME/.prettierrc
lnse $DOT_FILES/tools/.markdownlint.yaml $HOME/.markdownlint.yaml
```
