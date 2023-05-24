" General

set encoding=UTF-8
syntax on

set termguicolors

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=4

set number
set relativenumber
set cursorline

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

set foldmethod=indent
set nofoldenable

colorscheme base16-default-dark

nnoremap <C-c> :q<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>
" nnoremap <C-S> :w !sudo tee %<cr>
" inoremap <C-S> <Esc>:w !sudo tee %<cr>

" tmux style window operations
nnoremap <C-h>o <C-w><C-w>
nnoremap <esc>r <C-w><C-w>
nnoremap <C-h>c :tab sp<cr>
nnoremap <C-h>cc <C-w>T
nnoremap <C-h>" <C-w>s
nnoremap <C-h>% <C-w>v

" Go to tab by number
noremap <C-h>1 1gt
noremap <C-h>2 2gt
noremap <C-h>3 3gt
noremap <C-h>4 4gt
noremap <C-h>5 5gt
noremap <C-h>6 6gt
noremap <C-h>7 7gt
noremap <C-h>8 8gt
noremap <C-h>9 9gt

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <esc>w :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <esc>w :exe "tabn ".g:lasttab<cr>

nnoremap <esc>e :bp<cr>
" nnoremap <esc>E :bn<cr>
nnoremap <C-x> :bd<cr>
" nnoremap <esc>w gt
" nnoremap <esc>W gT
nnoremap <C-f> <C-d>
nnoremap <C-b> <C-u>

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

nnoremap <leader>n :Lexplore<cr>:vertical resize 50<cr>
nnoremap <leader>m :marks<cr>

" Plugins

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/etc/gtags/gtags.conf'
let g:Lf_RgConfig = [
  \ "--heading"
\]
cnoreabbrev f Leaderf
nnoremap <leader>t :Leaderf --left bufTag --nowrap<cr><Tab>:vertical resize 50<cr>
nnoremap <leader>r :Leaderf mru<cr><Tab>
nnoremap <leader>g :Leaderf rg --fullScreen<cr>
nnoremap <leader>a :<C-U><C-R>=printf("Leaderf! rg --fullScreen -e %s --heading", expand("<cword>"))<CR><cr><Tab>
" nnoremap <leader>g :<C-U>Leaderf! rg --fullScreen --heading<cr>

nnoremap gh :w<cr>:CocCommand clangd.switchSourceHeader<cr>


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
\             [ 'gitbranch', 'filename' ],
\             [ 'readonly' ] ],
\   'right' : [ [ 'lineinfo' ],
\               [ 'percent' ],
\               [ 'fileencoding' ] ],
\ },
\ 'inactive': {
\   'left': [ [ 'filename' ],
\             [ 'gitbranch' ] ],
\   'right' : [ ],
\ },
\ 'component_function' : {
\   'gitbranch' : 'gitbranch#name'
\ }
\}

set updatetime=300
nmap <leader>cn <Plug>(coc-rename)
nmap <leader>fx <Plug>(coc-fix-current)
nmap <esc>d <Plug>(coc-definition)
nmap <esc>s <Plug>(coc-type-definition)
nmap <esc>f <Plug>(coc-references)
nnoremap <leader>ff :call CocAction('format')<cr>
nnoremap <leader>fi :CocCommand pyright.organizeimports<cr>
noremap <leader>o  :<C-u>CocList outline<cr>

let g:coc_global_extensions = ['coc-html', 'coc-json', 'coc-pyright', 'coc-clangd', 'coc-java', 'coc-sh', 'coc-snippets', 'coc-tsserver', 'coc-word', 'coc-xml', 'coc-yaml']
