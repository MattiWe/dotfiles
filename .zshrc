# Internal paths
ANTIGEN_PATH="${HOME}/opt/antigen-git/src/antigen"
POWERLINE_PATH="$(python3 -c "import site; print(site.getsitepackages()[0])")/powerline"


# Source custom environment variables (PATH etc.)
if [ -f "${HOME}/.env" ]; then
    source "${HOME}/.env"
fi

# Explicitly set LC_* locale to prevent tab completion issues for remote connections
export LC_CTYPE=${LANG}
export LC_ALL=${LANG}

# Load Antigen package manager
source "${ANTIGEN_PATH}/antigen.zsh"

antigen use oh-my-zsh

# Oh-my-zsh default plugins
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle encode64
antigen bundle git-extras
antigen bundle github
antigen bundle history
antigen bundle jsontools
antigen bundle pip
antigen bundle python
antigen bundle screen
antigen bundle sudo
antigen bundle systemd
antigen bundle wd

# Third-party plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Other ZSH extensions
autoload -U zmv

# Apply plugins and themes
antigen apply 2>&1 > /dev/null

# Powerline shell theme
powerline-daemon -q
source "${POWERLINE_PATH}/bindings/zsh/powerline.zsh"


# Proper umask (needed for WSL and maybe some other broken systems)
umask 022

# Tree-view for kill command completion
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

# Manage SSH keys with keychain
if $(command -v keychain > /dev/null); then
    keychain id_rsa
    source  ~/.keychain/$(hostname)-sh
fi
