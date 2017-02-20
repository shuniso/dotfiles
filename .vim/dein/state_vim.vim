if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/shuniso/dotfiles/.vim/init.vim', '/home/shuniso/dotfiles/.vim/.dein.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/shuniso/.vim/dein'
let g:dein#_runtime_path = '/home/shuniso/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/shuniso/.vim/dein/.cache/init.vim'
let &runtimepath = '/home/shuniso/.vim/dein/repos/github.com/Shougo/dein.vim,/home/shuniso/.vim,/home/shuniso/.vim/dein/.cache/init.vim/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/shuniso/.vim/after,/home/shuniso/.vim/dein/.cache/init.vim/.dein/after'
