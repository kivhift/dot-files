#!/usr/bin/env python
"""Generate consolable.vim color scheme."""
from __future__ import print_function

from string import Template

from pu.terminal import Terminal

main_template = '''\
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
$cterm
elseif has("gui_running")
$gui
endif'''

scheme_template = '''\
    hi Normal ${_}fg=$_248 ${_}bg=$_0 ${_}=NONE
    hi TrailingWhiteSpace ${_}fg=NONE ${_}bg=$_88 ${_}=NONE
    hi ColorColumn ${_}fg=NONE ${_}bg=$_235 ${_}=NONE
    hi Conceal ${_}fg=NONE ${_}bg=NONE ${_}=reverse
    hi Cursor ${_}fg=NONE ${_}bg=NONE ${_}=reverse
    hi CursorIM ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi CursorColumn ${_}fg=NONE ${_}bg=$_235 ${_}=NONE
    hi CursorLine ${_}fg=NONE ${_}bg=NONE ${_}=underline
    hi Directory ${_}fg=$_39 ${_}bg=NONE ${_}=NONE
    hi DiffAdd ${_}fg=$_34 ${_}bg=NONE ${_}=underline
    hi DiffChange ${_}fg=$_184 ${_}bg=NONE ${_}=underline
    hi DiffDelete ${_}fg=$_124 ${_}bg=NONE ${_}=underline
    hi DiffText ${_}fg=$_129 ${_}bg=$_17 ${_}=underline
    hi ErrorMsg ${_}fg=$_250 ${_}bg=$_88 ${_}=NONE
    hi VertSplit ${_}fg=$_22 ${_}bg=$_235 ${_}=underline
    hi Folded ${_}fg=$_39 ${_}bg=NONE ${_}=underline
    hi FoldColumn ${_}fg=$_39 ${_}bg=NONE ${_}=NONE
    hi SignColumn ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi IncSearch ${_}fg=$_34 ${_}bg=$_88 ${_}=underline
    hi LineNr ${_}fg=$_24 ${_}bg=$_233 ${_}=NONE
    hi CursorLineNr ${_}fg=$_88 ${_}bg=$_202 ${_}=NONE
    hi MatchParen ${_}fg=$_0 ${_}bg=$_93 ${_}=NONE
    hi ModeMsg ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi MoreMsg ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi NonText ${_}fg=$_21 ${_}bg=NONE ${_}=NONE
    hi Pmenu ${_}fg=$_245 ${_}bg=$_235 ${_}=NONE
    hi PmenuSel ${_}fg=$_0 ${_}bg=$_28 ${_}=underline
    hi PmenuSbar ${_}fg=NONE ${_}bg=$_233 ${_}=NONE
    hi PmenuThumb ${_}fg=NONE ${_}bg=$_245 ${_}=NONE
    hi Question ${_}fg=$_34 ${_}bg=NONE ${_}=NONE
    hi Search ${_}fg=$_34 ${_}bg=$_52 ${_}=underline
    hi SpecialKey ${_}fg=$_142 ${_}bg=NONE ${_}=NONE
    hi SpellBad ${_}fg=$_160 ${_}bg=NONE ${_}=underline
    hi SpellCap ${_}fg=$_27 ${_}bg=NONE ${_}=underline
    hi SpellLocal ${_}fg=$_172 ${_}bg=NONE ${_}=underline
    hi SpellRare ${_}fg=$_58 ${_}bg=NONE ${_}=underline
    hi StatusLine ${_}fg=$_40 ${_}bg=$_235 ${_}=underline
    hi StatusLineNC ${_}fg=$_240 ${_}bg=$_235 ${_}=underline
    hi TabLine ${_}fg=$_240 ${_}bg=NONE ${_}=underline
    hi TabLineFill ${_}fg=$_240 ${_}bg=NONE ${_}=underline
    hi TabLineSel ${_}fg=$_40 ${_}bg=$_235 ${_}=underline
    hi Title ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi Visual ${_}fg=NONE ${_}bg=$_236 ${_}=NONE
    hi VisualNOS ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi WarningMsg ${_}fg=$_124 ${_}bg=NONE ${_}=NONE
    hi WildMenu ${_}fg=$_178 ${_}bg=$_88 ${_}=underline

    hi Comment ${_}fg=$_28 ${_}bg=$_234 ${_}=NONE
    hi Constant ${_}fg=$_63 ${_}bg=NONE ${_}=NONE
    hi Special ${_}fg=$_100 ${_}bg=$_234 ${_}=NONE
    hi Identifier ${_}fg=$_166 ${_}bg=NONE ${_}=NONE
    hi Statement ${_}fg=$_112 ${_}bg=NONE ${_}=NONE
    hi PreProc ${_}fg=$_25 ${_}bg=$_234 ${_}=NONE
    hi Type ${_}fg=$_34 ${_}bg=NONE ${_}=NONE
    hi Underlined ${_}fg=NONE ${_}bg=NONE ${_}=underline
    hi Ignore ${_}fg=$_233 ${_}bg=NONE ${_}=NONE
    hi Error ${_}fg=$_250 ${_}bg=$_88 ${_}=NONE
    hi Todo ${_}fg=$_52 ${_}bg=$_202 ${_}=NONE
    hi String ${_}fg=$_30 ${_}bg=$_234 ${_}=NONE
    hi Number ${_}fg=$_128 ${_}bg=$_17 ${_}=NONE
    hi Function ${_}fg=$_39 ${_}bg=NONE ${_}=NONE
    hi Keyword ${_}fg=$_57 ${_}bg=$_17 ${_}=NONE'''

tc = Terminal.term_colors()
cterm = dict(_ = 'cterm')
gui = dict(_ = 'gui')
for i in xrange(256):
    si = str(i)
    _i = '_' + si
    cterm[_i] = si
    gui[_i] = '#' + tc[i]

schemes = dict(
    cterm = Template(scheme_template).substitute(cterm),
    gui = Template(scheme_template).substitute(gui)
)

print(Template(main_template).substitute(schemes))
