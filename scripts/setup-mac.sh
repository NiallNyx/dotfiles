#!/bin/bash
set -e


# -- Intro --
echo
echo ">> Niall's Dotfiles Installer <<"
echo


# -- Init --
echo "Step 1/14: Preparing system"
mkdir -p "${HOME}/.config"
brew update
echo


# -- Base: Bat --
echo "Step 2/14: Configuring bat"
brew install --formula bat
export BAT_CACHE_PATH="${HOME}/.cache/bat"
export BAT_CONFIG_DIR="${HOME}/.dotfiles/base/bat"
bat cache --build
echo


# -- Base: Eza --
echo "Step 3/14: Configuring eza"
brew install --formula eza
echo


# -- Base: FzF --
echo "Step 4/14: Configuring fzf"
brew install --formula fzf
echo


# -- Base: Starship --
echo "Step 5/14: Configuring starship"
brew install --formula starship
echo


# -- Base: Zoxide --
echo "Step 6/14: Configuring zoxide"
brew install --formula zoxide
echo


# -- Base: ZSH --
echo "Step 7/14: Configuring zsh"
ln -sfh "${HOME}/.dotfiles/mac/zsh/.zprofile" "${HOME}/.zprofile"
ln -sfh "${HOME}/.dotfiles/mac/zsh/.zshrc" "${HOME}/.zshrc"
echo


# -- Platform: macOS Desktop --
echo "Step 8/14: Configuring macOS desktop"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
echo


# -- Platform: macOS Dock --
echo "Step 9/14: Configuring macOS dock"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "autohide-time-modifier" -int "0"
defaults write com.apple.dock "show-recents" -bool "false"
echo


# -- Platform: Finder --
echo "Step 10/14: Configuring finder"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.Finder "FXPreferredViewStyle" "clmv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"
echo


# -- Platform: Ghostty --
echo "Step 11/14: Configuring ghostty"
brew install --cask ghostty
ln -sfh "${HOME}/.dotfiles/mac/ghostty" "${HOME}/.config/ghostty"
echo


# -- Platform: macOS Keyboard --
echo "Step 12/14: Configuring keyboard"
mkdir -p "${HOME}/Library/KeyBindings"
ln -sfh "${HOME}/.dotfiles/mac/keyboard/DefaultKeyBinding.dict" "${HOME}/Library/KeyBindings/DefaultKeyBinding.dict"
echo


# -- Platform: Mission Control --
echo "Step 13/14: Configuring spaces"
defaults write com.apple.dock "mru-spaces" -bool "false"
echo


# -- Post Operations --
echo "Step 14/14: Restarting services"
killall Dock
killall Finder
echo


# -- Summary --
echo ">> Dotfiles installed <<"
echo
