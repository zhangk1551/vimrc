" General

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

nnoremap <C-c> :q<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>
nnoremap <C-S> :w !sudo tee %<cr>
inoremap <C-S> <Esc>:w !sudo tee %<cr>

" tmux style window operations
nnoremap <C-h>o <C-w><C-w>
nnoremap <esc>r <C-w><C-w>
nnoremap <C-h>c :tab sp<cr>
nnoremap <C-h>cc <C-w>T
nnoremap <C-h>" <C-w>s
nnoremap <C-h>% <C-w>v

nnoremap <esc>e :bp<cr>
nnoremap <C-x> :bd<cr>
nnoremap <esc>w gt

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <esc>f <S-Right>
cnoremap <esc>b <S-Left>

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <esc>f <S-Right>
inoremap <esc>b <S-Left>

nnoremap <leader>n :Vex<cr>
nnoremap <leader>m :marks<cr>

" Plugins

cnoreabbrev f Leaderf
nnoremap <leader>t :Leaderf --left bufTag<cr><Tab>
nnoremap <leader>r :Leaderf mru<cr>
nnoremap <leader>g :Leaderf rg<cr>
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/usr/share/gtags/gtags.conf'

function! GetAsyncrunSaveAndRunCommand()
  if &ft == 'python'
    execute "w"
    execute "AsyncRun -raw python %"
    execute "copen"
  else
    echo "file type not support"
  endif
endfunction

nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<cr>
nnoremap <leader>rr :call GetAsyncrunSaveAndRunCommand()<cr>
cnoreabbrev a AsyncRun
cnoreabbrev as AsyncStop

let g:asyncrun_status = ''
function! GetAsyncrunStatus()
  if &ft == 'qf'
    return g:asyncrun_status
  endif
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

set updatetime=300
nmap <leader>cn <Plug>(coc-rename)
nmap <leader>fx <Plug>(coc-fix-current)
nmap <esc>d <Plug>(coc-definition)
nmap <esc>s <Plug>(coc-type-definition)
nmap <esc>f <Plug>(coc-references)
nnoremap <leader>ff :call CocAction('format')<cr>
noremap <leader>o  :<C-u>CocList outline<cr>

let g:coc_global_extensions = ['coc-html', 'coc-json','coc-pyright', 'coc-sh', 'coc-snippets', 'coc-tsserver', 'coc-word', 'coc-xml']
