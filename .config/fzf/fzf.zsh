# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "$XDG_CONFIG_HOME/fzf/completion.zsh"

# Key bindings
# ------------
source "$XDG_CONFIG_HOME/fzf/key-bindings.zsh"
