" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set foldmethod=indent
set foldopen=all foldclose=all
" Start off with folding disabled.
set nofoldenable foldcolumn=0
nnoremap <silent> <expr> <leader>f ToggleFolding()
nnoremap <silent> <expr> <leader>fs FS_ToggleFoldAroundSearch({'context':1})
function! ToggleFolding()
    if &foldenable
        set nofoldenable foldcolumn=0
    else
        set foldenable foldcolumn=4
    endif
endfunction

if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

set pastetoggle=<insert>

" Always want autoindenting to be on
set autoindent

" Keep no backup file
set nobackup

" Keep 50 lines of command line history
set history=50

" Show the cursor position all of the time
set ruler

" Show status line with info. about current file, etc.
function! StatusLine()
    let L = "%t%<(%M%n%R%W%Y,%{&ff},%{&fenc}"
    if &spell
        let L .= ",sp"
    endif
    if &list
        let L .= ",li"
    endif
    if &paste
        let L .= ",pa"
    endif
    let L .= ")%=0x%B@b%O L%l/%L C%c%V %p%%"

    return L
endfunction
set statusline=%!StatusLine()

" Always have the status line shown.
set laststatus=2

" Show incomplete commands while typing them in
set showcmd

" Indicate the matching whatever...
set showmatch

" Add < & > to the default match pairs; useful for HTML and the like.
set matchpairs+=<:>

" To keep within a "normal" terminal with 80-character width, set the text
" width to 79 characters; one less than 80 to keep the last column empty and be
" more less/cat/etc friendly.
set textwidth=79

" Show the textwidth setting.
set colorcolumn=+0

" Only redraw when needed.
set lazyredraw

" Give a little scrolling context so that we can see what's coming.
set scrolloff=2
set sidescroll=1
set sidescrolloff=5

" Make <tab> and <bs> smarter.
set smarttab

" Make sure that the mapping, etc., timeout is set and a little bit shorter
" than the default; 700 ms vs. 1000 ms.
set timeout
set timeoutlen=700

set spelllang=en_us

" Do incremental searching so we can bail early if we want to.
set incsearch

" Don't do the wrap silliness.
set nowrap

" Keep things quiet!
set visualbell

" Instead of ~/tmp use ~/.vim/tmp.
set directory=.,~/.vim/tmp,/var/tmp,/tmp

" Show a little info
set title
"set titleold=Bye\ from\ vim...

" Perhaps I'm getting soft in my old age, but I'm liking 4 with spaces more and
" more...  So, make the shift width and number of logical spaces per tab be 4
" and expand tabs.  However, respect stuff that's already there and use an
" autocmd below to detect tabs and adjust to 8 with no expansion.
set shiftwidth=4 tabstop=4 expandtab

" Make < and > round to shiftwidth columns as well.
set shiftround

set shortmess=aTOotI
set showbreak=+__
set splitbelow

" Make things pretty...
set formatoptions=tcroqlnj

set printoptions=paper:letter,duplex:off,collate:n,syntax:n
set pdev=auto1

" let's try to do some unicode stuff
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,default

" XXX: Need to adjust this for the linux boxes.  This is just a Q&D fix for
" the cygwin stuff for now.  (Ah, the wonderful world of character
" encodings.  (*sarcasm alert*) Why can't everyone in the world just use
" English so that 8-bit characters suffice?  Meh.)
if &term =~ 'xterm' || &term =~ 'screen'
    set termencoding=utf-8
endif

set listchars=tab:>¬,trail:º,extends:>,precedes:<

set runtimepath=$HOME/.vim,$VIMRUNTIME

" Make it easier to use movements but use the fewest columns possible.
set relativenumber number
set numberwidth=1

" Be able to see what's coming with the commandline completion.
set wildchar=<tab>
set wildmenu
set wildmode=longest,full
set wildignore=*.o,*.py[co]

" Make it easy to see where the cursor has gone.
nmap <silent> <Leader>c :setlocal invcursorline invcursorcolumn<cr>
nmap <silent> <Leader>L :setlocal invcursorline<cr>
nmap <silent> <Leader>C :setlocal invcursorcolumn<cr>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Left hand, stretch no more!  Hmm, laziness ensues.
inoremap jj <esc>
inoremap <c-o> <c-\><c-o>

" Handy insert maps for a current-date-and-time time stamp.
inoremap <leader>ts <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap [ts [<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>]
" And one for just the date.
inoremap (ds (<C-R>=strftime("%Y-%m-%d")<CR>)

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    colorscheme consolable
    set hlsearch
endif

if has("gui_running")
    set guioptions=egt
endif

if has("gui_win32")
    set guifont=Ubuntu_Mono:h12:cANSI
    " This is purloined from Vim 7.4's stock mswin.vim (with slight
    " adjustments).
    nnoremap <silent> <m-space> :simalt ~<cr>
    inoremap <silent> <m-space> <c-o>:simalt ~<cr>
    cnoremap <silent> <m-space> <c-c>:simalt ~<cr>
endif

command! Difforig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis

command! GenerateTags !ctags -R
command! Spon setlocal spell
command! Spoff setlocal nospell

command! -nargs=? CSearch vimgrep /<args>/j **/*.c **/*.h | copen
command! -nargs=? CSearchAdd vimgrepadd /<args>/j **/*.c **/*.h | copen
command! -nargs=? CppSearch vimgrep /<args>/j **/*.cpp **/*.h **/*.cc **/*.hpp | copen
command! -nargs=? CppSearchAdd vimgrepadd /<args>/j **/*.cpp **/*.h **/*.cc **/*.hpp | copen
command! -nargs=? PySearch vimgrep /<args>/j **/*.py | copen
command! -nargs=? PySearchAdd vimgrepadd /<args>/j **/*.py | copen

nmap <silent> <Leader>s :setlocal invspell<cr>
nmap <silent> <Leader>l :setlocal invlist<cr>
nmap <silent> <Leader>n :setlocal invnumber<cr>
nmap <silent> <Leader>r :setlocal invrelativenumber<cr>
nmap <silent> <Leader>v :next $MYVIMRC<cr>
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end
nnoremap <space> <pagedown>
" This won't work in a terminal since curses can't distinguish between
" <space> and <s-space>.  Alas, at least the GUI...
nnoremap <s-space> <pageup>
nnoremap <bs> <pageup>
nnoremap <c-]> g<c-]>
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup end
function! HelpInNewTab()
    if &buftype == 'help'
        execute "normal \<C-W>T"
        setlocal nospell
    endif
endfunction
set virtualedit=block
nmap <silent> // :nohlsearch<cr>
nmap / /\v
nmap ? ?\v
cmap s/ s/\v

function! ToggleTrailingWhiteSpaceHighlight()
    if exists('b:trailing_ws_id')
        call matchdelete(b:trailing_ws_id)
        unlet b:trailing_ws_id
    else
        let b:trailing_ws_id = matchadd('TrailingWhiteSpace', '\s\+$')
    endif
endfunction
nmap <silent> <Leader>w :call ToggleTrailingWhiteSpaceHighlight()<cr>
" Always make the trailing whitespace visible.
let b:trailing_ws_id = matchadd('TrailingWhiteSpace', '\s\+$')

" Setup the tagslist plugin.
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 0
let Tlist_Sort_Type = "name"
let Tlist_Use_Horiz_Window = 1
let Tlist_WinHeight = 20
nmap <silent> <Leader>t :TlistToggle<cr>

" Setup the outlookvim plugin.
let g:outlook_use_tabs = 1
let g:outlook_servername = 'OUTLOOK'
let g:outlook_supported_body_format = 'html'
let g:outlook_noautoread = 0
let g:outlook_nobdelete = 0
let g:outlook_nodelete_unload = 0
let g:outlook_save_cscript_output = 1
let g:outlook_debug = 0
let g:outlook_always_use_Unicode = 1
let g:outlook_scan_email_body_Unicode = 1

" Set this so that Python files will be highlighted as wanted.
let python_highlight_all = 1

let c_space_errors=1

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " To respect stuff that uses tabs, make sure to adjust things back to 8
    " if a tab is found.
    autocmd BufReadPost *
        \ if search("\t", "cnw") > 0
        \ |   setlocal shiftwidth=8 tabstop=8 noexpandtab
        \ | endif

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event
    " handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$")
        \ |   exe "normal g`\""
        \ | endif

    function! GetTestAppName()
        if exists("b:testapp")
            echo "Current test app: '" . b:testapp . "'."
        endif
        let res = input("Please give test app: ")
        if '' != res
            let b:testapp = res
            redraw | echo "Given test app: '" . b:testapp . "'."
        endif
    endfunction

    function! MaybeRunTestApp()
        if exists("b:testapp")
            execute "!" b:testapp
        else
            call GetTestAppName()
            call MaybeRunTestApp()
        endif
    endfunction

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent
    " indenting.
    filetype plugin indent on

    " make sure that we know when we have a text file
    autocmd BufNewFile,BufRead *.txt,*.text setf text
    autocmd FileType text setlocal spell
    autocmd FileType rst setlocal spell

    autocmd FileType gitcommit setlocal textwidth=75

    " For all mail set 'textwidth' to 70 characters.
    autocmd FileType mail setlocal textwidth=70 spell

    " If we're editing C/C++/Java source...
    autocmd FileType c,cpp,java setlocal formatoptions-=t
    autocmd FileType c,cpp,java :ino <buffer> if( if()<space>{<cr>}<up><esc>$F(a
    autocmd FileType c,cpp,java :ino <buffer> for(
        \ for()<space>{<cr>}<up><esc>$F(a
    autocmd FileType c,cpp,java :ino <buffer> while(
        \ while()<space>{<cr>}<up><esc>$F(a
    autocmd FileType c,cpp,java :ino <buffer> do<space>{
        \ do<space>{<cr>}<space>while();<esc>F(a
    autocmd FileType c,cpp,java :ino <buffer> switch(
        \ switch()<space>{<cr>
        \#if<space>0<cr>
        \<c-d>case<space>:<cr>break;<cr>
        \#endif<cr>
        \<c-d>default:<cr>break;<cr>
        \}<esc>7k^wa
    autocmd FileType c,cpp,java,javascript
        \ :ino <buffer> {<cr> {<cr>}<up><end><cr>
    autocmd FileType c,cpp,java setlocal matchpairs+==:;
    autocmd FileType c,cpp :ino <buffer> #if #if<space><cr>#endif<up>

    " Make it easy to build/run things.
    autocmd FileType c,cpp :nmap <buffer> <f7> :make<cr>
    autocmd FileType c,cpp,python,sh
        \ :nmap <buffer> <f5> :call MaybeRunTestApp()<cr>
    autocmd Filetype python,sh let b:testapp=expand('%')
    autocmd FileType c,cpp,python,sh
        \ :nmap <buffer> <f6> :call GetTestAppName()<cr>

    " Make vim know about the Arduino files actually being C/C++.
    autocmd BufNewFile,BufRead *.ino,*.pde setlocal filetype=c

    autocmd FileType python,javascript,vb setlocal formatoptions-=t

    " If it's an MSP430 assembly language file...
    autocmd BufNewFile,BufRead *.s43 setlocal filetype=msp

    " Ah, *ML and its nesting...
    autocmd FileType html,xml setlocal sw=2 ts=2 expandtab

    " If we're editing mail via vimperator, make sure vim knows.
    autocmd BufNewFile,BufRead *vimperator*.tmp setlocal filetype=mail

    " If we're editing Outlook's mail, make sure vim knows.
    autocmd BufNewFile,BufRead *.outlook setlocal filetype=mail fenc=utf-16le
endif " has("autocmd")

" This completion stuff was initially taken from Damian Conway's article(s)
" on IBM's DeveloperWorks site.
" http://www.ibm.com/developerworks/linux/library/l-vim-script-3/index.html

let s:completions = []
function! AddCompletion(left, right, completion, restore)
    call insert(s:completions, [a:left, a:right, a:completion, a:restore])
endfunction

let s:creO = "\<cr>\<esc>O"
let s:creOt = s:creO . "\<tab>"
let s:R = "\<right>"

call AddCompletion('{', '', "}", 1)
call AddCompletion('{', '}', s:creO, 0)
call AddCompletion('\[', '', "]", 1)
call AddCompletion('\[', '\]', s:creO, 0)
call AddCompletion('(', '', ')', 1)
call AddCompletion('(', ')', s:R, 0)
"call AddCompletion('(', ')', "\<esc>la;\<esc>hi", 0)
call AddCompletion('<', '', '>', 1)
call AddCompletion('<', '>', s:creO, 0)
call AddCompletion('"', '', '"', 1)
call AddCompletion('"', '"', "\\n", 1)
call AddCompletion('"""', '', '"""', 1)
call AddCompletion('"""', '"""', s:creO, 0)
call AddCompletion("'", '', "'", 1)
call AddCompletion("'", "'", "\\n", 1)
call AddCompletion('=', '', ";", 1)
" Be able to push on through...
"call AddCompletion('[^{]', '}', s:R, 0)
"call AddCompletion('[^[]', ']', s:R, 0)
"call AddCompletion('[^(]', ')', s:R, 0)
"call AddCompletion('[^<]', '>', s:R, 0)
"call AddCompletion('[^"]', '"', s:R, 0)
"call AddCompletion("[^']", "'", s:R, 0)
call AddCompletion('/\*', '', "  */\<esc>hhi", 0)
call AddCompletion('/\* ', ' \*/', "\<bs>\<cr>\<bs>\<bs>\<esc>O", 0)

function! TabComplete()
    let cursor_pos = getpos('.')
    let cursor_col = cursor_pos[2]
    let curr_line = getline('.')

    " Match only at cursor position.
    let curr_pos_pat = '\%' . cursor_col . 'c'

    " Usual tabs at left margin.
    if curr_line =~ '^\s*' . curr_pos_pat
        return "\<tab>"
    endif

    let cursor_restore =
        \ "\<c-o>:call setpos('.'," . string(cursor_pos) . ")\<cr>"

    for [L, R, completion, restore] in s:completions
        let pat = L . curr_pos_pat . R
        if curr_line =~ pat
            " Code around bug in setpos() when @ EOL.
            if cursor_col == strlen(curr_line) + 1
            \ && strlen(completion) == 1
                let cursor_restore = "\<left>"
            endif

            return completion . (restore ? cursor_restore : "")
        endif
    endfor

    " If we're at a keyword, do completion.  Otherwise, just tab.
    if curr_line =~ '\k' . curr_pos_pat
        return "\<c-n>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <tab> <c-r>=TabComplete()<cr>

" Underline the current line with the given character.
"
" The underline goes from the first non-whitespace position to the last
" non-whitespace position.  If the current line is already underlined, then
" the current underline character is used and the underline is (possibly)
" adjusted to the current line.  The given character is used otherwise.
"
" The current line is said to be underlined if the next line consists of a
" contiguous repetition of one character with any amount of whitespace on
" either side.
"
" Inspired by:
"   http://vim.wikia.com/wiki/Underline_using_dashes_automatically
function! Underline_with(char)
    let curr_pos = getpos('.')
    let L = curr_pos[1]
    let Lp1 = L + 1
    call cursor(L, 1)
    let S_start = searchpos('\S', 'c', L)
    if 0 == S_start[0]
        call setpos('.', curr_pos)
        return
    endif
    " Deal with UTF-8, Tabs, etc., by using the virtual column.
    let virt_start = virtcol('.')
    call searchpos('\S\s*$', 'c', L)
    let virt_end = virtcol('.')
    if search('^\s*\(\S\)\1*\s*$', 'W', Lp1)
        let need_append = 0
        let old_underline = getline(Lp1)
        let ch = old_underline[searchpos('\S', 'cW', Lp1)[1] - 1]
    else
        let need_append = 1
        let ch = a:char
    endif
    let new_underline = strpart(getline(L), 0, S_start[1] - 1)
    let new_underline .= repeat(ch, virt_end - virt_start + 1)
    if need_append
        call append(L, new_underline)
    elseif old_underline != new_underline
        call setline(Lp1, new_underline)
    endif
    " Put us on the underline in the same column.
    let curr_pos[1] += 1
    call setpos('.', curr_pos)
endfunction
command! -nargs=? Underline call Underline_with(<f-args>)
nmap <silent> <Leader>U :call Underline_with('=')<cr>
nmap <silent> <Leader>u :call Underline_with('-')<cr>

" Get rid of all the line-ending whitespace in the current file without moving
" the cursor to the ultimate substitution.  Don't whine if nothing's found to
" substitute.
function! Trim_dead_whitespace()
    let curr_pos = getpos('.')
    :%substitute/\v\s+$//eg
    call setpos('.', curr_pos)
endfunction
nmap <silent> <Leader>T :call Trim_dead_whitespace()<cr>

" Tidy the cursor's current paragraph by selecting it and then sorting.
nmap <silent> <leader>t vip:sort<cr>
" Select the cursor's current paragraph and gq it.
nmap <silent> <leader>g vipgq

" Use the arrow keys to navigate after a :(help|vim)grep
nmap <silent> <right>         :cnext<cr>
nmap <silent> <right><right>  :cnfile<cr><c-g>
nmap <silent> <left>          :cprev<cr>
nmap <silent> <left><left>    :cpfile<cr><c-g>

vmap <expr> > ShiftAndKeepVisualSelection(">")
vmap <expr> < ShiftAndKeepVisualSelection("<")

function! ShiftAndKeepVisualSelection(cmd)
    if mode() =~ '[Vv]'
        return a:cmd . "gv"
    else
        return a:cmd
    endif
endfunction
