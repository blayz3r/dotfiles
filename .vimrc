call plug#begin('~/.vim/plugged')
"Enhance editing
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-repeat'
Plug 'rakr/vim-one'
Plug 'tpope/vim-surround'
"IDE experience
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'lilydjwg/colorizer'
Plug 'osyo-manga/vim-precious', { 'for': 'markdown' }
Plug 'Shougo/context_filetype.vim'
"Enhance motions
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'mg979/vim-visual-multi'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'junegunn/vim-after-object'
"Python
Plug 'ehamberg/vim-cute-python'
Plug 'tweekmonster/braceless.vim'
Plug 'itchyny/lightline.vim'
call plug#end()
"General {{{

"" Files, backups and undo
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set number                     " Show current line number
set relativenumber             " Show relative line numbers

"Short for completion
inoremap <C-Space> <C-x><C-o>

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on
set autoindent

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
nnoremap <C-Space> :WhichKey ','<CR>
nnoremap <C-\> :WhichKey '\'<CR>
let g:which_key_use_floating_win = 0
"Let working directory be current
autocmd BufEnter * silent! lcd %:p:h

set splitbelow
set splitright
set foldmethod=marker foldlevel=0

"" Fast saving
nmap <leader>w :w!<cr>
set undofile
set undoreload=10000
set undolevels=10000

"Use Directx rendering
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

"" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"
"" Quickly open a buffer for scribble
map <leader>e :enew<cr>

"Close quickfix
map  <leader>q :cclose<cr>

"" Toggle paste mode on and off
map <leader>px :setlocal paste!<cr>

"  Spell checking
" Pressing ,sx will toggle and untoggle spell checking
map <leader>sx :setlocal spell!<cr>
nnoremap <Home> :e ~/_vimrc<CR>
"}}}
"VIM user interface {{{
"" Set 7 lines to the cursor - when moving vertically using j/k
"" Turn on the WiLd menu
set wildmenu
set wildmode=list:full,full
"" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"
""Always show current position
set ruler
"
"" Height of the command bar
set cmdheight=1
" Add the unnamed register to the clipboard
set clipboard+=unnamed
"use vim internal diff
set diffopt+=internal,algorithm:patience
" Add ignorance of whitespace to diff
set diffopt+=iwhite

"" A buffer becomes hidden when it is abandoned
set hid
"
"" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
"" Ignore case when searching
set ignorecase
"
"" When searching try to be smart about cases
set smartcase
"
"" Highlight search results
set hlsearch
"
"" Makes search act like search in modern browsers
set incsearch
"
"" Don't redraw while executing macros (good performance config)
set lazyredraw
"
"" For regular expressions turn magic on
set magic
"
" Show matching brackets when text indicator is over them
set showmatch
"" How many tenths of a second to blink when matching brackets
set mat=2
"
" Enable syntax highlighting
syntax enable
set number
"Sneak colours
autocmd ColorScheme * hi SneakLabel gui=reverse guifg=fg guibg=bg 
set termguicolors
" autocmd ColorScheme * hi Sneak gui=reverse guifg=fg guibg=bg
autocmd ColorScheme * hi! link Sneak Normal
colorscheme one
"menu color
set background=dark
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'"

set previewpopup=height:10,width:60,border:off
" esc in normal mode clears search highlighting
"Font
" set guifont=FiraCode_NF:h11:cANSI:qDRAFT
set guifont=FuraMono_NF:h11:cANSI:qDRAFT
set encoding=utf-8
scriptencoding utf-8
" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>
tnoremap jk <C-\><C-n>
let g:lightline = {'colorscheme': 'one',}
set laststatus=2

"}}}
