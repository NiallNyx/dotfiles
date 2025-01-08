# -- Docker Desktop: Completions --
FPATH="${HOME}/.docker/completions:${FPATH}"


# -- Homebrew: Completions --
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


# -- Homebrew: Utils --
function blist {
    echo "\n-- Packages --\n$(brew leaves | xargs brew desc --eval-all)"
    echo "\n-- Casks --\n$(brew ls --casks | xargs brew desc --eval-all)"
}

function bclean {
    brew update
    brew upgrade
    brew autoremove
    brew cleanup
}

function buninstall {
    brew uninstall --zap $1
    brew autoremove
    brew cleanup
}


# -- macOS: Utils --
function dsclean {
    echo "Removing .DS_Store files from $(pwd)"
    sudo find . -name ".DS_Store" -depth -exec echo {} \; -exec rm {} \;
}


# -- Starship --
export STARSHIP_DISTRO=""


# -- Base Configuration --
source "${HOME}/.dotfiles/base/zsh/core.zshrc"


# -- Base Completions --
source "${HOME}/.dotfiles/base/zsh/completions.zshrc"
_setup_completions_dotnet
