set nocompatible              " be iMproved, required filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Git
Plugin 'tpope/vim-fugitive'

"Cntrl
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '40%' }

" Python
Plugin 'google/yapf', { 'rtp': 'plugins/vim' }

" C/C++
Plugin 'derekwyatt/vim-fswitch'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'bfrg/vim-cpp-modern'

" Color scheme
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'

" Yocto
Plugin 'kergoth/vim-bitbake'

" SystemTap
Plugin 'nickhutchinson/vim-systemtap'

" Generic
"Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-sleuth'
Plugin 'chiel92/vim-autoformat'

" React
Plugin 'MaxMEllon/vim-jsx-pretty'

" Node
Plugin 'moll/vim-node'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Color scheme

" tmux settings
"if &term =~# '256color' && ( &term =~# '^screen'  || &term =~# '^tmux' )
"	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
"set termguicolors

set background=dark
set t_Co=256
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

syntax on
set autoindent
filetype plugin indent on

set number
set hlsearch

set list
set listchars=tab:··,trail:-,nbsp:⎵ 
autocmd FileType python setlocal expandtab
autocmd FileType html setlocal expandtab
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd BufRead,BufNewFile *.waveapp set filetype=xml
autocmd BufRead,BufNewFile *.env set filetype=xml
autocmd BufRead,BufNewFile *.conf set filetype=xml shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.qml set filetype=javascript

" Keyboard mappings "
map <C-N> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
nnoremap <C-K> :Files<CR>
nnoremap <C-@> :Buffers<CR>
nnoremap <F2> :YcmCompleter GoToDeclaration<CR>
nnoremap <F7> :Ag <C-R><C-W><CR>
noremap <silent> <F4> :FSHere<cr>
noremap <leader>b :Gblame<CR>

" gchlog file settings
autocmd VimEnter *.gchlog $pu=strftime('%n%Y-%m-%d %H:%M:%S%n===================%n%n')
autocmd BufRead,BufNewFile *.gchlog set textwidth=80

" YCM configuration
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_use_clangd = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = exepath("clangd")

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatters_vue = ['eslint_local']
let g:formatters_python = ['yapf']
noremap <F3> :Autoformat<CR>

set rtp+=~/dev/fzf

set noincsearch
