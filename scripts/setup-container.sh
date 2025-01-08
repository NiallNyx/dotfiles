#!/bin/bash
set -e


# -- Intro --
echo
echo ">> Niall's Dotfiles Installer <<"
echo


# -- Init --
echo "Step 1/8: Preparing system"
mkdir -p "${HOME}/.local/bin"
sudo apt-get update
echo


# -- Base: Bat --
echo "Step 2/8: Configuring bat"
sudo apt-get install -y bat
ln -s "/usr/bin/batcat" "${HOME}/.local/bin/bat"
export BAT_CACHE_PATH="${HOME}/.cache/bat"
export BAT_CONFIG_DIR="${HOME}/.dotfiles/base/bat"
batcat cache --build
echo


# -- Base: Eza --
echo "Step 3/8: Configuring eza"
sudo apt-get install -y eza
echo


# -- Base: FzF --
echo "Step 4/8: Configuring fzf"
sudo apt-get install -y fzf
echo


# -- Base: Starship --
echo "Step 5/8: Configuring starship"
sudo apt-get install -y starship
echo


# -- Base: Zoxide --
echo "Step 6/8: Configuring zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo


# -- Base: ZSH --
echo "Step 7/8: Configuring zsh"
ln -sfn "${HOME}/.dotfiles/container/zsh/.zprofile" "${HOME}/.zprofile"
ln -sfn "${HOME}/.dotfiles/container/zsh/.zshrc" "${HOME}/.zshrc"
echo


# -- Platform: Bash --
echo "Step 8/8: Configuring bash"
printf "\nzsh\n" >> "${HOME}/.bashrc"
echo


# -- Summary --
echo ">> Dotfiles installed <<"
echo
