SHELL := /bin/zsh

# Disable parallel execution
### MAKEFLAGS += --no-print-directory --jobs=1
.NOTPARALLEL:

HOME ?= ~/
DOT_FILES ?= ~/Projects/dotfiles
DOT_FILES_MODE ?= 0

GIT_FILES := \
	$$DOT_FILES/tools/git/.gitconfig:$$HOME/.gitconfig \
	$$DOT_FILES/tools/git/.gitmessage:$$HOME/.gitmessage \
	$$DOT_FILES/tools/git/.gitattributes:$$HOME/.gitattributes

SHELL_FILES := \
	$$DOT_FILES/zsh/.zshrc:$$HOME/.zshrc \
	$$DOT_FILES/zsh/.zshenv:$$HOME/.zshenv \
	$$DOT_FILES/zsh/.zprofile:$$HOME/.zprofile

VSCODE_FILES := \
	$$DOT_FILES/IDEs/vscode/snippets:$$HOME/Library/Application\ Support/Code/User/snippets \
	$$DOT_FILES/IDEs/vscode/mcp.json:$$HOME/Library/Application\ Support/Code/User/mcp.json \
	$$DOT_FILES/IDEs/vscode/settings.json:$$HOME/Library/Application\ Support/Code/User/settings.json \
	$$DOT_FILES/IDEs/vscode/keybindings.json:$$HOME/Library/Application\ Support/Code/User/keybindings.json

LINTER_FILES := \
	$$DOT_FILES/tools/frontend/.prettierrc:$$HOME/.prettierrc \
	$$DOT_FILES/tools/.editorconfig:$$HOME/.editorconfig \
	$$DOT_FILES/tools/.markdownlint.yaml:$$HOME/.markdownlint.yaml \
	$$DOT_FILES/tools/backend/.bake.toml:$$HOME/.bake.toml

MACOS_TOOLS_FILES := \
	$$DOT_FILES/tools/karabiner.json:$$HOME/.config/karabiner/karabiner.json

.PHONY: run shell git vscode linters

# Color constants
GREEN := \033[38;2;166;209;137m
YELLOW := \033[38;2;229;200;144m
RED := \033[38;2;231;130;132m
LAVENDER := \033[38;2;186;187;241m
RESET := \033[0m

run: shell git vscode linters

shell:
	@echo "...\nValidating Shell files..." > /dev/tty
	@$(call process_files,$(SHELL_FILES))
	@echo "..." > /dev/tty

git:
	@echo "...\nValidating Git files..." > /dev/tty
	@$(call process_files,$(GIT_FILES))
	@echo "..." > /dev/tty

vscode:
	@echo "...\nValidating vscode files..." > /dev/tty
	@$(call process_files,$(VSCODE_FILES))
	@echo "..." > /dev/tty

linters:
	@echo "...\nValidating Config files..." > /dev/tty
	@$(call process_files,$(LINTER_FILES))
	@echo "..." > /dev/tty

# Function to process file pairs
define process_files
	for pair in $(1); do \
		ask_fix=false; \
		output_target=1; \
		[[ $(DOT_FILES_MODE) == 1 ]] && ask_fix=true && output_target=/dev/tty; \
		\
		src=$${pair%:*}; \
		dest=$${pair#*:}; \
		dest_link_path=$$(readlink "$$dest" 2>/dev/null || true); \
		src_path_and_dest_path_equal=false; \
		\
		src_and_dest_exists_and_dest_is_correct_link=false; \
		src_and_dest_exists_but_dest_is_wrong_link=false; \
		src_and_dest_exists_but_dest_is_broken_link=false; \
		src_and_dest_exists_but_dest_is_real=false; \
		src_exists_but_dest_not_exist=false; \
		\
		src_and_dest_not_exist=false; \
		src_not_exist_but_dest_exists_and_dest_is_real=false; \
		src_not_exist_but_dest_exists_and_dest_is_wrong_link=false; \
		src_not_exist_but_dest_exists_and_dest_is_broken_link=false; \
		\
		[[ "$$src" == "$$dest_link_path" ]] && src_path_and_dest_path_equal=true; \
		\
		[[ -e "$$src" && -e "$$dest" && -L "$$dest" && $$src_path_and_dest_path_equal ]] && src_and_dest_exists_and_dest_is_correct_link=true; \
		[[ -e "$$src" && -e "$$dest" && -L "$$dest" && ! $$src_path_and_dest_path_equal ]] && src_and_dest_exists_but_dest_is_wrong_link=true; \
		[[ -e "$$src" && ! -e "$$dest" && -L "$$dest" ]] && src_and_dest_exists_but_dest_is_broken_link=true; \
		[[ -e "$$src" && -e "$$dest" && (-f "$$dest" || -d "$$dest") ]] && src_and_dest_exists_but_dest_is_real=true; \
		[[ -e "$$src" && ! -e "$$dest" ]] && src_exists_but_dest_not_exist=true; \
		\
		[[ ! -e "$$src" && ! -e "$$dest" ]] && src_and_dest_not_exist=true; \
		[[ ! -e "$$src" && -e "$$dest" && (-f "$$dest" || -d "$$dest") && ! -L "$$dest" ]] && src_not_exist_but_dest_exists_and_dest_is_real=true; \
		[[ ! -e "$$src" && -e "$$dest" && -L "$$dest" ]] && src_not_exist_but_dest_exists_and_dest_is_wrong_link=true; \
		[[ ! -e "$$src" && ! -e "$$dest" && -L "$$dest" ]] && src_not_exist_but_dest_exists_and_dest_is_broken_link=true; \
		\
		: 'echo "$$src - - - $$dest"' >&$$output_target; \
		if $$src_and_dest_exists_and_dest_is_correct_link; then \
			echo "$(GREEN)✓ $$dest --> $$src: source is OK, symlink is OK$(RESET)" >&$$output_target; \
		elif $$src_and_dest_exists_but_dest_is_wrong_link; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(YELLOW)✗ $$dest --> $$src: source is OK, symlink is WRONG target - $$dest_link_path$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)Do you want to fix it?$(RESET)" >&$$output_target; \
		elif $$src_and_dest_exists_but_dest_is_broken_link; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is OK, symlink is BROKEN - $$dest_link_path$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)Do you want to fix it?$(RESET)" >&$$output_target; \
		elif $$src_and_dest_exists_but_dest_is_real; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is OK, destination is regular FILE/DIR$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)Do you want to fix it? $(RED)!!! WARNING !!! - ORIGINAL WOULD BE DELETED$(RESET)" >&$$output_target; \
		elif $$src_exists_but_dest_not_exist; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(YELLOW)~ $$dest --> $$src: source is OK, symlink is MISSING$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)Do you want to fix it?$(RESET)" >&$$output_target; \
		elif $$src_and_dest_not_exist; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is MISSING, symlink is MISSING$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)~ Check source path!$(RESET)" >&$$output_target; \
		elif $$src_not_exist_but_dest_exists_and_dest_is_real; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is MISSING, destination is regular FILE/DIR$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)Do you want to move original? $(RED)!!! WARNING !!! - ORIGINAL WOULD BE REPLACED WITH SYMLINK$(RESET)" >&$$output_target; \
		elif $$src_not_exist_but_dest_exists_and_dest_is_wrong_link; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is MISSING, symlink is WRONG target - $$dest_link_path$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)~ Check source path!$(RESET)" >&$$output_target; \
		elif $$src_not_exist_but_dest_exists_and_dest_is_broken_link; then \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: source is MISSING, symlink is BROKEN - $$dest_link_path$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(YELLOW)~ Check source path!$(RESET)" >&$$output_target; \
		else \
			$$ask_fix && echo "" >&$$output_target; \
			echo "$(RED)✗ $$dest --> $$src: unknown state$(RESET)" >&$$output_target; \
			$$ask_fix && echo "$(RED)✗ !Something went wrong!$(RESET)" >&$$output_target; \
		fi; \
 \
		if $$ask_fix && [[ -e "$$src" ]] && ! $$src_and_dest_exists_and_dest_is_correct_link; then \
			echo "◯ Run? $(LAVENDER)ln -snf \"$$src\" \"$$dest\";$(RESET)" >&$$output_target; \
			echo "◯ Press [y/n]" >&$$output_target; \
			read -r fix_all < /dev/tty; \
			if [[ "$$fix_all" == [yY] ]]; then \
				ln -snf "$$src" "$$dest"; \
				echo "$(GREEN)✓ Fixed: $$dest linked to $$src$(RESET)" >&$$output_target; \
			else \
				echo "$(LAVENDER)◯ Skipped: $$dest to $$src$(RESET)" >&$$output_target; \
			fi; \
		fi; \
	done; \
	if $$ask_fix; then echo "" >&$$output_target; fi;
endef
