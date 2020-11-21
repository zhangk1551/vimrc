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

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <esc>f <S-Right>
cnoremap <esc>b <S-Left>

inoremap <C-A> <Home>
cnoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <esc>f <S-Right>
inoremap <esc>b <S-Left>


" Plugins

cnoreabbrev f Leaderf
nnoremap <leader>t :Leaderf bufTag<cr><Tab>
nnoremap <leader>m :Leaderf mru<cr><Tab>
nnoremap <leader>g :Leaderf rg<cr><Tab>
nnoremap <esc>d :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR> 
nnoremap <esc>r :<C-U><C-R>=printf("Leaderf! gtags -r %s", expand("<cword>"))<CR><CR> 
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
nnoremap <leader>r :call GetAsyncrunSaveAndRunCommand()<cr>
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
nmap <leader>cf <Plug>(coc-fix-current)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
let g:coc_global_extensions = ['coc-java', 'coc-json', 'coc-python', 'coc-sh', 'coc-snippets', 'coc-word']
