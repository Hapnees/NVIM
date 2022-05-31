syntax enable

set nocompatible
filetype off

set t_Co=256

set nu
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

set mousehide
set mouse=a

set novisualbell
set t_vb=
set backspace=indent,eol,start, whichwrap+=<,>,[,]
set showtabline=0
" set foldcolumn=1

set wrap
set linebreak

set nobackup
set noswapfile
set termguicolors
set background=dark

set clipboard+=unnamedplus

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'neoclide/coc-emmet'
Plug 'mattn/emmet-vim'
Plug 'overcache/NeoSolarized'
Plug 'xiyaowong/nvim-transparent'
" Plug 'ap/vim-css-color'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

call plug#end()

colorscheme NeoSolarized
" autocmd BufWritePre * :%s/\s\+$//e
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 1

let g:neosolarized_termtrans=1
let g:transparent_enabled = v:true

"colorscheme molokai
"colorscheme OceanicNext
"colorscheme PaperColor
"colorscheme onedark
let g:airline_theme="jellybeans"
"let g:airline_theme="onedark"

set encoding=UTF-8
set fileencoding=utf-8
set guifont="Hack Nerd Font"

augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

"  Foldig
set foldmethod=indent
set foldlevel=99
" zR to open all folds
" zM to close all folds
" za toggle a fold

"  ALIAS
cnoreabbrev config C:\Users\napod\AppData\Local\nvim\init.vim

"  BIND
imap jk <Esc>
imap ( ()<left>
imap [ []<left>
imap { {}<left>

nmap qq :x!<CR>
nmap [ :bp<CR>
nmap ] :bn<CR>
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP
"  VIM-SURROUND окружить символом
nmap t ysW
"  VIM-COMMENTARY
vmap c gc

"  NERDTREE
nmap <F3> :NERDTreeToggle<CR>
nmap <F2> :NERDTree %<CR>
"  ALE
nmap <F4> :lopen<CR>

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
" открывать NerdTree при запуске nvim
au VimEnter * NERDTree

let g:user_emmet_leader_key='<C-S>'


let g:jedi#popup_select_first = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1

let g:ale_linters = {'python': ['pep8', 'flake8'], 'javascript': ['prettier', 'eslint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['isort', 'yapf'] , 'javascript': ['eslint']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
