#!/bin/bash
set -e


# -- Intro --
echo
echo ">> Niall's Dotfiles Installer <<"
echo


# -- Init --
echo "Step 1/15: Preparing system"
mkdir -p "${HOME}/.config"
brew update
echo


# -- Base: Bat --
echo "Step 2/15: Configuring bat"
brew install --formula bat
export BAT_CACHE_PATH="${HOME}/.cache/bat"
export BAT_CONFIG_DIR="${HOME}/.dotfiles/base/bat"
bat cache --build
echo


# -- Base: Eza --
echo "Step 3/15: Configuring eza"
brew install --formula eza
echo


# -- Base: FzF --
echo "Step 4/15: Configuring fzf"
brew install --formula fzf
echo


# -- Base: OpenCode --
echo "Step 5/15: Configuring opencode"
brew install --formula opencode
echo


# -- Base: Starship --
echo "Step 6/15: Configuring starship"
brew install --formula starship
echo


# -- Base: Zoxide --
echo "Step 7/15: Configuring zoxide"
brew install --formula zoxide
echo


# -- Base: ZSH --
echo "Step 8/15: Configuring zsh"
ln -sfh "${HOME}/.dotfiles/mac/zsh/.zprofile" "${HOME}/.zprofile"
ln -sfh "${HOME}/.dotfiles/mac/zsh/.zshrc" "${HOME}/.zshrc"
echo


# -- Platform: macOS Desktop --
echo "Step 9/15: Configuring macOS desktop"
sudo defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
sudo defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
sudo defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
sudo defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
echo


# -- Platform: macOS Dock --
echo "Step 10/15: Configuring macOS dock"
sudo defaults write com.apple.dock "autohide" -bool "true"
sudo defaults write com.apple.dock "autohide-delay" -float "0"
sudo defaults write com.apple.dock "autohide-time-modifier" -int "0"
sudo defaults write com.apple.dock "show-recents" -bool "false"
echo


# -- Platform: Finder --
echo "Step 11/15: Configuring finder"
sudo defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
sudo defaults write com.apple.finder "ShowPathbar" -bool "true"
sudo defaults write com.apple.Finder "FXPreferredViewStyle" "clmv"
sudo defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
sudo defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
sudo defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
sudo defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
sudo defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
sudo defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"
echo


# -- Platform: Ghostty --
echo "Step 12/15: Configuring ghostty"
brew install --cask ghostty
ln -sfh "${HOME}/.dotfiles/mac/ghostty" "${HOME}/.config/ghostty"
echo


# -- Platform: macOS Keyboard --
echo "Step 13/15: Configuring keyboard"
mkdir -p "${HOME}/Library/KeyBindings"
ln -sfh "${HOME}/.dotfiles/mac/keyboard/DefaultKeyBinding.dict" "${HOME}/Library/KeyBindings/DefaultKeyBinding.dict"
echo


# -- Platform: Mission Control --
echo "Step 14/15: Configuring spaces"
sudo defaults write com.apple.dock "mru-spaces" -bool "false"
echo


# -- Post Operations --
echo "Step 15/15: Restarting services"
killall Dock
killall Finder
echo


# -- Summary --
echo ">> Dotfiles installed <<"
echo
