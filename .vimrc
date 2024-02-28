
syntax enable

set clipboard=unnamedplus

set number
set relativenumber

" Enable mouse support
set mouse=a

" Enable filetype detection
filetype plugin indent on

" Ignore case when searching
set ignorecase

" Enable smart indentation
set smartindent

" Enable auto-indentation
set autoindent

" Show matching brackets
set showmatch

" Enable syntax highlighting for Markdown files
augroup markdown
    autocmd!
    autocmd FileType markdown setlocal spell
augroup END

" Key mappings
" Save file with Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Switch between split windows with Ctrl+h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map :W to write as sudo (useful for editing protected files)
command W :execute 'silent w !sudo tee % >/dev/null' | :edit!

