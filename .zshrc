# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY

export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
export PATH="$PATH:/usr/bin/python"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:~/.zplug/repos/rupa/z"

# zsh users
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src $fpath)
source ~/.zplug/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zplug/repos/rupa/z/z.sh
source ~/.zplug/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zplug/repos/changyuheng/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
# Spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_INSERT="\uf8ea"
SPACESHIP_VI_MODE_NORMAL="\uf6b5"
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# exa
alias ls='exa -laahH --git --icons'
alias la='exa -lahgH --git --icons'
alias ll='exa -lhg --git --icons'
alias lt='exa -aT --icons'

export BAT_THEME="TwoDark"
export FZF_ALT_T_COMMAND="fdfind --type d --hidden --follow --exclude .git 2>/dev/null"
export FZF_DEFAULT_COMMAND="fdfind --hidden --exclude .git"
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_COMPLETION_TRIGGER=''
export FZF_CTRL_T_COMMAND="fdfind --hidden --follow --exclude .git 2>/dev/null"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '(bat --color always --style numbers --theme TwoDark {} || coderay {} || highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}


alias rangervim='ranger --choosefile=/mnt/c/Users/Tate/temp/vim_ranger_current_file' 

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}


bindkey -s '^O' 'ranger-cd\n'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# bindkey '^[[1;5A' history-substring-search-up
# bindkey '^[[1;5B' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
