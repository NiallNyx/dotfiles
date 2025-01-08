# Niall's Dotfiles

The dotfiles I use across my systems.

## Dev Container Setup

> [!IMPORTANT]
> This script is designed to work on Debian 13+ containers.  
> Make sure you change `vscode` to the name of the user you use in the container.

To install the dotfiles into a dev container, you have a few options:

### Edit the Dockerfile

Use this method if you're already using a custom Dockerfile.

```dockerfile
# ...
RUN git clone https://github.com/NiallNyx/dotfiles.git /home/vscode/.dotfiles
RUN su -c /home/vscode/.dotfiles/scripts/setup-container.sh - vscode
# ...
```

### Post Create Command

Use this method if you're using a pre-made container image.

```json
{
  // ...
  "waitFor": "postCreateCommand",
  "postCreateCommand": "git clone https://github.com/NiallNyx/dotfiles.git /home/vscode/.dotfiles && su -c /home/vscode/.dotfiles/scripts/setup-container.sh - vscode"
  // ...
}
```

### Inside the container

Use this method if the dev container is already running.

```bash
git clone https://github.com/NiallNyx/dotfiles.git /home/vscode/.dotfiles
/home/vscode/.dotfiles/scripts/setup-container.sh
```

## macOS Setup

> [!IMPORTANT]
> This script is designed to work on systems running macOS Sequoia or later.  
> Make sure you have [Homebrew](https://brew.sh/) installed before running the script.

```bash
git clone https://github.com/NiallNyx/dotfiles.git "${HOME}/.dotfiles"
"${HOME}/.dotfiles/scripts/setup-mac.sh"
```
