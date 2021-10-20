" Automatically install vimplug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter' " comments
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " color icons
Plug 'tpope/vim-fugitive' " git
Plug 'vim-airline/vim-airline' " bottom bar
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' " surround line or word in [ word ]...
Plug 'plasticboy/vim-markdown' " markdown
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter' " show git diff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go lang commands in vim
Plug 'SirVer/ultisnips' " Snipets, need create snippets
" Plug 'xolox/vim-misc' " for colorscheme switcher
" Plug 'xolox/vim-colorscheme-switcher'
Plug 'morhetz/gruvbox' " color scheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'vimwiki/vimwiki' " markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jtratner/vim-flavored-markdown' " recognize github code blocks in markdown
Plug 'haya14busa/is.vim' " hide highlight after select
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete in vim
Plug 'hashivim/vim-terraform' " Terraform lsp
Plug 'schickling/vim-bufonly' " clear buffers, command :BufOnly
Plug 'ryanoasis/vim-devicons' " icons
Plug 'ekalinin/Dockerfile.vim' " syntax for dockerfile
Plug 'tommcdo/vim-exchange' " exchange(swapping), cxx - line, cx - define start, X - visual, cxc - clear
Plug 'tpope/vim-unimpaired' " [space ]space [e ]e
Plug 'jiangmiao/auto-pairs' " auto pairs of [] {} ()
" Plug 'gcmt/taboo.vim' " For tabs
Plug 'vimlab/split-term.vim' " Open terminal
" Plug 'mileszs/ack.vim' " For search
Plug 'luochen1990/rainbow' " different level paranthese colors
Plug 'chrisbra/csv.vim' " work with csv
Plug 'mhinz/vim-startify' " start screen
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jackguo380/vim-lsp-cxx-highlight' " C/C++ syntax highlight
Plug 'rhysd/vim-clang-format' " C/C++ format

call plug#end()


" Mappings
nnoremap <localleader>pi :PlugInstall<CR>
nnoremap <localleader>pc :PlugClean<CR>
nnoremap <localleader>pu :PlugUpdate<CR>
nnoremap <localleader>pU :PlugUpgrade<CR>
nnoremap <localleader>ps :PlugStatus<CR>
