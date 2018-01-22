set nocompatible

" ***********************************************************************************************************
" MAPPINGS
" ***********************************************************************************************************
let mapleader = ","

cabbrev W w

inoremap jk <esc>

vmap <C-c> "*y
nmap <C-p> "*p

nnoremap tl gt
nnoremap th gT
nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap to :tabonly<CR>

map <Leader>f :Files .<CR>

map \           :NERDTreeToggle<CR>
map \|          :NERDTreeFind<CR>
map <leader>/   <plug>NERDCommenterToggle

map <leader>, :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>m :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" ***********************************************************************************************************
" SETTINGS
" ***********************************************************************************************************
set number
set nowrap
set cursorline                      " Highlight current line

set hls
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

set incsearch                       " Incremental search
set ignorecase
set smartcase                       " Smart case-sensitivity when searching

set laststatus=2                    " Always show statusline

set expandtab                       " Use softtabs
set tabstop=2                       " Tab settings
set autoindent
set smarttab                        " Use shiftwidth to tab at line beginning
set shiftwidth=2                    " Width of autoindent

set splitbelow                      " Horizontal split below
set splitright                      " Vertical split right

set mouse=a
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.* call StripTrailingWhitespace()
" ***********************************************************************************************************
" ALE
" ***********************************************************************************************************
let g:ale_linters = {
\   'html': ['htmlhint'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'scss': ['stylelint']
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" ***********************************************************************************************************
" FZF
" ***********************************************************************************************************
let g:fzf_layout = { 'down': '~25%' }

" ***********************************************************************************************************
" NERDCOMMENTER
" ***********************************************************************************************************
let NERDSpaceDelims=1

" ***********************************************************************************************************
" QUANTUM
" ***********************************************************************************************************
syntax enable
set background=dark
set termguicolors
colorscheme quantum

let g:airline_theme='quantum'

" ***********************************************************************************************************
" PLUGINS
" ***********************************************************************************************************
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()
