" Automatically install vimplug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'preservim/nerdcommenter' " comments
" Plug 'tpope/vim-fugitive' " git
Plug 'vim-airline/vim-airline' " bottom bar
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter' " show git diff
Plug 'preservim/nerdcommenter' " comment line based on file type
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
Plug 'junegunn/fzf.vim' " used to manage buffers
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go lang commands in vim
Plug 'SirVer/ultisnips' " Snipets, need create snippets
" Plug 'xolox/vim-misc' " for colorscheme switcher
" Plug 'xolox/vim-colorscheme-switcher'
Plug 'morhetz/gruvbox' " color scheme
Plug 'haya14busa/is.vim' " hide highlight after select
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete in vim
" Plug 'hashivim/vim-terraform' " Terraform lsp
Plug 'schickling/vim-bufonly' " clear buffers, command :BufOnly
Plug 'ryanoasis/vim-devicons' " icons
" Plug 'ekalinin/Dockerfile.vim' " syntax for dockerfile
Plug 'jiangmiao/auto-pairs' " auto pairs of [] {} ()
" Plug 'gcmt/taboo.vim' " For tabs
Plug 'vimlab/split-term.vim' " Open terminal
" Plug 'mileszs/ack.vim' " For search
Plug 'luochen1990/rainbow' " different level paranthese colors
Plug 'chrisbra/csv.vim' " work with csv
Plug 'mhinz/vim-startify' " start screen
" Plug 'jackguo380/vim-lsp-cxx-highlight' " C/C++ syntax highlight
" Plug 'rhysd/vim-clang-format' " C/C++ format

call plug#end()


" Mappings
nnoremap <localleader>pi :PlugInstall<CR>
nnoremap <localleader>pc :PlugClean<CR>
nnoremap <localleader>pu :PlugUpdate<CR>
nnoremap <localleader>pU :PlugUpgrade<CR>
nnoremap <localleader>ps :PlugStatus<CR>
