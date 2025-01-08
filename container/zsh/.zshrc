# -- Starship --
export STARSHIP_DISTRO=""


# -- Base Configuration --
source "${HOME}/.dotfiles/base/zsh/core.zshrc"


# -- Base Completions --
source "${HOME}/.dotfiles/base/zsh/completions.zshrc"
_setup_completions_dotnet
_setup_completions_npm
