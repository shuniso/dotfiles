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

for i in "$HOME"/.keys/*.sh
do
    if [ -f "$i" ]; then
        source $i
    else
        continue
    fi
done
