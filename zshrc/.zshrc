# -------------------------------------------------
# Configuración ZSHRC
# -------------------------------------------------



# -------------------------------------------------
# Exports
export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"


# -------------------------------------------------
# Personalización
# POSH=agnoster

# -------------------------------------------------
# Plugins oh-my-zsh
plugins=(
	git
	sudo
	web-search
	archlinux
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	copyfile
	copybuffer
	dirhistory
)

# -------------------------------------------------
# Configuración oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -------------------------------------------------
# Configuración FZF key (CTRL R para el buscador del historial fuzzy)
source <(fzf --zsh)

# -------------------------------------------------
# Historial ZSH
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -------------------------------------------------
# PROMPT
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/EDM115-newline.omp.json)"

# -------------------------------------------------
# ALIAS
alias c='clear'
alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias v='$EDITOR'
alias vim='$EDITOR'
alias sudo='sudo -E'
alias xrdp='xfreerdp3 /u:adminrb /d:aytotias '
# alias ssh='kitty +kitten ssh -A'

# -------------------------------------------------
# AUTOSTART
if [ -f /bin/hyprctl ]; then
	fastfetch --config examples/12
fi

