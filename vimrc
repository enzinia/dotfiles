" ====================================================
" Vundle configuration
" ====================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'

" UI
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Complete
" Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Python
Plugin 'klen/python-mode'
" Plugin 'davidhalter/jedi-vim'

" Rails
Plugin 'tpope/vim-rails'

call vundle#end()            " required
filetype plugin indent on    " required

" ====================================================
" VIM common
" ====================================================
set number
set shiftwidth=2
set tabstop=2
set softtabstop=2
set hlsearch
set smarttab
set expandtab
set smartindent
set history=1000
set list
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·,eol:¬
set showcmd
let mapleader="\\"
set splitright
set completeopt-=preview
set hidden
set confirm
syntax on
colorscheme ron

map  <F1>       :set paste! <CR>:set paste? <CR>
imap <F1> <C-O> :set paste<CR>

vmap <F2> "+y

map <F3> :NERDTreeToggle<CR>

map <F4> :TagbarToggle<CR>

imap <F5> <Esc> :bp <CR>i
map  <F5> :bp <CR>

imap <F6> <Esc> :bn <CR>i
map <F6> :bn <CR>

" Wipe buffer by Ctrl+Q
map <C-q> :bw<CR>

" Paste with buffer clearing
vnoremap p "_dP

" 80 char highlight
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
    autocmd FileType ruby set sw=2 sts=2 et
augroup END

" Django templates
fun! DetectTemplate()
    let n=1
    while n < line("$")
        if getline(n) =~ '{%' || getline(n) =~ '{{'
            set ft=htmldjango
            return
        endif
        let n = n + 1
    endwhile
    set ft=html
endfun

" Files handling
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.html call DetectTemplate()

" ====================================================
" Plugins settings
" ====================================================
let g:pymode_python = 'python3'
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 120
let g:pymode_lint_ignore = "E501"

let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

let NERDTreeIgnore = ['\~$','\.pyc$','\.pyo$','\.class$','pip-log\.txt$','\.o$']

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

set laststatus=2
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:ycm_python_library_path = 'python3'
let g:ycm_collect_identifies_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifies_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
