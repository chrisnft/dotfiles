export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_STATE_HOME=${HOME}/.state
export XDG_FONTS_HOME=${HOME}/.local/share/fonts
export XDG_DOTFILES_HOME=${HOME}/.dotfiles
export XDG_BIN_HOME=${HOME}/.local/bin
# ZSH
export ZDOTDIR=${HOME}/.config/zsh
export ZSH=${XDG_DATA_HOME}/oh-my-zsh
export ZSH_CUSTOM=${HOME}/.config/zsh/custom
# NPM global directory if nvm not used
export NPM_CONFIG_PREFIX=${HOME}/.npm-global
# PATH
export PATH=${NPM_CONFIG_PREFIX}/bin:${XDG_BIN_HOME}:/usr/local/bin:/usr/local/sbin/:/usr/bin:/usr/sbin:/bin
