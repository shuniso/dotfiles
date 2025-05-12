# プラグイン
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# プロンプト
eval "$(starship init zsh)"

#######
# envs
#######
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

# Rust
export PATH=$HOME/.cargo/bin:$PATH

#####
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

#####
# 外部設定
#####
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

if [[ -f ~/.zshrc.func ]]; then
    source ~/.zshrc.func
fi
export TESSDATA_PREFIX="/usr/local/share/tessdata"
