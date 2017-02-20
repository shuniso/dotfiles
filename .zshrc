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

#######
# sudo用のpathを設定
#######
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

#######
# pathを設定
#######
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})
# Add ~/bin to PATH
PATH=~/bin:$PATH

#######
# GCC
#######
LIBDIR=/usr/local/gcc-4.9.3/lib/../lib64
export LD_LIBRARY_PATH=$LIBDIR
export LD_RUN_PATH=$LIBDIR
PATH=/usr/local/gcc-4.9.3/bin:$PATH

# PATHs
NODEBREW_HOME=$HOME/.nodebrew/current/bin
PATH=$NODEBREW_HOME:$PATH

PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# GO PATH
GOVER="$(cat  ~/.anyenv/envs/goenv/version)"
GODIR=$HOME/.anyenv/envs/goenv/versions/$GOVER/go
if [ ! -e $GODIR ]; then
       mkdir $GODIR
       echo "make new godir: $GODIR"
fi
export GOPATH=$GODIR
export PATH=$HOME/bin/my-util:$PATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

eval "$(direnv hook zsh)"


if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

if [[ -f ~/.zshrc.func ]]; then
    source ~/.zshrc.func
fi
