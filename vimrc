set encoding=UTF-8
syntax on

set termguicolors

set autoindent
set expandtab
set softtabstop=2

set number
set relativenumber
set cursorline

set textwidth=80
set ruler

set showmatch
set hlsearch
set incsearch
set smartcase

set directory=~/.vim/.swp/

set wildmenu
set wildmode=longest:list,full

set listchars=tab:»■,trail:■
set list

colorscheme base16-default-dark

let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack!

cnoreabbrev f Leaderf!

set laststatus=2
set noshowmode
let g:lightline = {
\  'active': {
\    'right' : [ [ 'lineinfo' ],
\                [ 'percent' ],
\                [ 'fileencoding' ] ],
\  },
\}
