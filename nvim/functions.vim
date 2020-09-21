let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set showtabline=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showtabline=0
        set showcmd
    endif
endfunction

function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction

function! CreateTmuxRunPane(cmd)
    if FindRootDirectory() == ''
        return
    endif

    let l:number_of_panes = trim(system("tmux list-panes | wc -l"))
    if l:number_of_panes == 1
        silent :exec "!tmux split-window -v -d -l 17 -c " . FindRootDirectory()
    else
        silent :exec "!tmux send -t 2 C-c"
    endif

    silent :exec "!tmux send -t 2 -R \; clear-history"
    silent :exec "!tmux send -t 2 '" . a:cmd . "' Enter"
endfunction

function! DeleteTmuxRunPane()
    let l:number_of_panes = trim(system("tmux list-panes | wc -l"))
    if l:number_of_panes > 1
        silent :exec "!tmux send -t 2 C-c"
        silent :exec "!tmux kill-pane -a -t 1"
    endif
endfunction

function! GetMakefileTargets()
    let l:targets = systemlist('cat Makefile | grep "^[A-z]" | awk "{print $1}" | sed "s/://g"')
    return l:targets
endfunction

function! GetGitBranchList()
    let l:targets = systemlist('git branch')
    call map(l:targets, {idx, val -> substitute(val, "*", "", "")})
    call map(l:targets, {idx, val -> trim(val)})
    return l:targets
endfunction

let s:ignorecase = 0
function! ToggleIgnoreCase()
    if s:ignorecase == 0
        let s:ignorecase = 1
        set noignorecase
        echo 'Search Case On'
    else
        let s:ignorecase = 0
        set ignorecase
        echo 'Search Case Off'
    endif
endfunction

function! ToggleQuickFix()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

function! RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . "cfirst"
    :copen
endfunction

let s:tabbar = 0
function! ToggleTabBar()
    if s:tabbar == 0
        let s:tabbar = 1
        set showtabline=0
    else
        let s:tabbar = 0
        set showtabline=2
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! FormatHttpResponse()
    set conceallevel=0
    set modifiable
    call search("{", "c")
    execute "'<,'>!python -m json.tool"
    set nomodifiable
endfunction


function! ToggleTabStops()
    set noexpandtab
    retab!
    if ( &tabstop > 2 )
        let &l:tabstop = 2
        let &l:softtabstop = 2
        echom "Set tabsize to 2"
    else
        let &l:tabstop = 4
        let &l:softtabstop = 4
        echom "Set tabsize to 4"
    endif
    set expandtab
    retab
endfunction
