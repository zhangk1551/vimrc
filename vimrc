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

set backupdir=~/.vimbackup/
set directory=~/.vimswp/
set undodir=~/.vimundo/

set wildmenu
set wildmode=longest:list,full

set listchars=tab:»■,trail:■
set list

colorscheme base16-default-dark

let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack!

cnoreabbrev f Leaderf
nnoremap <leader>t :Leaderf bufTag<cr><Tab>
nnoremap <esc>d :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR> 
nnoremap <esc>r :<C-U><C-R>=printf("Leaderf! gtags -r %s", expand("<cword>"))<CR><CR> 
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/usr/share/gtags/gtags.conf'

nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<cr>
cnoreabbrev a AsyncRun
cnoreabbrev as AsyncStop

let g:asyncrun_status = ''
function! GetAsyncrunStatus()
  :if &ft == 'qf'
  : return g:asyncrun_status
  :endif
  return ''
endfunction

set laststatus=2
set noshowmode
let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'readonly', 'filename' ],
\             [ 'asyncrun' ] ],
\   'right' : [ [ 'lineinfo' ],
\               [ 'percent' ],
\               [ 'fileencoding' ] ],
\ },
\ 'inactive': {
\   'left': [ [ 'filename' ],
\             [ 'asyncrun' ] ],
\   'right' : [ ],
\ },
\ 'component_function' : {
\   'asyncrun' : 'GetAsyncrunStatus'
\ }
\}

let g:coc_global_extensions = ['coc-json', 'coc-python']
