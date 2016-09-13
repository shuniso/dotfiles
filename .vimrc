" .vimrc 始めの辺りに書く
" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off


"
" Startup / NeoBundle (Plugins)
"
let s:home = expand("<sfile>:h")
let s:init_file = s:home . "/.vim/init.vim"

if filereadable(s:init_file)
  execute 'source ' . s:init_file
endif

"
" Settings
"
set nu
set backspace=indent,eol,start
set hlsearch
set ruler
set number
set noswapfile
set title
set incsearch
set wildmenu wildmode=list:full

syntax enable
set background=dark
colorscheme solarized

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" .vimrc 最後の辺りに書く
" ファイルタイプ関連を有効にする
filetype plugin indent on
