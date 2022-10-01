# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tate/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tate/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tate/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tate/.fzf/shell/key-bindings.zsh"
