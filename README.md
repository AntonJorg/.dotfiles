# System Documentation

## Dotfile tracking

### Setup on new computer
```bash
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles checkout
```
After this, run:
```bash
./.initdotfiles
```

## KeePassXC

## Key programs

Basic setup comes from EndeavourOS Qtile edition.

Additional programs installed via `.initdotfiles` are:
- *kitty:* Terminal emulator
- *neovim:* Text editor / dev environment
- *sioyek:* PDF viewer
- *keepassxc:* Password manager
- *syncthing:* File syncronization
- *rustup:* Rust manager
- *poetry:* Python manager
- *nvm:* NodeJS manager

