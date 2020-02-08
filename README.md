# .files

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS Catalina 10.15 systems.

## Package overview

- [Homebrew](https://brew.sh) (packages: [Brewfile](./install/Brewfile))
- [homebrew-cask](https://caskroom.github.io) (packages: [Caskfile](./install/Caskfile))
- [Node.js + npm LTS](https://nodejs.org/en/download/) (packages: [npmfile](./install/npmfile))

## Install

On a sparkling fresh installation of macOS:

Install Xcode cli tools

    xcode-select --install


Install [Brew](https://brew.sh/)

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Then clone this repo

    git clone https://github.com/andykenward/dotfiles.git ~/.dotfiles

Use the [Makefile](./Makefile) to install everything [listed above](#package-overview).

    cd ~/.dotfiles
    make

## Post-install

- `dotfiles dock` (set [Dock items](./macos/dock.sh))

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
       clean            Clean up caches (brew, npm, gem, rvm)
       dock             Apply macOS Dock settings
       edit             Open dotfiles in IDE (code) and Git GUI (stree)
       help             This help message
       macos            Apply macOS system defaults
       test             Run tests
       update           Update packages and pkg managers (OS, brew, npm, gem)