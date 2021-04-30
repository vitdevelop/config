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
set shiftwidth=4
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
let g:airline#extensions#vimagit#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'short_path'

" Buffer Tab Selectio" 
nmap <leader>b1 <Plug>AirlineSelectTab1
nmap <leader>b2 <Plug>AirlineSelectTab2
nmap <leader>b3 <Plug>AirlineSelectTab3
nmap <leader>b4 <Plug>AirlineSelectTab4
nmap <leader>b5 <Plug>AirlineSelectTab5
nmap <leader>b6 <Plug>AirlineSelectTab6
nmap <leader>b7 <Plug>AirlineSelectTab7
nmap <leader>b8 <Plug>AirlineSelectTab8
nmap <leader>b9 <Plug>AirlineSelectTab9
nmap <leader>b0 <Plug>AirlineSelectTab10
" }}}

"Rainbow{{{
let g:rainbow_active = 1
nnoremap <F9> :RainbowToggle<CR>
" }}}

"Mover{{{
" move lines up and down with ALT+J/K
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

"Editor{{{
nnoremap <silent> <localleader><space> :%s/\s\+$//e<CR> :echo "Trailing white space removed"<CR>
" }}}

"Easy Align{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <silent> <localleader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> <localleader>a <Plug>(EasyAlign)
" }}}

"Scroll{{{
"  vertical scroll
nnoremap <M-[> 5zh
nnoremap <M-]> 5zl
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
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

"NERDCommenter{{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}

"NERDTree{{{
map <localleader>2 :NERDTreeToggle<CR>
nmap <leader>fl :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" }}}

"VimWiki{{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" }}}

"Instant Markdown Preview{{{
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" }}}

"File type settings{{{
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist
" }}}

"FZF{{{
nnoremap <leader>fa :Rg<CR>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fF :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fT :Tags<CR>
nnoremap <leader>fC :Commits<CR>
nnoremap <leader>fc :BCommits<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fs :Snippets<CR>
nnoremap <leader>fw :Windows<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }

" nnoremap <silent><leader>mm :call fzf#run({
"             \ 'source': GetMakefileTargets(),
"             \ 'sink': '15Term make',
"             \ 'down': '30%',
"             \ })<CR>

" inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"   \ 'prefix': '^.*$',
"   \ 'source': 'rg -n ^ --color always',
"   \ 'options': '--ansi --delimiter : --nth 3..',
"   \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" function! s:make_sentence(lines)
" return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
" endfunction

" inoremap <expr> <c-x><c-s> fzf#vim#complete({
"     \ 'source':  'cat /usr/share/dict/words',
"     \ 'reducer': function('<sid>make_sentence'),
"     \ 'options': '--multi --reverse --margin 15%,0',
"     \ 'left':    40})

" }}}

"Search{{{
" command! ClearQuickfixList cexpr [] | cclose
" command! RemoveQFItem :call RemoveQFItem()
"
" nnoremap <leader>si :call ToggleIgnoreCase()<CR>
" nnoremap <silent> <leader>qc :ClearQuickfixList<CR>
"
" autocmd FileType qf map <silent> <buffer> dd :RemoveQFItem<cr>
"
" " Make the Ack command use the rg command for search
" let g:ackprg = 'rg --vimgrep'
"
" " Search Shortcuts
" nnoremap <leader>sgf :Rg<Space>
" nnoremap <leader>sgg :Ack!<Space>
" nnoremap <leader>sgw :exe "Ack! " . expand("<cword>")<CR>
" nnoremap <leader>sbb :Ack!  %<Left><Left>
" nnoremap <leader>sbw :exe "Ack! " . expand("<cword>") . " %"<CR>
" nnoremap <silent> <leader>ss :call ToggleQuickFix()<CR>
" nnoremap <leader>sf :cfirst<CR>
" nnoremap <leader>sl :clast<CR>
" nnoremap <leader>sn :cnext<CR>
" nnoremap <leader>sp :cprev<CR>
"
" " Replace Shortcuts
" nnoremap <leader>rr :cfdo %s///g <bar> update<left><left><left><left><left><left><left><left><left><left><left><left>
" nnoremap <leader>rbw :exe "/" . expand("<cword>")<CR> :exe "%s/" . expand("<cword>") . "//g"<left><left><left>
" nnoremap <leader>rbb :%s///g<left><left><left><left>
" vnoremap <leader>rvv <Esc>/\%V//g<left><left><left>
"
" " Quick search Shortcuts
" vnoremap <silent> <leader>/ y/\V<C-r>=escape(@",'/\')<CR><CR>
" nnoremap <silent> <leader>/ :exe "/" . expand("<cword>")<CR>
" vnoremap <leader>R :s/%V//g"<left><left><left><left>
"
" vnoremap / <Esc>/\%V
" vnoremap ? <Esc>?\%V
"
" nnoremap <silent> <localleader>1 :call ToggleQuickFix()<CR>
" nnoremap <localleader>7 :Ack "// TODO:\|// FIXME:"<CR>
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
nnoremap <leader>bb :bNext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bq :bd!<CR>
nnoremap <leader>qa :bufdo bwipeout<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader><localleader> <C-^>
nnoremap <silent><leader>b0 :call CleanEmptyBuffers()<CR> :echo "Empty buffers cleanned"<CR>
" }}}

"Windows{{{
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>wd :close<CR>
nnoremap <leader>ww <C-w>w
nnoremap <leader>w= <C-w>=
nnoremap <leader>wh <C-w>H
nnoremap <leader>wl <C-w>L
nnoremap <leader>wj <C-w>J
nnoremap <leader>wk <C-w>K
" }}}

"Tabs{{{
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>td :windo bd<CR>
nnoremap <leader>tq :windo bd!<CR>
nnoremap <silent><leader>tw :sbp<bar>wincmd p<bar>wincmd T<CR> :echo "Moved buffer to a new tab"<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tt :tabnext<CR>
nnoremap <leader>tn :tabnext<CR>
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

"Git{{{
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
" nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>
nnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
" Jump between hunks
" nnoremap [g <Plug>(GitGutterNextHunk)
" nnoremap ]g <Plug>(GitGutterPrevHunk)

nnoremap <leader>gpd :15Term git pull origin develop<CR>
nnoremap <leader>gpm :15Term git pull origin master<CR>
nnoremap <leader>gPd :15Term git push origin develop<CR>
nnoremap <leader>gPm :15Term git push origin master<CR>

" Switch master and develop branches
nnoremap <leader>gbm :10Term git checkout master<CR>
nnoremap <leader>gbd :10Term git checkout develop<CR>

" Switch to branch
nnoremap <silent><leader>gb :call fzf#run({
            \ 'source': GetGitBranchList(),
            \ 'sink': '10Term git checkout',
            \ 'down': '20%',
            \ })<CR>

" Toggle changed lines and sign
nnoremap \gg :GitGutterSignsToggle<CR>
nnoremap \gl :GitGutterLineHighlightsToggle<CR>
" }}}

"Tmux{{{
" tmux-navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" tmux-resizer
let g:tmux_resizer_no_mappings = 1
nnoremap <silent> <M-h> :TmuxResizeLeft<cr>
nnoremap <silent> <M-j> :TmuxResizeDown<cr>
nnoremap <silent> <M-k> :TmuxResizeUp<cr>
nnoremap <silent> <M-l> :TmuxResizeRight<cr>
" }}}

"Autocommands{{{
" Re-read the file on focus and save buffer on focus lost
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! noautocmd w

" Save the text folding
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview
" }}}

"COC{{{
" Highlight symbol under cursor on CursorHold
au CursorHold * silent call CocActionAsync('highlight')

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" use <m-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <localleader>lrn :w<CR> <Plug>(coc-rename)

" Remap for format selected region
xnoremap <localleader>lf  <Plug>(coc-format-selected)
nnoremap <localleader>lf  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region
xnoremap <localleader>la  <Plug>(coc-codeaction-selected)
nnoremap <localleader>la  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nnoremap <localleader>lac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nnoremap <localleader>lqf  <Plug>(coc-fix-current)

" Show the diagnostic list
nnoremap <localleader>4 :<C-u>CocList diagnostics<CR>


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
" }}}

"Terraform ====== {{{
"
let g:terraform_align=1
let g:terraform_fmt_on_save=1
"
"
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

"GoVim{{{
let g:go_bin_path = "/home/vitdevelop/go/bin"
autocmd FileType go nmap <leader>rb  <Plug>(go-build)
autocmd FileType go nmap <leader>rr  <Plug>(go-run)
autocmd FileType go nmap <leader>rt  <Plug>(go-test)

" Autoimport the libs at save
let g:go_fmt_command = "goimports"

" Camel Case Tags
let g:go_addtags_transform = "camelcase"

" Linter on save
let g:go_metalinter_autosave = 1

let g:go_term_mode = "split"
let g:go_term_height = 15

" Enable highlighting
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" }}}

"Text{{{
" Convert cammelCase to underscore
" TODO: Not finished, need to make the command accept parameter % or .
command! CamelCaseToUnderscore :s/\(\l\)\(\u\)/\1\_\l\2/gc
" }}}

"Terminal{{{
nnoremap <leader>tt :TTerm<space>
nnoremap <leader>tv :VTerm<space>
nnoremap <leader>ts :Term<space>
" }}}

"Csv{{{
let g:csv_highlight_column = 'y'
let b:csv_headerline = 0
"

" C/C++{{{
nnoremap <Leader>cf :<C-u>ClangFormat<CR>
"
" }}}
