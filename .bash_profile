# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

#PS1="$bldgrn\u@\h \W\$ $txtrst"
PS1="\W \$ "

PATH=$PATH:$HOME/bin

LANG=ja_JP.UTF-8
export LANG
export LC_CTYPE=$LANG

# GCC
LIBDIR=/usr/local/gcc-4.9.3/lib/../lib64
export LD_LIBRARY_PATH=$LIBDIR
export LD_RUN_PATH=$LIBDIR
PATH=/usr/local/gcc-4.9.3/bin:$PATH

# --- PATHs
NODEBREW_HOME=$HOME/.nodebrew/current/bin
PATH=$NODEBREW_HOME:$PATH

PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH=$PATH

# --- alias
alias vi='vim'

# --- Utility
function peco-lscd {
    local dir="$( ls -1d */ | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}

alias pcd='cd $(find . -maxdepth 1 -type d | peco)'

peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'


for i in "$HOME"/.keys/*.sh
do
    if [ -f "$i" ]; then
        source $i
    else
        continue
    fi
done


