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
set expandtab
set tabstop=2
set shiftwidth=2

syntax enable
set background=dark
"colorscheme solarized

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" .vimrc 最後の辺りに書く
" ファイルタイプ関連を有効にする
filetype plugin indent on

set wildmode=longest,full

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" s >でサブモードに入る
" 以降は < > + - でウィンドウサイズ変更
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')



" 参考
" http://qiita.com/NanohaAsOnKai/items/21054883b57f895875c0

" vim-ref {{{
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let g:ref_no_default_key_mappings = 1
let g:ref_cache_dir               = $HOME . '/.vim/vim-ref/cache'
let g:ref_detect_filetype         = {
\    'css':        'phpmanual',
\    'html':       ['phpmanual',  'javascript', 'jquery'],
\    'javascript': ['javascript', 'jquery'],
\    'php':        ['phpmanual',  'javascript', 'jquery']
\}
let g:ref_javascript_doc_path = $HOME . '/.vim/dein.vim/repos/github.com/tokuhirom/jsref/htdocs'
let g:ref_jquery_doc_path     = $HOME . '/.vim/dein.vim/repos/github.com/mustardamus/jqapi'
let g:ref_phpmanual_path      = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_use_cache           = 1
let g:ref_use_vimproc         = 1
"}}}


" taglist.vim {{{
"MEMO:$ ctags --list-maps : ctags supported filetype.
"MEMO:$ ctags --list-kinds: ctags tlist setting.
nnoremap <Leader>t :<C-u>Tlist<CR>
let g:tlist_javascript_settings = 'js;o:object;f:function'
let g:tlist_php_settings        = 'php;c:class;f:function;d:constant'
let g:Tlist_Exit_OnlyWindow     = 1
let g:Tlist_Show_One_File       = 1
let g:Tlist_Use_Right_Window    = 1
let g:Tlist_WinWidth            = 25
"}}}

".vimrc.localみたいな感じでGitHub管理外でよしなに管理する
let s:vimrc_local_file = s:home . "/.vimrc.local"
if filereadable(s:vimrc_local_file)
  execute 'source ' . s:vimrc_local_file
endif

" vim-qfstatusline {{{
function! MyStatuslineSyntax() abort "{{{
    let l:ret = qfstatusline#Update()
    if 0 < len(l:ret)
        if s:lineUpdate is# 0
            highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Magenta guibg=Magenta
            let s:lineUpdate = 1
        endif
    elseif s:lineUpdate is# 1
        highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Grey guibg=Grey
        let s:lineUpdate = 0
    endif
    return l:ret
endfunction "}}}

function! MyStatuslinePaste() abort "{{{
    if &paste is# 1
        return '(paste)'
    endif
    return ''
endfunction "}}}

let g:Qfstatusline#UpdateCmd = function('MyStatuslineSyntax')
set laststatus=2
set cmdheight=1
set statusline=\ %t\ %{MyStatuslinePaste()}\ %m\ %r\ %h\ %w\ %q\ %{MyStatuslineSyntax()}%=%l/%L\ \|\ %Y\ \|\ %{&fileformat}\ \|\ %{&fileencoding}\ 
"}}}

" vim-quickrun {{{
function! EslintFix() abort "{{{
    let l:quickrun_config_backup                  = g:quickrun_config['javascript']
    let g:quickrun_config['javascript']['cmdopt'] = l:quickrun_config_backup['cmdopt'] .' --config '. $HOME .'/.eslintrc.js --fix'
    let g:quickrun_config['javascript']['runner'] = 'system'

    QuickRun

    let g:quickrun_config['javascript'] = l:quickrun_config_backup
endfunction "}}}

nnoremap <Leader>run  :<C-u>QuickRun<CR>
nnoremap <Leader>es   :<C-u>call<Space>EslintFix()<CR>
let s:quickrun_config_javascript = {
\    'command':     'eslint',
\    'cmdopt':      '--cache --cache-location ' . s:home . '/.cache/eslint/.eslintcache --format compact --max-warnings 1 --no-color --no-ignore --quiet',
\    'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m,%-G%.%#',
\    'exec':        '%c %o %s:p'
\}
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 1,
\        'hook/close_buffer/enable_failure':    1,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           600
\    },
\    'javascript': {
\        'command':     s:quickrun_config_javascript['command'],
\        'cmdopt':      s:quickrun_config_javascript['cmdopt'] . ' --config ' . s:home . '/.eslintrc.js',
\        'errorformat': s:quickrun_config_javascript['errorformat'],
\        'exec':        s:quickrun_config_javascript['exec']
\    },
\    'javascript/watchdogs_checker': {
\        'type': 'watchdogs_checker/javascript'
\    },
\    'watchdogs_checker/_': {
\        'hook/close_quickfix/enable_exit':        1,
\        'hook/back_window/enable_exit':           0,
\        'hook/back_window/priority_exit':         1,
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 2,
\        'outputter/quickfix/open_cmd':            ''
\    },
\    'watchdogs_checker/javascript': {
\        'command':     s:quickrun_config_javascript['command'],
\        'cmdopt':      s:quickrun_config_javascript['cmdopt'] . ' --config ' . s:home . '/.eslintrc.limit.js',
\        'errorformat': s:quickrun_config_javascript['errorformat'],
\        'exec':        s:quickrun_config_javascript['exec']
\    }
\}
unlet s:quickrun_config_javascript
"}}}

