# Vim Key Bindings


### Configuration File **`<leader>!`**
---
- `<leader>!` - reload vim configuration file


### Plugin Manager **`<leader>±`**
---
- `<leader>±i` - install vim-plug plugins
- `<leader>±u` - update vim-plug plugins
- `<leader>±U` - upgrade vim-plug itself
- `<leader>±c` - clean vim-plug plugins
- `<leader>±s` - check vim-plug plugins status


### General mappings
---
- `<leader><Space>` - set no highlighting
- `<leader>qf<space>` - Remove all trailing space in the buffer


### Working with windows **`<leader>w`**
---
- `<leader>ws` - split window horizontally
- `<leader>wv` - split window vertically
- `<leader>wo` - close all others split window except current
- `<leader>wd` - delete current split window
- `<leader>ww` - switch to next split
- `<leader>w=` - maximize current split window
- `<leader>wh` - move current split window to left
- `<leader>wl` - move current split window to right
- `<leader>wj` - move current split window down
- `<leader>wk` - move current split window up


### Working with buffers **`<leader>b`**
---
- `<leader>bn` - go to next buffer
- `<leader>bb` - go to next buffer (same as above)
- `<leader>bp` - go to previous buffer
- `<leader>bo` - close all others buffers except current
- `<leader>bd` - delete current buffer
- `<leader>q` - delete current buffer
- `<leader>qa` - delete all buffers but keep vim open


### Working with tabs **`<leader>t`**
---
- `<leader>tc` - create a new tab
- `<leader>td` - delete current tab
- `<leader>tn` - go to next tab
- `<leader>tt` - go to next tab
- `<leader>tp` - go to previous tab
- `<leader>to` - delete all tabs except current
- `<leader>t1` - move to the tab number 1
- `<leader>t2` - move to the tab number 2
- `<leader>t3` - move to the tab number 3
- `<leader>t4` - move to the tab number 4
- `<leader>t5` - move to the tab number 5
- `<leader>t6` - move to the tab number 6
- `<leader>t7` - move to the tab number 7
- `<leader>t8` - move to the tab number 8
- `<leader>t9` - move to the tab number 9
- `<leader>tmf` - move current tab to first tab
- `<leader>tml` - move current tab to last tab
- `<leader>tm1` - move current tab to tab number 1
- `<leader>tm2` - move current tab to tab number 2
- `<leader>tm3` - move current tab to tab number 3
- `<leader>tm4` - move current tab to tab number 4
- `<leader>tm5` - move current tab to tab number 5
- `<leader>tm6` - move current tab to tab number 6
- `<leader>tm7` - move current tab to tab number 7
- `<leader>tm8` - move current tab to tab number 8
- `<leader>tm9` - move current tab to tab number 9


### Moving between panes **`<Ctrl>hjkl`**
---
- `<Ctrl>h` - move to left pane
- `<Ctrl>l` - move to right pane
- `<Ctrl>j` - move to bottom pane
- `<Ctrl>k` - move to upper pane


### Resizing panes **`<Alt>hjkl`**
---
- `<Alt>h` - resize pane to the left
- `<Alt>l` - resize pane to the right
- `<Alt>j` - resize pane up
- `<Alt>k` - resize pane down


### Easy Motion **`<leader>`&#96;`**
---
- `<leader>`&#96; - start easy motion


### Toggle
---
- `<F2>` - Toggle NERDTree
- `<F3>` - Toggle TagBar
- `<F4>` - Toggle Merginal
- `<F11>` - Toggle TabBar
- `<F12>` - Toggle Fullscreen



### Working with projects based on Makefile **`<leader>m`**
---
##### Make Run **`<leader>mr`**
- `<leader>mrr` - Make run current project using Makefile *run* command
- `<leader>mrd` - Make debug current project using Makefile *debug* command
- `<leader>mrb` - Make build current project using Makefile *build* command
- `<leader>mrt` - Make test current project using Makefile *test* command
- `<leader>mrc` - Make clean current project using Makefile *clean* command
- `<leader>mq` - Make quit running process and its pane

##### Make Docker Build **`<leader>mdb`**
- `<leader>mdbs` - Build **snapshot** container using Makefile **docker-build-snapshot** command
- `<leader>mdbl` - Build **latest** container using Makefile **docker-build-latest** command
- `<leader>mdbr` - Build **release** container using Makefile **docker-build-release** command

##### Make Docker Push **`<leader>mdp`**
- `<leader>mdps` - Push **snapshot** container using Makefile **docker-push-release** command
- `<leader>mdpl` - Push **latest** container using Makefile **docker-push-release** command
- `<leader>mdpr` - Push **release** container using Makefile **docker-push-release** command


### Working with fuzzy finder **`<leader>f`**
---
- `<leader>ff` - show fuzzy finder for all files starting from current directory
- `<leader>fF` - show fuzzy finder for only files available in git repository starting from current directory
- `<leader>fb` - show fuzzy finder for all opened buffers
- `<leader>ft` - show fuzzy finder for current file tags
- `<leader>fT` - show fuzzy finder for all files tags
- `<leader>fc` - show fuzzy finder for current file commits
- `<leader>fC` - show fuzzy finder for all project files commits
- `<leader>fm` - show fuzzy finder for marks
     - `<Ctrl>t` - open the selected fuzzy object in a new tab
     - `<Ctrl>s` - open the selected fuzzy object in a horizontal split
     - `<Ctrl>v` - open the selected fuzzy object in a vertical split


### Editor bindings
---
- `<Shift><CR>` - Add new empty line below keeping cursor on the same line
- `<Alt><CR>` - Add new empty line above current line, cursor moves with with the new line down
- `<Alt><Down>` - Move current line down
- `<Alt><Up>` - Move current line up
- `<leader>=` - format current file (json, xml, etc...)


### Working with GIT **`<leader>g`**
---
- `<leader>gs` - show git status pane
- `<leader>gd` - show git diff of current file
- `<leader>gb` - show git blame
- `<leader>gc` - execute git commit
- `<leader>ga` - execute git ammended commit
- `<leader>gt` - execute git commit of current file only
- `<leader>ge` - execute git edit file
- `<leader>gr` - execute git re-read file
- `<leader>gw` - execute git write
- `<leader>gl` - execute git log
- `<leader>gg` - execute git grep
- `<leader>gm` - execute git move
- `<leader>gdh` - execute git diffget from the left side buffer
- `<leader>gdl` - execute git diffget from the right side buffer
- `<leader>g>` - move cursor to the next git change
- `<leader>g<` - move cursor to the previous git change


### Search **`<leader>s`**
---
- `<leader>sgf` - prepare the filtered search in the whole project files
- `<leader>sbw` - search the word under cursor in current buffer
- `<leader>sbb` - prepare the search in current buffer
- `<leader>sgw` - search the word under cursor in the whole project files
- `<leader>sgg` - prepare the global search for current project dir
- `<leader>ss` - toggle search result
- `<leader>sn` - goto next search result
- `<leader>sp` - goto previous search result
- `<leader>sf` - goto first search result
- `<leader>sl` - goto last search result


### Quick Search **/**, **?**, **`<leader>/`**, **`<leader>?`**
---
- `<leader>/` - quick search the word under cursor
- VISUAL `<leader>/` - quick search the selected text
- VISUAL `/` - quick search in the range of the selected text
- VISUAL `?` - reverse search search in the range of the selected text


### Quickfix **`<leader>q`**
---
- `<leader>qc` - clears the quickfix window and close it


### Comment **`<leader>c`**
---
- `<leader>cc` - Comment out the current line or text selected in visual mode.
- `<leader>cn` - Same as cc but forces nesting.
- `<leader>c<space>` - Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
- `<leader>cm` - Comments the given lines using only one set of multipart delimiters
- `<leader>ci` - Toggles the comment state of the selected line(s) individually
- `<leader>cs` - Comments out the selected lines with a pretty block formatted layout
- `<leader>cy` - Same as cc except that the commented line(s) are yanked first
- `<leader>c$` - Comments the current line from the cursor to the end of line
- `<leader>cA` - Adds comment delimiters to the end of line and goes into insert mode between them
- `<leader>ca` - Switches to the alternative set of delimiters
- `<leader>cl` - Same as `<leader>cc` except that the delimiters are aligned down the left side
- `<leader>cb` - Same as `<leader>cc` except that the delimiters are aligned both sides
- `<leader>cu` - Uncomments the selected line(s)

### Align Text **`<leader>a`**
---
- `<leader>a=` - Align selected text by first occurance of '=' sign
- `<leader>a2=` - Align selected text by second occurance of '=' sign
- `<leader>a*=` - Align selected text by all occurances of '=' sign

### COC
---
- `<Ctrl><Space>` - trigger auto complete
- `<Tab>` - navigate the autocomplete list down
- `<Shift><Tab>` - navigate the autocomplete list up
- `<CR>` - confirm the autocomplete selection
- `[c` - go to previous diagnostic issue
- `]c` - go to next diagnostic issue
- `<leader>ld` - go to definition
- `<leader>lt` - go to type definition
- `<leader>li` - go to implementation
- `<leader>lr` - go to references
- `<leader>lk` - show documentation for element under cursor
- `<leader>lrn` - rename element under name
- `<leader>lf` - format selected code
- `<leader>la` - execute code action
- `<leader>lac` - execute code action for current line
- `<leader>lqf` - execute code quick fix















