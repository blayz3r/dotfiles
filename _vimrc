﻿"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"
" Sections
"Vim-Plug Plugin Manager  {{{
" set the run path
call plug#begin('~/.vim/bundle')
"plugins root path
"All of your Plugs must be added before the following line
"Starting screen
Plug 'mhinz/vim-startify'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Enhance editing
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"IDE experience
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
Plug 'blayz3r/vimcmdline'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'lilydjwg/colorizer'
Plug 'osyo-manga/vim-precious', { 'for': 'markdown' }
Plug 'Shougo/context_filetype.vim'
Plug 'mhinz/vim-signify'
Plug 'blayz3r/codi.vim'
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
Plug 'vim-python/python-syntax'
"Completion
Plug 'honza/vim-snippets'
Plug 'scrooloose/snipmate-snippets'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
"Tex
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}
"Search enhancer
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'dyng/ctrlsf.vim'
"R
Plug 'jalvesaq/Nvim-R'
" Git
Plug 'tpope/vim-fugitive'
call plug#end()            " required
"}}}

"General {{{

"
"" Files, backups and undo
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set updatetime=100
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
"Plug
nnoremap <Leader>up :PlugUpdate<CR>
nnoremap <Leader>in :PlugInstall<CR>
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
set so=7
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
set diffopt+=vertical,internal,algorithm:patience
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
" No annoying sound on errors
set noerrorbells
set novisualbell
autocmd GUIEnter * set vb t_vb=
set tm=500
set belloff=all
set lines=99 columns=999
" Enable syntax highlighting
syntax enable
set number
"Sneak colours
autocmd ColorScheme * hi SneakLabel gui=reverse guifg=fg guibg=bg 
" autocmd ColorScheme * hi Sneak gui=reverse guifg=fg guibg=bg
autocmd ColorScheme * hi! link Sneak Normal
"colorscheme Tomorrow-Night
" colorscheme nord
" colorscheme one
colorscheme onedark
" colorscheme gruvbox
"menu color
highlight Pmenu guibg=#21252b 
" hi PmenuSel gui=NONE guifg=WHITE
" set background=dark
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'"

" Use ~x on an English Windows version or ~n for French.
au GUIEnter * simalt ~x
" Set extra options when running in GUI mode
set go-=a " autoselect
set go-=A " autoselect
set go+=c " Dark theme
set go+=d " Console Dialogs
set go+=! " Don't open new console
set go-=e " tab stuff
set go+=f " forking
set go-=i " icon
set go-=m " menu bar
set go-=M " system menu
set go-=g " grey menu items
set go-=t " include tearoff menu items
set go-=T " toolbar
set go-=r " right scrollbar
set go-=R " right scrollbar on split
set go-=l " left scrollbar
set go-=L " left scrollbar on split
set go-=b " bottom scrollbar
set go-=h " limit horizontal scrollbar size
set go-=v " vertical button layout for dialogs
set go+=p " x11 pointer callbacks
set go-=F " motif footer
set t_Co=256
set guitablabel=%M\ %t
map <silent> <F2> :if &go =~# 'T' <Bar>
            \set go-=T <Bar>
            \set go-=m <bar>
            \else <Bar>
            \set go+=T <Bar>
            \set go+=m <Bar>
            \endif<CR>

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver20-Cursor-blinkon600-blinkoff600
set guicursor+=n-v-c:block-Cursor-blinkon600-blinkoff600
set previewpopup=height:10,width:60,border:off
" esc in normal mode clears search highlighting
nnoremap <silent> <ESC> :<CR><ESC>
"Font
" set guifont=FiraCode_NF:h11:cANSI:qDRAFT
set guifont=FiraMono_NF:h11:cANSI:qDRAFT
" set guifont=InconsolataLGC_NF:h11:cANSI:qDRAFT
"set guifont=InconsolataForPowerline_NF:h11:cANSI:qDRAFT
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
"Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
scriptencoding utf-8
" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>
tnoremap jk <C-\><C-n>
"}}}

"Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"" indent the whole file and return to the current line
nnoremap <silent> <leader>i gg=G''
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"}}}

"Moving around, tabs, windows and buffers {{{
"" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
"
"" Close the current buffer
nmap <Del> :Bc<cr>
nmap <s-Del> :bw<cr>
"
" Close all the buffers except current
nmap <C-Del> :%bd\|e#\|bd#<cr>
"Source
nmap <leader>sa :so %<cr>
"
" Switch CWD to the directory of the open buffer
map <leader>zd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,vsplit
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

"Disable some signature mappings
      let g:SignatureMap = {
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ }
"}}}

"Editing mappings {{{
"Copy setting to clipboard
"
nmap <M-h> :redir @+

"" Remap VIM 0 to first non-blank character
"Clean trailing blanks
if has("autocmd")
    autocmd BufWritePre .sql,.m,.vim,.r,*.sas,*.java,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

if has("autocmd")
    autocmd BufWritePre *.sh :set ff=unix
endif
"" Command mode mappings.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"" 24 simple text objects
"" ----------------------
"" i_ i. i: i, i; i| i/ i\ i* i+ i- i#
"" a_ a. a: a, a; a| a/ a\ a* a+ a- a#
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

"
" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

"  Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

"Defines text objects to target text after the designated characters."
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '/')

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)

" Operate on entire file
onoremap ia :<C-u>normal! gg^vGg_<CR>
xnoremap ia :<C-u>normal! gg^vGg_<CR>
"
" Operate on entire line
onoremap il :<C-u>normal! ^vg_<CR>
xnoremap il :<C-u>normal! ^vg_<CR>
"Centre after jumping
nnoremap }   }zz
nnoremap {   {zz
nnoremap ]]  ]]zz
nnoremap [[  [[zz
nnoremap []  []zz
nnoremap ][  ][zz
"Multiple Cursors
let g:VM_check_mappings = 0
let g:VM_set_statusline = 0
let g:VM_silent_exit = 1
let g:VM_leader = '\\'
let g:VM_force_maps = ['J']
"Autopairs
let g:AutoPairsShortcutJump ='<M-p>' 
"}}}

"Search {{{
set infercase
set hlsearch
set incsearch
highlight QuickFixLine guibg=#202020
highlight QuickFixLine guifg='NONE'
" highlight Search guibg=#3D5B8C guifg='NONE'
" highlight IncSearch guibg=#3D5B8C guifg='NONE'
highlight Search gui=NONE guibg=Purple4 guifg=WHITE
" highlight Search guifg=hotpink3 guibg=grey20
" hi Search guifg=NONE guibg=NONE gui=underline
highlight IncSearch gui=reverse guifg=fg guibg=bg
" Enhanced search
map n <Plug>(anzu-n-with-echo)
map N <Plug>(anzu-N-with-echo)
map * <Plug>(anzu-star-with-echo)
map # <Plug>(anzu-sharp-with-echo)
let g:anzu_status_format = "%p(%i/%l) %w"
"Easymotion
map <SPACE>  <Plug>(easymotion-prefix)
" Enhanced f,F,t and T motions (move vertically and highlight matches)
let g:sneak#label = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

""  Vim Over and Visual Search
"https://kevinjalbert.com/vim-substitution-feedback-using-vim-over/
nnoremap <M-r> :OverCommandLine<CR> %s/<C-r><C-w>/

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :noh
endfunction
nnoremap <leader>v :call VisualFindAndReplace()<CR>

"  Visual mode related
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :noh
endfunction
xnoremap <Leader>v :call VisualFindAndReplaceWithSelection()<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" When you press <M-r> you can search and replace the selected text
vnoremap <silent> <M-r> :call VisualSelection('replace', '')<CR>
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"Replace with Register
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r <Plug>ReplaceWithRegisterVisual
" Google selection
nnoremap gb :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gx :OpenURL <cWORD><CR>
vnoremap gb :call GoogleSelection()<CR>
"CtrlSF
" -R - Use regular expression pattern.
" -I, -S - Search case-insensitively (-I) or case-sensitively (-S).
" -C, -A, -B - Specify how many context lines to be printed, identical to their counterparts in Ag/Ack.
" -W - Only match whole words.
let g:ctrlsf_auto_preview = 1
nmap        gV <Plug>CtrlSFCwordPath -W<CR>
nmap     <M-k> <Plug>CtrlSFPrompt
vmap     <M-k> <Plug>CtrlSFVwordExec<CR>
nnoremap <M-o> :CtrlSFOpen<CR>
nnoremap <M-t> :CtrlSFToggle<CR>
inoremap <M-t> <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_auto_focus = {
            \ 'at': 'start',
            \ }
"grep
set grepprg=rg\ --vimgrep
"file explorer
nnoremap gof :!start explorer /select,%:p<CR>
"}}}

"Fuzzy File Search Setup {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
    " Customize fzf colors to match your color scheme
    " - fzf#wrap translates this to a set of `--color` options
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"See for more info: https://github.com/junegunn/fzf/wiki/Color-schemes
"[[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Make FZF mappings
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>k :Rg! 
nnoremap <Leader>h :MRU<CR>
nnoremap <Leader>c :History:<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" Augmenting Rg command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \ 'rg --column --color=always --line-number --colors "match:fg:white" --colors "match:bg:red" --colors "column:fg:57,143,229" --colors "path:fg:203,133,204" --colors "line:fg:128,128,128" --colors "line:style:bold" '.<q-args>, 1, 
            \   fzf#vim#with_preview({'options': ['--color', 'hl:68,hl+:110', '--preview-window', 'sharp']}),
            \   <bang>0)

command! -bang -nargs=* MRU call fzf#vim#history({'options': ['--preview-window=sharp']})

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview-window=sharp']}, <bang>0)

nnoremap <silent> gv :Rg <C-R><C-W><CR>
"FZF preview
" CTRL-A to select all and build quickfix list
let $BAT_THEME = 'TwoDark'
let $FZF_DEFAULT_OPTS = "--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-f:preview-down,ctrl-b:preview-up --preview 'bat --style=numbers --color=always --theme=TwoDark --line-range :500 {} '"
"Floating window
let g:fzf_layout = {
    \ 'window': {
    \     'width': 0.9,
    \     'height': 0.6,
    \     'highlight': 'Todo',
    \     'border': 'sharp',
    \ }}
"ranger file explorer https://github.com/ranger/ranger/issues/1827
"sudo -H pip3 install ranger-fm
nnoremap <silent> - :call RangerExplorer('wsl -e zsh -ic rangervim',0.9,0.6,'Todo')<CR>
" nnoremap <silent> - :call Flt_term_win('bash ranger',0.9,0.6,'Todo')<CR>
let g:fzf_action = {
  \ 'ctrl-q': '!start',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"}}}

"VIM AIR-LINE {{{
let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {
      \ 'branch': '',
      \ 'modified': ' ●'
      \}
  endi
" powerline symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '𝐄'
let g:airline#extensions#ycm#warning_symbol = 'W'
let g:airline#extensions#default#layout = [
            \ ['a', 'b', 'c'],
            \ ['error', 'warning', 'x', 'y', 'z']]
"
" Status line
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Show superindex numbers in tabline that allow to select buffer directly
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <silent> <Leader>1 <Plug>AirlineSelectTab1
nmap <silent> <Leader>2 <Plug>AirlineSelectTab2
nmap <silent> <Leader>3 <Plug>AirlineSelectTab3
nmap <silent> <Leader>4 <Plug>AirlineSelectTab4
nmap <silent> <Leader>5 <Plug>AirlineSelectTab5
nmap <silent> <Leader>6 <Plug>AirlineSelectTab6
nmap <silent> <Leader>7 <Plug>AirlineSelectTab7
nmap <silent> <Leader>8 <Plug>AirlineSelectTab8
nmap <silent> <Leader>9 <Plug>AirlineSelectTab9
" Tabline show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"}}}

"Completion {{{
"Youcompleteme fix
let g:ycm_auto_hover=''
hi YCMInverse gui=underline
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
set completeopt+=menuone,longest
set completeopt+=popup
set completepopup=height:10,width:60,highlight:Pmenu,border:off
" Apply YCM FixIt
map <M-c> :YcmCompleter FixIt<CR>
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-g> :YcmCompleter GoToReferences<CR>
nnoremap <C-x> :YcmCompleter RefactorRename 
"}}}

"Vim startify {{{

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_files_number  = 8
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_commands = [
            \	{ 'up': [ 'Update Plugins', ':PlugUpdate' ] },
            \	{ 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
            \ ]
let g:startify_bookmarks  = [ '~/_vimrc']
let g:startify_list_order = [
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Recent files:'],
            \ 'files',
            \ ['   Commands:'],
            \'commands',
            \]
"}}}

"Undo tree {{{
let g:undotree_WindowLayout = 2
nnoremap <F12> :UndotreeToggle<CR>
let g:undotree_HelpLine = 0
let g:undotree_SetFocusWhenToggle = 1
"}}}

"Git {{{
nnoremap <silent> <leader>ga :call Flt_term_win('wsl -e tig',0.9,0.6,'Todo')<CR>
nnoremap <silent> <leader>gb :call Flt_term_win('wsl -e tig blame -w '.expand("%"),0.9,0.6,'Todo')<CR>
nnoremap <silent> <leader>gc :Git checkout %<CR>

nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gg :call Flt_term_win('wsl -e tig grep -w '.expand("<cword>"),0.9,0.6,'Todo')<CR>
nnoremap <silent> <leader>gl :call Flt_term_win('wsl -e tig log -w '.expand("%"),0.9,0.6,'Todo')<CR>
nnoremap <silent> <Leader>gm :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
nnoremap <silent> <leader>gp :call Flt_term_win('lazygit',0.9,0.6,'Todo')<CR>
nnoremap <silent> <leader>gs :call Flt_term_win('wsl -e tig status',0.9,0.6,'Todo')<CR>
nnoremap <silent> <leader>gS :GFiles?<CR>
nnoremap <silent> <leader>gt :call Flt_term_win('wsl -e tig show',0.9,0.6,'Todo')<CR>
"Vim-signify  hunk jumping
"
nmap <leader>gh :SignifyHunkDiff<CR>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
"Vim-signify hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)
"}}}

"ALE {{{
" Fix Python files with autopep8 
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let b:ale_fix_on_save = 1
" ALE signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
let g:ale_sign_info = '💡'
let g:ale_set_balloons = 0
" YCM signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol =''
let g:ale_linters = {
            \   'javascript': ['jshint', 'eslint'],
            \   'sh': ['shellcheck'],
            \   'python': ['flake8','pyright'],
            \   'r': ['lintr'],
            \   'bash': ['shellcheck'],
            \   'zsh': ['shellcheck']
            \}
let g:ale_fixers = {'python': ['black', 'isort','autopep8'],'r': ['styler'], 'java': ['uncrustify', 'google_java_format']}
let g:ale_python_autopep8_options = '--aggressive'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"}}}

"SAS {{{
" Author: Kent Nassen
nnoremap <F8> :call RunSASonCurrentFile()<CR>
nnoremap <Leader>sk :call LoadSASLogList()<CR>
nnoremap <Leader>lc :call CheckSASLog()<CR>

function! LoadSASLogList()
    :let log=bufexists(expand("%:p:r") . ".log")
    :if log==0
    :if filereadable(expand("%:p:r") . ".log")
    :execute "vsplit " . expand("%:p:r") . ".log"
    :else
    :echo "*** SAS log file does not exist."
    :endif
    :endif

    " Load the SAS lst file in a tab, if it is not already loaded & it exists
    :let lst=bufexists(expand("%:p:r") . ".lst")
    :if lst==0
    :if filereadable(expand("%:p:r") . ".lst")
    :execute "vsplit " . expand("%:p:r") . ".lst"
    :else
    :echo "*** SAS lst file does not exist."
    :endif
    :endif
endfunction

function! RunSASonCurrentFile()
    :let checkSASpgm=match(expand("%"),"\.sas")

    if checkSASpgm==-1
        :echo "*** Current file is not a SAS program.  SAS run has been canceled."
        :return
    endif

    if exists(&modified)
        :echo "*** Saving modified file before SAS run..."
        :w
    endif

    :echo "*** Running SAS..."
    let returntxt = system(shellescape('E:\ProgramFiles\SASHome\SASFoundation\9.4\sas.exe') . ' -nosplash -sysin ' . shellescape(expand('%:p')))
    :echo "*** SAS commandline: " . returntxt

    :call LoadSASLogList()

endfunction

function! CheckSASLog()

    " Run grepprg on the current file
    Rg -e WARNING: -e ERROR -e uninit -e " 0 obs" -e "no obser" -e "repeats of" -e "not found" -e "not valid" -e invalid -e overwritten -g *.log

endfunction
"}}}

"Nvim-R {{{
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 1
let g:rout_follow_colorscheme = 1
let R_args = []  " if you had set any
let R_bracketed_paste = 0
let g:Rout_prompt_str = '» '
let Rout_more_colors = 1
let R_in_buffer=1
let R_specialplot = 1
let R_setwidth = 0
let R_clear_line = 0
let g:tex_flavor = 'latex'
let g:Latex_PdfViewer = 'AcroRd32'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let ycm_semantic_triggers = { 'r' : ['re!..', '::', '$', '@'] }
let R_nvimpager = "horizontal"
let R_rconsole_width = 120
let R_min_editor_width = 120
let g:rmd_fenced_languages = ['r', 'python']
let g:markdown_fenced_languages = ['r', 'python']
"}}}

"Python Setup {{{
let g:python_highlight_all = 1
autocmd FileType python,r map <buffer> <M-l> :ALEFix<CR>
au BufRead,BufNewFile *.py setlocal textwidth=80
let cmdline_map_send = "<LocalLeader>l"
let cmdline_tmp_dir     = 'C:\\Users\\Tate\\temp'
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_preview_position = "botright"
let g:pymode_preview_height = &previewheight  
map <M-q> :bd __run__<CR>


command! -nargs=0 -range=% PyRun call ExecutePython(<f-line1>, <f-line2>)
autocmd FileType python nnoremap <silent> <buffer> <F5> :PyRun<CR>
autocmd FileType python vnoremap <silent> <buffer> <F5> :PyRun<CR>

autocmd FileType python nnoremap <buffer> K :call PyDocVim()<CR>

let cmdline_app           = {}
let cmdline_app['python']   = 'wsl ptpython'
autocmd FileType python BracelessEnable +indent
let g:braceless_block_key = 'b'
let g:codi#log= 'C:\\Users\\Tate\\temp\\codi.log'
"}}}

"Python Debugger {{{
" Actions on Livepy
augroup LIVEPY
  au!
  " Local options
  au FileType livepy setlocal
        \ buftype=nofile bufhidden=hide nobuflisted
        \ nomodifiable nomodified
        \ nonu nornu nolist nomodeline nowrap
        \ statusline=\  nocursorline nocursorcolumn colorcolumn=
        \ foldcolumn=0 nofoldenable winfixwidth
        \ scrollbind
        \ | noremap <buffer> <silent> q <esc>:q<cr>
        \ | silent! setlocal cursorbind
        \ | silent! setlocal signcolumn=no

augroup END

" Main function
command! -nargs=? Livepy call Livepy_toggle(&filetype)
command! -bar LivepyUpdate call Livepy_do_update()
nmap \d :Livepy<cr>
"}}}

"Terminal mappings {{{
"Codi
nmap \c :Codi!!<cr>
let g:codi#rightalign = 0
let g:codi#width =110
"Contpy
set termwintype=conpty
nmap <F6> :call Flt_term_win('wsl',0.9,0.6,'Todo')<CR>
nmap <C-F6> :term++close wsl <CR>
vmap <C-F6> :!wsl -e
tmap <S-Insert> <C-W>"+
"}}}

"Java Setup {{{
map <C-F4> :!javac -d "%:p:h:s?src?bin?" %<CR>
map <F4> :!java -classpath "%:p:h:s?src?bin?" %:r<CR>

"}}}

"Matlab {{{
nmap <leader>o :silent !open %<cr>
map <F11> :silent !matlab -nodesktop -nosplash -r %:r <CR>

"}}}

"Helper functions https://github.com/amix/vimrc {{{
" C++
nnoremap <M-F9> :!g++ -o  %:r %<CR>
nnoremap <C-F10> :!%:r<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Rg -e \"" . l:pattern . "\" <CR>")
    elseif a:direction == 'replace'
        exe "OverCommandLine"."%s" . '/'. l:pattern . '/'
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"Sql format
autocmd FileType sql call SqlFormatter()
augroup end
function! SqlFormatter()
    set noai
    " set mappings...
    map ,pt  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction

" Text Highlighter = <leader>h[1-4]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\' . '\>')
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>


hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
highlight search ctermfg=white ctermbg=3423513

" Clear SearchHighlight
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu
fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu
augroup SearchHighlight
    au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end

" From https://github.com/tpope/tpope/blob/master/.vimrc
function! OpenURL(url)
    exe "!start cmd /cstart /b ".a:url.""
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" google selection
function! GoogleSelection()
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    let l:pattern = substitute(l:pattern, " ", "+", "")
    let l:url ="http://www.google.com/search?q=". l:pattern

    call OpenURL(l:url) 

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
 " Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
"Floating
" ZSH command example 'wsl -e zsh -ic ga',0.9,0.6,'Todo'
function! Flt_term_win(cmd, width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let bufnr = term_start(a:cmd, {'hidden': 1, 'term_finish': 'close', 'cwd': getcwd()})

    let winid = popup_create(bufnr, {
            \ 'minwidth': width,
            \ 'maxwidth': width,
            \ 'minheight': height,
            \ 'maxheight': height,
            \ 'border': [],
            \ 'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
            \ 'borderhighlight': [a:border_highlight],
            \ 'padding': [0,1,0,1],
            \ 'highlight': a:border_highlight
            \ })

    " Optionally set the 'Normal' color for the terminal buffer
    " call setwinvar(winid, '&wincolor', 'Special')

    return winid
endfunction

"GetDoc
function! PyDocVim()
python3 << EOF
import jedi

curfile = vim.current.buffer.name
row = vim.current.window.cursor[0]
col= vim.current.window.cursor[1]

script = jedi.Script(
    source=None,
    path=curfile)

try:
    definitions = script.help(line=row,
    column=col)
except Exception:
    # print to stdout, will be in :messages
    definitions = []
    print("Exception, this shouldn't happen.")
    print(traceback.format_exc())

    if not definitions:
        echo_highlight("No documentation found for that.")
        vim.command("return")

docs = []
for d in definitions:
    doc = d.docstring()
    if doc:
        title = "Docstring for %s" % d.full_name
        underline = "=" * len(title)
        docs.append("%s\n%s\n%s" % (title, underline, doc))
    else:
        docs.append("|No Docstring for %s|" % d)
    text = ("\n" + "-" * 79 + "\n").join(docs)
vim.command("let docWidth = %s" % len(title))
vim.command("let doc_lines = %s" % len(text.split("\n")))
EOF
    "Scroll
    function! s:popup_filter(winid, key)
        if a:key ==# "\<c-k>"
            call win_execute(a:winid, "normal! \<c-y>")
            return v:true
        elseif a:key ==# "\<c-j>"
            call win_execute(a:winid, "normal! \<c-e>")
            return v:true
        elseif a:key ==# 'q' || a:key ==# 'x'
            return popup_filter_menu(a:winid, 'x')
        endif
        return v:false
    endfunction

    let lines = py3eval('text')
    let winid = popup_create(lines->split('\n'), #{
            \ filter: function('s:popup_filter'),
            \ pos: 'botleft',
            \ line: 'cursor-1',
            \ col: 'cursor',
            \ moved: 'any',
            \ border: [1,1,1,1,1,1,1,1],
            \ borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
            \ borderhighlight: ['Todo'],    
            \ padding: [0,1,0,1],
            \ firstline: 1,
            \ scrollbar: 1,
            \ minwidth: docWidth,
            \ maxwidth: 74,
            \ minheight: doc_lines,
            \ maxheight: 20,
            \ mapping: 0,
            \ })

    call setbufvar(winbufnr(winid), '&syntax','rst')
    call setwinvar(winid, '&wincolor', 'Normal')
endfunction

"Ranger vim
function RangerExplorer(cmd, width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let bufnr = term_start(a:cmd, {'hidden': 1, 'term_finish': 'close', 'cwd': getcwd(), 'exit_cb': function('OpenonExit')})

    let winid = popup_create(bufnr, {
            \ 'minwidth': width,
            \ 'maxwidth': width,
            \ 'minheight': height,
            \ 'maxheight': height,
            \ 'border': [],
            \ 'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
            \ 'borderhighlight': [a:border_highlight],
            \ 'padding': [0,1,0,1],
            \ 'highlight': a:border_highlight
            \ })

    " Optionally set the 'Normal' color for the terminal buffer
    " call setwinvar(winid, '&wincolor', 'Special')

    return winid
endfunction
" Register that the job no longer exists
function OpenonExit(job_id, stts)
    if type(a:job_id) != type(0)
        call popup_close(win_getid())
        if filereadable('C:\\Users\\Tate\\temp\\vim_ranger_current_file')
            exec 'edit ' . system('cat C:\\Users\\Tate\\temp\\vim_ranger_current_file | sed -E "s/mnt\/[a-zA-Z]\///g"')
            call system('rm C:\\Users\\Tate\\temp\\vim_ranger_current_file')
        endif
    endif
endfunction

"Livepy helpers
function! Livepy_toggle(filetype)
  if exists('s:Save_Livepy_bufnr')
    return Livepy_kill()
  else
    return Livepy_spawn(a:filetype)
  endif
endfunction

function! Livepy_spawn(filetype)

    let s:Pyasync_jobs = {} 
    let s:Pyasync_data = {}
    

    if a:filetype !=? "python"
        return Err('File type is not python')
    endif
    call Livepy_kill()

    " Save bufnr
    let bufnr = bufnr('%')
    let s:width = winwidth(bufwinnr('%'))/2

    " Save settings to restore later
    let winnr = winnr()
    let s:restore = ''
    for opt in ['scrollbind', 'cursorbind', 'wrap', 'foldenable']
        if exists('&'.opt)
            let val = getwinvar(winnr, '&'.opt)
            let s:restore .= ' | call setwinvar('.winnr.', "&'.opt.'", '.val.')'
        endif
    endfor
    
    " Set target buf options
    setlocal scrollbind nowrap nofoldenable
    silent! setlocal cursorbind
   
    exe 'augroup LIVEPY_TARGET_'.bufnr
    au!
    " === g:codi#update() ===
    au TextChanged,TextChangedI  <buffer> call Livepy_do_update()
    augroup END

    exe 'keepjumps keepalt rightbelow '.s:width.' vnew'
    setlocal filetype=livepy
    exe 'setlocal syntax='.a:filetype
    
    " Return to target split and save codi bufnr
    keepjumps keepalt wincmd p
    let s:Livepy_target_bufnr = bufnr
    let s:Save_Livepy_bufnr = bufnr('$') 
    silent call Livepy_do_update()
endfunction

function! Livepy_kill()
  " If we already have a Livepy instance for the buffer, kill it
  if exists('s:Save_Livepy_bufnr')
    let Livepy_bufnr = s:Save_Livepy_bufnr
    " Clear autocommands
    exe 'augroup LIVEPY_TARGET_'.bufnr('%')
      au!
    augroup END
    exe s:restore
    unlet s:Save_Livepy_bufnr
    exe 'keepjumps keepalt bdel! '.Livepy_bufnr
  endif
endfunction

function! Err(msg)
  echohl ErrorMsg | echom a:msg | echohl None
endfunction


" Update the Livepy buf
function! Livepy_do_update()
    if !exists('s:Save_Livepy_bufnr') | return | endif

    let bufnr = bufnr('%')
    let input = join(getline('^', '$'), "\n")
    let magic = "\n\<cr>\<c-d>\<c-d>\<cr>" " to get out of REPL
    let input = input.magic

    let pycmd = ['python', '-m', 'space_tracer', '-l', '-']  
    let pywin32_bin = 'C:\\Users\\Tate\\temp\\pycmd'
    let pytmp_bin = '/mnt/c/Users/Tate/temp/pycmd'
    call writefile([Shellescape_list(pycmd)], pywin32_bin)
    call setfperm(pytmp_bin, 'rwx------')
    let args = ['wsl', 'script', '-qfec', pytmp_bin, '/dev/null']

    let job = job_start(args, { 
                \ 'callback': 'Pyvim_callback'
                \})
    let ch = job_getchannel(job)
    let id = substitute(ch, '^channel \(\d\+\) \(open\|closed\)$', '\1', '')

    " Kill previously running job if necessary
    call Stop_job_for_buf(bufnr)

    " Save job-related information
    let s:Pyasync_jobs[bufnr] = job
    let s:Pyasync_data[id] = {
                \ 'bufnr': bufnr,
                \ 'lines': [],
                \ 'expected': line('$'),
                \ 'received': 0,
                \ }
    call ch_sendraw(ch, input)
endfunction

function! Livepy_handle_done(data, output)
    " Save for later
  let ret_bufnr = bufnr('%')
  let ret_mode = mode()
  let ret_line = line('.')
  let ret_col = col('.')

  " Go to target buf
  exe 'keepjumps keepalt buf! '.a:data['bufnr']
  let s:updating = 1
  let Livepy_bufnr = s:Save_Livepy_bufnr 
  let Livepy_winwidth = winwidth(bufwinnr(Livepy_bufnr))
  let num_lines = line('$')
  " So we can jump back later
  let top = line('w0') + &scrolloff
  let line = line('.')
  let col = col('.')

  " So we can syncbind later
   silent! exe "keepjumps normal! \<esc>gg"
  " Go to Livepy buf
  exe 'keepjumps keepalt buf! '.Livepy_bufnr
  setlocal modifiable

  let lines = a:output

  " Read the result into the Livepy buf
  1,$d _ | 0put =lines
  exe 'setlocal textwidth='.Livepy_winwidth

  " Syncbind Livepy buf
  keepjumps normal! G"_ddgg
  syncbind
  setlocal nomodifiable
  "
  " " Restore target buf position
  exe 'keepjumps keepalt buf! '.s:Livepy_target_bufnr
  exe 'keepjumps '.top
  keepjumps normal! zt
  keepjumps call cursor(line, col)
  let s:updating = 0
  "
  " Go back to original buf
  exe 'keepjumps keepalt buf! '.ret_bufnr

  " Restore mode and position
  if ret_mode =~? '[vV]'
    keepjumps normal! gv
  elseif ret_mode =~? '[sS]'
    exe "keepjumps normal! gv\<c-g>"
  endif
  keepjumps call cursor(ret_line, ret_col)
endfunction

" Callback to handle output (vim)
function! Pyvim_callback(ch, msg)
  try
    let id = substitute(a:ch, '^channel \(\d\+\) \(open\|closed\)$', '\1', '')  
    call Livepy_handle_data(s:Pyasync_data[id], a:msg)
  catch /E716/
    " No-op if data isn't ready
  endtry
endfunction

" Shell escape on a list to make one string
function! Shellescape_list(l)
  let result = []
  for arg in a:l
    call add(result, shellescape(arg, 1))
  endfor
  return join(result, ' ')
endfunction

function! Stop_job_for_buf(buf, ...)
  try
    let job = s:Pyasync_jobs[a:buf]
    unlet s:Pyasync_jobs[a:buf]
  catch /E716/
    return
  endtry

    if a:0
      call job_stop(job, a:1)
    else
      call job_stop(job)
  endif

    " Implicitly clears from process table.
    call job_status(job)
endfunction

function! Livepy_handle_data(data, msg)
  " Bail early if we're done
  if a:data['received'] > a:data['expected'] | return | endif

  " Preprocess early so we can properly detect prompts
  let out = substitute(substitute(substitute(a:msg,
        \ "\<cr>".'\|'."\<c-h>", '', 'g'),
        \ '\(^\|\n\)\(\^D\)\+', '\1', 'g'),
        \ "\<esc>".'\[[0-9;]*\a', '', 'g')

  for line in split(out, "\n")
      " keep output only
      if line =~ '^\(\s\+\d\+\|\d\+\))'
          call add(a:data['lines'], substitute(line,'^\(\s\+\d\+\|\d\+\)).\{-}|', '', 'g')) 
          let a:data['received'] += 1

          if a:data['received'] == a:data['expected']
              call Stop_job_for_buf(a:data['bufnr'])
              silent call Livepy_handle_done(
                          \ a:data['bufnr'], join(a:data['lines'], "\n"))
          endif
      endif
  endfor
endfunction

" https://github.com/python-mode/python-mode/blob/bb746d0d0cba9adedbac856429e37a0dbfc599c6/autoload/pymode/run.vim
function! ExecutePython(line1, line2)
    let s:efm  = '%+GTraceback%.%#,'

    " The error message itself starts with a line with 'File' in it. There
    " are a couple of variations, and we need to process a line beginning
    " with whitespace followed by File, the filename in "", a line number,
    " and optional further text. %E here indicates the start of a multi-line
    " error message. The %\C at the end means that a case-sensitive search is
    " required.
    let s:efm .= '%E  File "%f"\, line %l\,%m%\C,'
    let s:efm .= '%E  File "%f"\, line %l%\C,'

    " The possible continutation lines are idenitifed to Vim by %C. We deal
    " with these in order of most to least specific to ensure a proper
    " match. A pointer (^) identifies the column in which the error occurs
    " (but will not be entirely accurate due to indention of Python code).
    let s:efm .= '%C%p^,'

    " Any text, indented by more than two spaces contain useful information.
    " We want this to appear in the quickfix window, hence %+.
    let s:efm .= '%+C    %.%#,'
    let s:efm .= '%+C  %.%#,'

    " The last line (%Z) does not begin with any whitespace. We use a zero
    " width lookahead (\&) to check this. The line contains the error
    " message itself (%m)
    let s:efm .= '%Z%\S%\&%m,'

    " We can ignore any other lines (%-G)
    let s:efm .= '%-G%.%#'

python3 << EOF
""" Code runnning support. """
import json
import sys
from io import StringIO
from re import compile as re

encoding = re(r"#.*coding[:=]\s*([-\w.]+)")


def run_code():
    """ Run python code in current buffer.
    :returns: None
    """
    errors, err = [], ""
    line1, line2 = vim.eval("a:line1"), vim.eval("a:line2")
    lines = __prepare_lines(line1, line2)
    if encoding.match(lines[0]):
        lines.pop(0)
        if encoding.match(lines[0]):
            lines.pop(0)
    elif encoding.match(lines[1]):
        lines.pop(1)

    context = dict(
        __name__="__main__",
        __file__=vim.eval('expand("%:p")'),
        input='',
        raw_input='')

    sys.stdout, stdout_ = StringIO(), sys.stdout
    sys.stderr, stderr_ = StringIO(), sys.stderr

    try:
        code = compile("\n".join(lines) + "\n", vim.current.buffer.name, "exec")
        sys.path.insert(0, vim.eval('getcwd()'))
        exec(code, context)  # noqa
        sys.path.pop(0)

    except SystemExit as e:
        if e.code:
            # A non-false code indicates abnormal termination.
            # A false code will be treated as a
            # successful run, and the error will be hidden from Vim
            vim.command('call Pyerror("%s")' % str("Script exited with code %s" % e.code))
            return vim.command('return')

    except Exception:
        import traceback

        err = traceback.format_exc()

    else:
        err = sys.stderr.getvalue()

    output = sys.stdout.getvalue()
    sys.stdout, sys.stderr = stdout_, stderr_

    errors += [er for er in err.splitlines() if er and "<string>" not in er]
    vim.command('let %s = %s' % ("l:traceback", json.dumps(errors[1:])))
    vim.command('let %s = %s' % ("l:output", json.dumps([s for s in output.splitlines()])))


def __prepare_lines(line1, line2):

    lines = [l.rstrip() for l in vim.current.buffer[int(line1) - 1: int(line2)]]

    indent = 0
    for line in lines:
        if line:
            indent = len(line) - len(line.lstrip())
            break
    if len(lines) == 1:
        lines.append("")
    return [l[indent:] for l in lines]
EOF
    let l:output = []
    let l:lines = []
    let l:traceback = []
    call setqflist([])

    call Wide_message("Code running ...")

    try
        python3 run_code()

        if len(l:output)
            call Tempbuffer_open('__run__')
            call append(line('$'), l:output)
            normal dd
            wincmd p
        else
            call Wide_message("No output.")
        endif

        cexpr ""
        let l:_efm = &efm
        let &efm = s:efm
        cgetexpr(l:traceback)

        " If a range is run (starting other than at line 1), fix the reported
        " error line numbers for the current buffer
        if a:line1 > 1
            let qflist = getqflist()
            for i in qflist
                if i.bufnr == bufnr("")
                    let i.lnum = i.lnum - 1 + a:line1
                endif
            endfor
            call setqflist(qflist)
        endif

        call Quickfix_open(0, g:pymode_quickfix_maxheight, g:pymode_quickfix_maxheight, 0)

        let &efm = l:_efm

    catch /E234/

        echohl Error | echo "Run-time error." | echohl none

    endtry
endfunction

" DESC: Show wide message
fun! Wide_message(msg) "{{{
    let x=&ruler | let y=&showcmd
    set noruler noshowcmd
    redraw
    echohl Debug | echo strpart("[Pymode] " . a:msg, 0, &columns-1) | echohl none
    let &ruler=x | let &showcmd=y
endfunction


" DESC: Open temp buffer.
fun! Tempbuffer_open(name) "{{{
    pclose
    exe g:pymode_preview_position . " " . g:pymode_preview_height . "new " . a:name
    setlocal buftype=nofile bufhidden=delete noswapfile nowrap previewwindow
    redraw
endfunction

" DESC: Open quickfix window
fun! Quickfix_open(onlyRecognized, maxHeight, minHeight, jumpError) "{{{
    let numErrors = len(filter(getqflist(), '1'))
    let numOthers = len(getqflist()) - numErrors
    if numErrors > 0 || (!a:onlyRecognized && numOthers > 0)
        let num = winnr()
        botright copen
        exe max([min([line("$"), a:maxHeight]), a:minHeight]) . "wincmd _"
        if a:jumpError
            cc
        elseif num != winnr()
            wincmd p
        endif
    else
        cclose
    endif
    redraw
    if numOthers > 0
        call Wide_message(printf('Quickfix: %d(+%d)', numErrors, numOthers))
    elseif numErrors > 0
        call Wide_message(printf('Quickfix: %d', numErrors))
    endif
endfunction

" DESC: Show error
fun! Pyerror(msg) "{{{
    execute "normal \<Esc>"
    echohl ErrorMsg
    echomsg "[Pymode]: error: " . a:msg
    echohl None
endfunction

 "}}}
