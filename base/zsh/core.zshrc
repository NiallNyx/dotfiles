# -- Bat --
export BAT_CACHE_PATH="${HOME}/.cache/bat"
export BAT_CONFIG_DIR="${HOME}/.dotfiles/base/bat"
alias cat="bat"
alias catp="bat --plain"


# -- Eza --
export EZA_CONFIG_DIR="${HOME}/.dotfiles/base/eza"
alias ls="eza --oneline --icons --all --group-directories-first"


# -- FZF --
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
source <(fzf --zsh)


# -- Git --
alias gclone="git clone --recursive"


# -- History --
HISTFILE="${HOME}/.zsh_history"
HISTDUP=erase
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# -- Starship --
export STARSHIP_CACHE="${HOME}/.cache/starship"
export STARSHIP_CONFIG="${HOME}/.dotfiles/base/starship/starship.toml"
eval "$(starship init zsh)"


# -- Zoxide --
export _ZO_DATA_DIR="${HOME}/.local/share/zoxide"
alias cd="z"
eval "$(zoxide init zsh)"


# -- ZSH: Zinit Configuration --
declare -A ZINIT
ZINIT[BIN_DIR]="${HOME}/.local/share/zinit/zinit.git"
ZINIT[HOME_DIR]="${HOME}/.local/share/zinit"
[ ! -d ${ZINIT[BIN_DIR]} ] && mkdir -p "$(dirname ${ZINIT[BIN_DIR]})"
[ ! -d ${ZINIT[BIN_DIR]}/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT[BIN_DIR]}"
source "${ZINIT[BIN_DIR]}/zinit.zsh"


# -- ZSH: Zinit Plugins --
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab


# -- ZSH: Zinit Completions --
autoload -Uz compinit && compinit
zinit cdreplay -q
