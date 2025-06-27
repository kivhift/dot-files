" This file was generated via consolable.vim.py.

set background=dark
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='consolable'

hi! link Terminal Normal
hi! link StatuslineTerm Statusline
hi! link StatuslineTermNC StatuslineNC
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow PMenu
hi! link PopupNotification Todo
hi! link CurSearch IncSearch

if has('gui_running') || (has('termguicolors') && &termguicolors)
    hi Normal guifg=#a8a8a8 guibg=#000000 gui=NONE cterm=NONE

    hi ColorColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
    hi Conceal guifg=NONE guibg=NONE gui=reverse cterm=reverse
    hi Cursor guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi CursorColumn guifg=NONE guibg=#262626 gui=NONE cterm=NONE
    hi CursorIM guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi CursorLine guifg=NONE guibg=#262626 gui=italic cterm=italic
    hi CursorLineNr guifg=#000000 guibg=#ff5f00 gui=NONE cterm=NONE
    hi DiffAdd guifg=#00d787 guibg=#005f00 gui=NONE cterm=NONE
    hi DiffChange guifg=#000000 guibg=#5f8700 gui=NONE cterm=NONE
    hi DiffDelete guifg=#00d787 guibg=#5f0000 gui=NONE cterm=NONE
    hi DiffText guifg=#00d787 guibg=#5f00af gui=NONE cterm=NONE
    hi Directory guifg=#00afff guibg=NONE gui=NONE cterm=NONE
    hi ErrorMsg guifg=#bcbcbc guibg=#870000 gui=NONE cterm=NONE
    hi FoldColumn guifg=#00afff guibg=NONE gui=NONE cterm=NONE
    hi Folded guifg=#00afff guibg=NONE gui=underline cterm=underline
    hi IncSearch guifg=#00d700 guibg=#5f0000 gui=bold,underline cterm=bold,underline
    hi LineNr guifg=#005f87 guibg=#121212 gui=NONE cterm=NONE
    hi MatchParen guifg=#ff00af guibg=NONE gui=bold,underline cterm=bold,underline
    hi ModeMsg guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi MoreMsg guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi NonText guifg=#5f0000 guibg=#080808 gui=NONE cterm=NONE
    hi Pmenu guifg=#8a8a8a guibg=#262626 gui=NONE cterm=NONE
    hi PmenuSbar guifg=NONE guibg=#121212 gui=NONE cterm=NONE
    hi PmenuSel guifg=#000000 guibg=#008700 gui=underline cterm=underline
    hi PmenuThumb guifg=NONE guibg=#8a8a8a gui=NONE cterm=NONE
    hi Question guifg=#00af00 guibg=NONE gui=NONE cterm=NONE
    hi Search guifg=#00af00 guibg=#5f0000 gui=NONE cterm=NONE
    hi SignColumn guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi SpecialKey guifg=#afaf00 guibg=NONE gui=NONE cterm=NONE
    hi SpellBad guifg=#d70000 guibg=NONE gui=underline cterm=underline
    hi SpellCap guifg=#005fff guibg=NONE gui=underline cterm=underline
    hi SpellLocal guifg=#d78700 guibg=NONE gui=underline cterm=underline
    hi SpellRare guifg=#5f5f00 guibg=NONE gui=underline cterm=underline
    hi StatusLine guifg=#00d700 guibg=#262626 gui=underline cterm=underline
    hi StatusLineNC guifg=#585858 guibg=#262626 gui=underline cterm=underline
    hi TabLine guifg=#585858 guibg=NONE gui=underline cterm=underline
    hi TabLineFill guifg=#585858 guibg=NONE gui=underline cterm=underline
    hi TabLineSel guifg=#00d700 guibg=#262626 gui=underline cterm=underline
    hi Title guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi VertSplit guifg=#005f00 guibg=#262626 gui=underline cterm=underline
    hi Visual guifg=NONE guibg=#00005f gui=NONE cterm=NONE
    hi VisualNOS guifg=NONE guibg=NONE gui=NONE cterm=NONE
    hi WarningMsg guifg=#af0000 guibg=NONE gui=NONE cterm=NONE
    hi WildMenu guifg=#d7af00 guibg=#870000 gui=underline cterm=underline

    hi Comment guifg=#6c6c6c guibg=#121212 gui=italic cterm=italic
    hi Constant guifg=#d7005f guibg=NONE gui=NONE cterm=NONE
    hi Error guifg=#bcbcbc guibg=#870000 gui=NONE cterm=NONE
    hi Function guifg=#0087ff guibg=NONE gui=italic cterm=italic
    hi Identifier guifg=#d75f00 guibg=NONE gui=NONE cterm=NONE
    hi Ignore guifg=#444444 guibg=NONE gui=NONE cterm=NONE
    hi Keyword guifg=#afaf00 guibg=#000000 gui=italic cterm=italic
    hi Number guifg=#af00d7 guibg=NONE gui=NONE cterm=NONE
    hi PreProc guifg=#af5fff guibg=#121212 gui=italic cterm=italic
    hi Special guifg=#878700 guibg=#121212 gui=NONE cterm=NONE
    hi Statement guifg=#87d700 guibg=NONE gui=italic cterm=italic
    hi String guifg=#008700 guibg=#121212 gui=NONE cterm=NONE
    hi Todo guifg=#5f0000 guibg=#ff5f00 gui=NONE cterm=NONE
    hi Type guifg=#5fd700 guibg=#00005f gui=italic cterm=italic
    hi Underlined guifg=NONE guibg=NONE gui=underline cterm=underline

    let g:terminal_ansi_colors = [
\       '#000000',
\       '#800000',
\       '#008000',
\       '#808000',
\       '#000080',
\       '#800080',
\       '#008080',
\       '#c0c0c0',
\       '#808080',
\       '#ff0000',
\       '#00ff00',
\       '#ffff00',
\       '#0000ff',
\       '#ff00ff',
\       '#00ffff',
\       '#ffffff'
\   ]

    finish
endif

if 256 == &t_Co
    hi Normal ctermfg=248 ctermbg=0 cterm=NONE

    hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorIM ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=235 cterm=italic
    hi CursorLineNr ctermfg=0 ctermbg=202 cterm=NONE
    hi DiffAdd ctermfg=42 ctermbg=22 cterm=NONE
    hi DiffChange ctermfg=0 ctermbg=64 cterm=NONE
    hi DiffDelete ctermfg=42 ctermbg=52 cterm=NONE
    hi DiffText ctermfg=42 ctermbg=55 cterm=NONE
    hi Directory ctermfg=39 ctermbg=NONE cterm=NONE
    hi ErrorMsg ctermfg=250 ctermbg=88 cterm=NONE
    hi FoldColumn ctermfg=39 ctermbg=NONE cterm=NONE
    hi Folded ctermfg=39 ctermbg=NONE cterm=underline
    hi IncSearch ctermfg=40 ctermbg=52 cterm=bold,underline
    hi LineNr ctermfg=24 ctermbg=233 cterm=NONE
    hi MatchParen ctermfg=199 ctermbg=NONE cterm=bold,underline
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi NonText ctermfg=52 ctermbg=232 cterm=NONE
    hi Pmenu ctermfg=245 ctermbg=235 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=233 cterm=NONE
    hi PmenuSel ctermfg=0 ctermbg=28 cterm=underline
    hi PmenuThumb ctermfg=NONE ctermbg=245 cterm=NONE
    hi Question ctermfg=34 ctermbg=NONE cterm=NONE
    hi Search ctermfg=34 ctermbg=52 cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=142 ctermbg=NONE cterm=NONE
    hi SpellBad ctermfg=160 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=27 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=172 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=58 ctermbg=NONE cterm=underline
    hi StatusLine ctermfg=40 ctermbg=235 cterm=underline
    hi StatusLineNC ctermfg=240 ctermbg=235 cterm=underline
    hi TabLine ctermfg=240 ctermbg=NONE cterm=underline
    hi TabLineFill ctermfg=240 ctermbg=NONE cterm=underline
    hi TabLineSel ctermfg=40 ctermbg=235 cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=22 ctermbg=235 cterm=underline
    hi Visual ctermfg=NONE ctermbg=17 cterm=NONE
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=124 ctermbg=NONE cterm=NONE
    hi WildMenu ctermfg=178 ctermbg=88 cterm=underline

    hi Comment ctermfg=242 ctermbg=233 cterm=italic
    hi Constant ctermfg=161 ctermbg=NONE cterm=NONE
    hi Error ctermfg=250 ctermbg=88 cterm=NONE
    hi Function ctermfg=33 ctermbg=NONE cterm=italic
    hi Identifier ctermfg=166 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=238 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=142 ctermbg=0 cterm=italic
    hi Number ctermfg=128 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=135 ctermbg=233 cterm=italic
    hi Special ctermfg=100 ctermbg=233 cterm=NONE
    hi Statement ctermfg=112 ctermbg=NONE cterm=italic
    hi String ctermfg=28 ctermbg=233 cterm=NONE
    hi Todo ctermfg=52 ctermbg=202 cterm=NONE
    hi Type ctermfg=76 ctermbg=17 cterm=italic
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline

    finish
endif
