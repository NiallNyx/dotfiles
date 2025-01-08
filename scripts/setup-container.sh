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


# -- Base: OpenCode --
echo "Step 5/9: Configuring opencode"
mkdir -p opencodetmp && cd opencodetmp
_opencode_arch=$([ $(uname -m) == "aarch64" ] && echo "arm64" || echo "x64")
_opencode_url="https://github.com/sst/opencode/releases/latest/download/opencode-linux-${_opencode_arch}.zip"
curl -# -L -o "opencode.zip" "${_opencode_url}"
unzip -q "opencode.zip"
mv opencode "${HOME}/.local/bin"
cd .. && rm -rf opencodetmp
echo


# -- Base: Starship --
echo "Step 6/9: Configuring starship"
sudo apt-get install -y starship
echo


# -- Base: Zoxide --
echo "Step 7/9: Configuring zoxide"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo


# -- Base: ZSH --
echo "Step 8/9: Configuring zsh"
ln -sfn "${HOME}/.dotfiles/container/zsh/.zprofile" "${HOME}/.zprofile"
ln -sfn "${HOME}/.dotfiles/container/zsh/.zshrc" "${HOME}/.zshrc"
echo


# -- Platform: Bash --
echo "Step 9/9: Configuring bash"
printf "\nzsh\n" >> "${HOME}/.bashrc"
echo


# -- Summary --
echo ">> Dotfiles installed <<"
echo
