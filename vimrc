set nocompatible

" ***********************************************************************************************************
" MAPPINGS
" ***********************************************************************************************************
let mapleader = ","

cabbrev W w
nnoremap Q :q<CR>

inoremap jk <esc>
inoremap jj <esc>

vnoremap `` <esc>
nnoremap `` <esc>

vmap <C-c> "*y
nmap <C-p> "*p

nnoremap tl gt
nnoremap th gT
nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap to :tabonly<CR>

map <Leader>t :FZF<CR>
map <Leader>f :Buffer<CR>

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
set shiftwidth=2                    " Width of autoindent
set autoindent
set smarttab                        " Use shiftwidth to tab at line beginning

set splitbelow                      " Horizontal split below
set splitright                      " Vertical split right

set mouse=a
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.* call StripTrailingWhitespace()

set autowriteall                   " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall
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
" Gruvbox
" ***********************************************************************************************************
colorscheme gruvbox
set background=dark

