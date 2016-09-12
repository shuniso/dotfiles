if [[ -f ~/.path ]]; then
    source ~/.path
else
    export DOTPATH="${0:A:t}"
fi
export VITAL_PATH="$DOTPATH/etc/lib/vital.sh"
if [[ -f $VITAL_PATH ]]; then
    source "$VITAL_PATH"
fi

typeset -U path cdpath fpath manpath

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

### pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})


# Add ~/bin to PATH
PATH=~/bin:$PATH

# GCC
LIBDIR=/usr/local/gcc-4.9.3/lib/../lib64
export LD_LIBRARY_PATH=$LIBDIR
export LD_RUN_PATH=$LIBDIR
PATH=/usr/local/gcc-4.9.3/bin:$PATH

# PATHs
NODEBREW_HOME=$HOME/.nodebrew/current/bin
PATH=$NODEBREW_HOME:$PATH

PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH=$PATH

KEYDIR=$HOME/.keys
if [ -e $KEYDIR ]; then
    if ls $KEYDIR/*.sh > /dev/null 2>&1 
    then
        for i in "$HOME"/.keys/*.sh
        do
            if [ -f "$i" ]; then
                source $i
            else
                continue
            fi
        done
    fi
fi
