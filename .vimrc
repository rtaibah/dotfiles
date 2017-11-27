" One .vimrc File To Rule Them All.
" Version: 1.0.1
" Last Change: 28-09-2016 11:22 AM GMT+3
" Author: Rami Taibah
" Maintainer: http://rtaibah.com
" License: http://opensource.org/licenses/bsd-license.php
"


set nocompatible              " be iMproved, required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               VIM-PLUG									  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Vim General Plugins
Plug 'scrooloose/nerdtree'
Plug 'ajh17/Spacegray.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'Raimondi/delimitMate' "find something better
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'

" Coding Plugins
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Javascript-specific Plugins
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'mxw/vim-jsx'

" Python-specific Plugins
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               GENERAL SETTINGS                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" watch .vimrc for changes and reload
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set dir=~/.vimswap//,/var/tmp//,/tmp//,. " Swap files locaiton
set encoding=utf-8 " Disable VI compatibility mode.
set cursorline " Highlight cursor line.
set showmatch " Highlight matching bracket.
set hlsearch " Highlight all search patterns
:set number " Add line numbers.
set incsearch " Incremental search.
set ignorecase smartcase " Search case unsensetive unless contains uppercase
set ruler " Show line and column number
set showmode " Show the current mode.
set scrolloff=5 " Keep at least 5 line around the cursor.
set laststatus=2 " Always show a status line.
set mouse=a " Enable mouse
set mousehide " Hide when characters are typed
set backspace=2 " make backspace work like most other apps"

" Relative line number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-I> :call NumberToggle()<CR>

" Switching to paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               TEXT FORMATTING                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Flag Unnecessary Whitspace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.js,*.html,*.scss,*.css match BadWhitespace /\s\+$/

set number
set smartindent
set tabstop=2 " Just so that files with tabs can be displayed properly.
set shiftwidth=2
set expandtab " Expand <Tab> with space.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               MAPPINGS                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader
:let mapleader=","

" Remap jj to escape in insert mode.
inoremap jj <Esc>

" Move up and down within a single line that's word-wrapped
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Enable folding with the spacebar.
nnoremap <space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               FOLDING                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent
set foldlevelstart=99
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               STYLE                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add a color column.
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Color scheme
set background=dark
colorscheme spacegray
let g:spacegray_italicize_comments = 1
let g:spacegray_underline_search = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               JS SETTINGS                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1

"enable keyboard shortcuts
let g:tern_map_keys=1

""show argument hints
let g:tern_show_argument_hints='on_hold'

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype *.jsx setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PYTHON SETTINGS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Make code look pretty
let python_highlight_all=1

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGINS SETTINGS                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-flake8 settings
autocmd BufWritePost *.py call Flake8()

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Enable simplyfold plugin
let g:SimpylFold_docstring_preview = 1 " Enable.

" Airline settings
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" tmux-line
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 noet
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235

" This should be in general settings, but for some reason it's being
" overwritten by the file
hi MatchParen cterm=none ctermbg=green ctermfg=blue

" FZF
imap <c-x><c-l> <plug>(fzf-complete-line) "Line completion"

" Prettier
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 120 
let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
