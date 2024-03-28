set nocompatible              " be iMproved, required filetype off                  " required

call plug#begin()

" Git
Plug 'tpope/vim-fugitive'

"Cntrl
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Bash
Plug 'itspriddle/vim-shellcheck'

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

" Python
Plug 'google/yapf', { 'rtp': 'plugins/vim' }

" C/C++
Plug 'derekwyatt/vim-fswitch'
Plug 'ycm-core/YouCompleteMe'
Plug 'bfrg/vim-cpp-modern'

" Color scheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Yocto
Plug 'git://git.yoctoproject.org/poky-contrib', { 'rtp' : 'bitbake/contrib/vim' }

" Generic
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

" PlantUML
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'

" Guile
Plug 'HiPhish/guile.vim'
autocmd BufRead,BufNewFile *.scm set ft=scheme.guile

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'luochen1990/rainbow'

" A plugin that sends the current paragraph, or selected area to a
" configured target.
"
" The first time in a session when you'll want to send something to the
" target (via <Ctrl-C> <Ctrl-C>) it will ask you to point out which
" buffer is the vim terminal
Plug 'jpalardy/vim-slime'

call plug#end()

filetype plugin indent on    " required
"
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
noremap <leader>b :Git blame<CR>

" gchlog file settings
autocmd VimEnter *.gchlog $pu=strftime('%n%Y-%m-%d %H:%M:%S%n===================%n%n')
autocmd BufRead,BufNewFile *.gchlog set textwidth=80

" YCM configuration
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" let g:ycm_use_clangd = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_filter_diagnostics = {
\ "cpp": {
\      "regex": [ "Unknown.*", "Unsupported option.*" ],
\    },
\ "c": {
\      "regex": [ "Unknown.*", "Unsupported option.*" ],
\    }
\ }


let g:ycm_auto_hover=''

" fzf config
let $FZF_DEFAULT_COMMAND="ag -l -g \"\" --ignore .git --ignore .jj --ignore \"*.swp\" --ignore oe-workdir --ignore oe-logs --ignore venv --ignore build --skip-vcs-ignores "
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore tags', fzf#vim#with_preview(), <bang>0)

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatters_vue = ['eslint_local']
let g:formatters_python = ['yapf']
noremap <F3> :Autoformat<CR>

set noincsearch
set tabstop=8

" guile config
let g:slime_target = "vimterminal"
command GuileTerminal rightbelow vertical terminal guile

" Disabled by default, and only enabled for .scm files.
let g:rainbow_active = 0
autocmd BufRead,BufNewFile *.scm :RainbowToggleOn
