" This is generated via consolable.vim.py.
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="consolable"

if 16 == &t_Co
    hi TrailingWhiteSpace ctermfg=NONE ctermbg=red cterm=NONE
elseif 256 == &t_Co
    hi Normal ctermfg=248 ctermbg=0 cterm=NONE
    hi TrailingWhiteSpace ctermfg=NONE ctermbg=88 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi CursorIM ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi Directory ctermfg=39 ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=34 ctermbg=NONE cterm=underline
    hi DiffChange ctermfg=184 ctermbg=NONE cterm=underline
    hi DiffDelete ctermfg=124 ctermbg=NONE cterm=underline
    hi DiffText ctermfg=129 ctermbg=17 cterm=underline
    hi ErrorMsg ctermfg=250 ctermbg=88 cterm=NONE
    hi VertSplit ctermfg=22 ctermbg=235 cterm=underline
    hi Folded ctermfg=39 ctermbg=NONE cterm=underline
    hi FoldColumn ctermfg=39 ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi IncSearch ctermfg=34 ctermbg=88 cterm=underline
    hi LineNr ctermfg=24 ctermbg=NONE cterm=NONE
    hi CursorLineNr ctermfg=88 ctermbg=NONE cterm=underline
    hi MatchParen ctermfg=0 ctermbg=93 cterm=NONE
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi NonText ctermfg=21 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=245 ctermbg=235 cterm=NONE
    hi PmenuSel ctermfg=0 ctermbg=28 cterm=underline
    hi PmenuSbar ctermfg=NONE ctermbg=233 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=245 cterm=NONE
    hi Question ctermfg=34 ctermbg=NONE cterm=NONE
    hi Search ctermfg=34 ctermbg=52 cterm=underline
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
    hi Visual ctermfg=NONE ctermbg=236 cterm=NONE
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=124 ctermbg=NONE cterm=NONE
    hi WildMenu ctermfg=178 ctermbg=88 cterm=underline

    hi Comment ctermfg=28 ctermbg=234 cterm=NONE
    hi Constant ctermfg=63 ctermbg=NONE cterm=NONE
    hi Special ctermfg=100 ctermbg=234 cterm=NONE
    hi Identifier ctermfg=166 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=112 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=25 ctermbg=234 cterm=NONE
    hi Type ctermfg=34 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Ignore ctermfg=233 ctermbg=NONE cterm=NONE
    hi Error ctermfg=250 ctermbg=88 cterm=NONE
    hi Todo ctermfg=52 ctermbg=202 cterm=NONE
    hi String ctermfg=30 ctermbg=234 cterm=NONE
    hi Number ctermfg=128 ctermbg=17 cterm=NONE
    hi Function ctermfg=39 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=57 ctermbg=17 cterm=NONE
elseif has("gui_running")
    hi Normal guifg=#a8a8a8 guibg=#000000 gui=NONE
    hi TrailingWhiteSpace guifg=NONE guibg=#870000 gui=NONE
    hi ColorColumn guifg=NONE guibg=#262626 gui=NONE
    hi Conceal guifg=NONE guibg=NONE gui=reverse
    hi Cursor guifg=NONE guibg=NONE gui=reverse
    hi CursorIM guifg=NONE guibg=NONE gui=NONE
    hi CursorColumn guifg=NONE guibg=#262626 gui=NONE
    hi CursorLine guifg=NONE guibg=NONE gui=underline
    hi Directory guifg=#00afff guibg=NONE gui=NONE
    hi DiffAdd guifg=#00af00 guibg=NONE gui=underline
    hi DiffChange guifg=#d7d700 guibg=NONE gui=underline
    hi DiffDelete guifg=#af0000 guibg=NONE gui=underline
    hi DiffText guifg=#af00ff guibg=#00005f gui=underline
    hi ErrorMsg guifg=#bcbcbc guibg=#870000 gui=NONE
    hi VertSplit guifg=#005f00 guibg=#262626 gui=underline
    hi Folded guifg=#00afff guibg=NONE gui=underline
    hi FoldColumn guifg=#00afff guibg=NONE gui=NONE
    hi SignColumn guifg=NONE guibg=NONE gui=NONE
    hi IncSearch guifg=#00af00 guibg=#870000 gui=underline
    hi LineNr guifg=#005f87 guibg=NONE gui=NONE
    hi CursorLineNr guifg=#870000 guibg=NONE gui=underline
    hi MatchParen guifg=#000000 guibg=#8700ff gui=NONE
    hi ModeMsg guifg=NONE guibg=NONE gui=NONE
    hi MoreMsg guifg=NONE guibg=NONE gui=NONE
    hi NonText guifg=#0000ff guibg=NONE gui=NONE
    hi Pmenu guifg=#8a8a8a guibg=#262626 gui=NONE
    hi PmenuSel guifg=#000000 guibg=#008700 gui=underline
    hi PmenuSbar guifg=NONE guibg=#121212 gui=NONE
    hi PmenuThumb guifg=NONE guibg=#8a8a8a gui=NONE
    hi Question guifg=#00af00 guibg=NONE gui=NONE
    hi Search guifg=#00af00 guibg=#5f0000 gui=underline
    hi SpecialKey guifg=#afaf00 guibg=NONE gui=NONE
    hi SpellBad guifg=#d70000 guibg=NONE gui=underline
    hi SpellCap guifg=#005fff guibg=NONE gui=underline
    hi SpellLocal guifg=#d78700 guibg=NONE gui=underline
    hi SpellRare guifg=#5f5f00 guibg=NONE gui=underline
    hi StatusLine guifg=#00d700 guibg=#262626 gui=underline
    hi StatusLineNC guifg=#585858 guibg=#262626 gui=underline
    hi TabLine guifg=#585858 guibg=NONE gui=underline
    hi TabLineFill guifg=#585858 guibg=NONE gui=underline
    hi TabLineSel guifg=#00d700 guibg=#262626 gui=underline
    hi Title guifg=NONE guibg=NONE gui=NONE
    hi Visual guifg=NONE guibg=#303030 gui=NONE
    hi VisualNOS guifg=NONE guibg=NONE gui=NONE
    hi WarningMsg guifg=#af0000 guibg=NONE gui=NONE
    hi WildMenu guifg=#d7af00 guibg=#870000 gui=underline

    hi Comment guifg=#008700 guibg=#1c1c1c gui=NONE
    hi Constant guifg=#5f5fff guibg=NONE gui=NONE
    hi Special guifg=#878700 guibg=#1c1c1c gui=NONE
    hi Identifier guifg=#d75f00 guibg=NONE gui=NONE
    hi Statement guifg=#87d700 guibg=NONE gui=NONE
    hi PreProc guifg=#005faf guibg=#1c1c1c gui=NONE
    hi Type guifg=#00af00 guibg=NONE gui=NONE
    hi Underlined guifg=NONE guibg=NONE gui=underline
    hi Ignore guifg=#121212 guibg=NONE gui=NONE
    hi Error guifg=#bcbcbc guibg=#870000 gui=NONE
    hi Todo guifg=#5f0000 guibg=#ff5f00 gui=NONE
    hi String guifg=#008787 guibg=#1c1c1c gui=NONE
    hi Number guifg=#af00d7 guibg=#00005f gui=NONE
    hi Function guifg=#00afff guibg=NONE gui=NONE
    hi Keyword guifg=#5f00ff guibg=#00005f gui=NONE
endif
