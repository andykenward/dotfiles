# SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
NVM_DIR := $(HOME)/.nvm

macos: sudo core-macos packages

core-macos: brew git npm

packages: brew-packages cask-apps code-ext zsh

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


git: brew
	brew install git
	ln -sf $(DOTFILES_DIR)/git/gitconfig $(HOME)/.gitconfig

npm:
	if ! [ -d $(NVM_DIR)/.git ]; then git clone https://github.com/nvm-sh/nvm.git $(NVM_DIR); fi
	. $(NVM_DIR)/nvm.sh; nvm install --lts

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)install/Brewfile

cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)install/Caskfile

code-ext: brew
	for EXT in $$(cat install/Codefile); do code --install-extension $$EXT; done

zsh: brew 
	ln -sf $(DOTFILES_DIR)zsh/zshrc $(HOME)/.zshrc