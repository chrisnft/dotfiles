# .zshrc
# ===============================================

# Reload 
# ===============================================
alias reload='omz reload'

# Prompt
# ==============================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# P10k
# =======================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$XDG_CONFIG_HOME/zsh/p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/p10k.zsh"

# History
# =======================================================
export HISTFILE=${XDG_CACHE_HOME}/zsh/history
export HISTFILESIZE=1000000000
export HISTSIZE=$HISTFILESIZE
export SAVEHIST=$HISTSIZE
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Immediate append to history
setopt INC_APPEND_HISTORY
# export HISTTIMEFORMAT="[%F %T] "
# Add timestamp to history
# setopt EXTENDED_HISTORY
# No duplicates
setopt HIST_IGNORE_ALL_DUPS

# Theme
# ===============================================
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
# ===============================================
plugins=(
	git
	brew
	copyfile
	copybuffer
	copydir
	history
	man
	pip
	ipfs
	jsontools
	rsync
	ssh-agent
	zsh-completions
	zsh-syntax-highlighting
	# zsh-autosuggestions
	# keychain
	# rg
	# fzf	
)

# For zsh-completions
autoload -U compinit && compinit

# Oh-My-ZSH
# ===============================================
source "${ZSH}/oh-my-zsh.sh"

# Cargo 
# =======================================================
[[ ! -f "${CARGO_HOME}/env" ]] || source "${CARGO_HOME}/env"

# NVM 
# =======================================================
[ -s "${NVM_DIR}/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # If file exists and greater than 0, source $NVM_DIR/nvm.sh
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  

# ITERM2
# =======================================================
test -e "${XDG_CONFIG_HOME}/iterm2/iterm2_shell_integration.zsh" && source "${XDG_CONFIG_HOME}/iterm2/iterm2_shell_integration.zsh"

# FZF 
# =======================================================
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source "${XDG_CONFIG_HOME}/fzf/fzf.zsh"
