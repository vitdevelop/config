"General{{{
" Map leader and localleader keys
"noremap <SPACE> <Nop>
"let mapleader = " "
let mapleader = "\<Space>"
let maplocalleader = "``"

" Load plugins
source ~/.config/nvim/plugins.vim

" Load functions
source ~/.config/nvim/functions.vim

" Reload vimrc
nnoremap <localleader>! :source ~/.vimrc<CR> :echo "Config reloaded..."<CR>

" Write and Quit
nnoremap <localleader>w :w<CR>
nnoremap <localleader>q :x<CR>
" }}}

"Settings{{{
syntax enable
colorscheme gruvbox

set nowrap
set hidden
set number
set relativenumber
set tabstop=4
set shiftwidth=2
set autowrite
set cursorline
set autoread
set splitbelow
set splitright
set autochdir
set mouse=a
set encoding=UTF-8
set expandtab
set nocompatible
set diffopt+=vertical
set noignorecase
set smartcase
set sidescroll=1
set scrolloff=10
set conceallevel=2
set switchbuf=usetab
set showtabline=0
set sessionoptions+=tabpages,globals
set ttimeoutlen=0
set foldmethod=marker

" hide tilde on blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

filetype plugin indent on
set autoindent

set noswapfile
set nobackup
set nowritebackup
" set backupdir=~/.vim/backup/
" set directory=~/.vim/backup/

" Undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile

set updatetime=300
set shortmess+=c
set signcolumn=yes

" }}}

"AirLine{{{
let g:airline_powerline_fonts = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline_theme='base16'
" let g:airline_theme='papercolor'
" let g:airline#extensions#taboo#enabled = 0
" let g:airline#extensions#vimagit#enabled = 1
" let g:airline#extensions#virtualenv#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_min_count = 2
" let g:airline#extensions#tabline#formatter = 'short_path'

" Buffer Tab Selectio"
" nmap <leader>b1 <Plug>AirlineSelectTab1
" nmap <leader>b2 <Plug>AirlineSelectTab2
" nmap <leader>b3 <Plug>AirlineSelectTab3
" nmap <leader>b4 <Plug>AirlineSelectTab4
" nmap <leader>b5 <Plug>AirlineSelectTab5
" nmap <leader>b6 <Plug>AirlineSelectTab6
" nmap <leader>b7 <Plug>AirlineSelectTab7
" nmap <leader>b8 <Plug>AirlineSelectTab8
" nmap <leader>b9 <Plug>AirlineSelectTab9
" nmap <leader>b0 <Plug>AirlineSelectTab10
" }}}

"Rainbow{{{
let g:rainbow_active = 1
nnoremap <F9> :RainbowToggle<CR>
" }}}

"Mover{{{
" move lines up and down with ALT+SHIFT+J/K
nnoremap <A-S-j> :m .+1<CR>==
nnoremap <A-S-k> :m .-2<CR>==
inoremap <A-S-j> <Esc>:m .+1<CR>==gi
inoremap <A-S-k> <Esc>:m .-2<CR>==gi
vnoremap <A-S-j> :m '>+1<CR>gv=gv
vnoremap <A-S-k> :m '<-2<CR>gv=gv
" }}}

"Editor{{{
nnoremap <silent> <localleader><space> :%s/\s\+$//e<CR> :echo "Trailing white space removed"<CR>
" }}}

"Easymotion{{{
 " Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" Letters to be used in the motion, last letter is the grouping motion
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,'

nmap s <Plug>(easymotion-bd-f)
nmap S <Plug>(easymotion-overwin-f)
" }}}

"UltiSnip{{{
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" }}}

"File type settings{{{
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist
" }}}

"Info{{{
nnoremap <leader>ip :echom expand('%:p')<CR>
" }}}

"Togglers{{{
"
"------------------------------------------
nnoremap <localleader>3 :TagbarToggle<CR>
nnoremap <localleader>0 :UltiSnipsEdit<CR>
" nnoremap <F11> :call ToggleTabBar()<CR>
nnoremap <F12> :call ToggleHiddenAll()<CR>
"------------------------------------------
"
" }}}

"Disable arrow keys{{{
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>
" }}}

"Clipboard{{{
nnoremap YY "+yy
vnoremap Y "+y
nnoremap P "+p
vnoremap P "+p
" }}}

"SpeciaL{{{
nnoremap <localleader><localleader>f :Filetypes<CR>
nnoremap <localleader><localleader>w :set wrap<CR>
nnoremap <localleader><localleader>W :set nowrap<CR>
nnoremap <localleader><localleader>m :set modifiable<CR>
nnoremap <localleader><localleader>M :set nomodifiable<CR>
nnoremap <localleader><localleader>t :call ToggleTabStops()<CR>
nnoremap <localleader><localleader>h :noh<CR>
" }}}

"Buffers{{{
nnoremap <leader><leader> :Buffers<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <leader>bn :bNext<CR>
" nnoremap <leader>bb :bNext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bq :bd!<CR>
" nnoremap <leader>qa :bufdo bwipeout<CR>
nnoremap <leader>bo :BufOnly<CR>
" restore closed bufer
nnoremap <leader><localleader> <C-^>
nnoremap <silent><leader>b0 :call CleanEmptyBuffers()<CR> :echo "Empty buffers cleanned"<CR>
" }}}

"Windows{{{
nnoremap <leader>w- :split<CR>
nnoremap <leader>w\ :vsplit<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>wq :close<CR>
" nnoremap <leader>ww <C-w>w
nnoremap <leader>w= <C-w>=
nnoremap <leader>wH <C-w>H
nnoremap <leader>wL <C-w>L
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
" nnoremap <leader>wh <C-w>h
" nnoremap <leader>wl <C-w>l
" nnoremap <leader>wj <C-w>j
" nnoremap <leader>wk <C-w>k
nnoremap <silent><A-h> <C-w>h
nnoremap <silent><A-l> <C-w>l
nnoremap <silent><A-j> <C-w>j
nnoremap <silent><A-k> <C-w>k
nnoremap <silent><A-S-h> :vertical res +3<cr>
nnoremap <silent><A-S-l> :vertical res -3<cr>
nnoremap <silent><A-S-j> :res -3<cr>
nnoremap <silent><A-S-k> :res +3<cr>


" }}}

"Tabs{{{
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>td :windo bd<CR>
nnoremap <leader>tq :windo bd!<CR>
nnoremap <silent><leader>tw :sbp<bar>wincmd p<bar>wincmd T<CR> :echo "Moved buffer to a new tab"<CR>
nnoremap <leader>to :tabonly<CR>
" nnoremap <leader>tt :tabnext<CR>
" nnoremap <leader>tn :tabnext<CR>
nnoremap <leader><tab> :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tmf :tabm 0<CR>
nnoremap <leader>tml :tabm<CR>
nnoremap <leader>tm1 :tabm 0<CR>
nnoremap <leader>tm2 :tabm 2<CR>
nnoremap <leader>tm3 :tabm 3<CR>
nnoremap <leader>tm4 :tabm 4<CR>
nnoremap <leader>tm5 :tabm 5<CR>
nnoremap <leader>tm6 :tabm 6<CR>
nnoremap <leader>tm7 :tabm 7<CR>
nnoremap <leader>tm8 :tabm 8<CR>
nnoremap <leader>tm9 :tabm 9<CR>
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>
" }}}

"Autocommands{{{
" Re-read the file on focus and save buffer on focus lost
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

" Save the text folding
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview
" }}}

"Terminal Settings{{{
" ----------------------------
" Add new line in normal mode
" ----------------------------
"1. For a single Profile open Preferences → Profiles → Keys → [+] (Add)
"2. For all profiles open Preferences → Keys → [+] (Add)
"- Keyboard shortcut: (Hit Shift+Enter)
"- Action: Send Escape Sequence
"- Esc+ [13;2u
"- Repeat for Ctrl+Enter, with sequence: [13;5u
"
"- urxvt, append to your .Xresources file:
"-------------
"URxvt.keysym.S-Return:     \033[13;2u
"URxvt.keysym.C-Return:     \033[13;5u
"-------------
"
"- Alacritty, under key_bindings, add following to your ~/.config/alacritty/alacritty.yml:
"-------------
"- { key: Return,   mods: Shift,   chars: "\x1b[13;2u" }
"- { key: Return,   mods: Control, chars: "\x1b[13;5u" }
"-------------
nnoremap <S-CR> o<Esc>k
nnoremap <M-CR> O<Esc>j
" nnoremap <Space> o<Esc>k
" nnoremap <C-Space> O<Esc>j
" }}}

"JSON{{{
let g:vim_json_syntax_conceal = 0
vnoremap <leader>js= :!python -m json.tool<CR>
au FileType json nnoremap <buffer> <leader>= :exec "%!python -m json.tool"<CR>
" }}}

"XML{{{
vnoremap <leader>xml= :!xmllint --format -<CR>
au FileType xml nnoremap <buffer> <leader>= :exec "%!python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()'"<CR>
" }}}

"YAML{{{
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
" }}}

"Text{{{
" Convert cammelCase to underscore
" TODO: Not finished, need to make the command accept parameter % or .
command! CamelCaseToUnderscore :s/\(\l\)\(\u\)/\1\_\l\2/gc
" }}}

"Terminal{{{
" nnoremap <leader>tt :TTerm<space>
" nnoremap <leader>tv :VTerm<space>
" nnoremap <leader>ts :Term<space>
" }}}

"Csv{{{
let g:csv_highlight_column = 'y'
let b:csv_headerline = 0
"

" C/C++{{{
nnoremap <Leader>cf :<C-u>ClangFormat<CR>
"
" }}}
