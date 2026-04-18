#!/usr/bin/env python3

'''Generate consolable.vim color scheme.'''

from string import Template

main_template = '''\
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
$gui

    finish
endif

if 256 == &t_Co
$cterm

    finish
endif'''

scheme_template = '''\
    hi Normal ${_}fg=$_248 ${_}bg=$_0 ${_}=NONE

    hi ColorColumn ${_}fg=NONE ${_}bg=$_234 ${_}=NONE
    hi Conceal ${_}fg=fg ${_}bg=bg ${_}=reverse
    hi Cursor ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi CursorColumn ${_}fg=NONE ${_}bg=$_235 ${_}=NONE
    hi CursorIM ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi CursorLine ${_}fg=NONE ${_}bg=$_235 ${_}=italic
    hi CursorLineNr ${_}fg=$_0 ${_}bg=$_202 ${_}=NONE
    hi DiffAdd ${_}fg=$_42 ${_}bg=$_22 ${_}=NONE
    hi DiffChange ${_}fg=$_0 ${_}bg=$_64 ${_}=NONE
    hi DiffDelete ${_}fg=$_42 ${_}bg=$_52 ${_}=NONE
    hi DiffText ${_}fg=$_42 ${_}bg=$_55 ${_}=NONE
    hi Directory ${_}fg=$_39 ${_}bg=NONE ${_}=NONE
    hi ErrorMsg ${_}fg=$_250 ${_}bg=$_88 ${_}=NONE
    hi FoldColumn ${_}fg=$_39 ${_}bg=NONE ${_}=NONE
    hi Folded ${_}fg=$_39 ${_}bg=NONE ${_}=underline
    hi IncSearch ${_}fg=$_40 ${_}bg=$_52 ${_}=bold,underline
    hi LineNr ${_}fg=$_24 ${_}bg=$_233 ${_}=NONE
    hi MatchParen ${_}fg=$_199 ${_}bg=NONE ${_}=bold,underline
    hi ModeMsg ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi MoreMsg ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi NonText ${_}fg=$_52 ${_}bg=$_232 ${_}=NONE
    hi Pmenu ${_}fg=$_245 ${_}bg=$_235 ${_}=NONE
    hi PmenuSbar ${_}fg=NONE ${_}bg=$_233 ${_}=NONE
    hi PmenuSel ${_}fg=$_0 ${_}bg=$_28 ${_}=underline
    hi PmenuThumb ${_}fg=NONE ${_}bg=$_245 ${_}=NONE
    hi Question ${_}fg=$_34 ${_}bg=NONE ${_}=NONE
    hi Search ${_}fg=$_34 ${_}bg=$_52 ${_}=NONE
    hi SignColumn ${_}fg=fg ${_}bg=bg ${_}=NONE
    hi SpecialKey ${_}fg=$_142 ${_}bg=NONE ${_}=NONE
    hi SpellBad ${_}fg=$_160 ${_}bg=bg ${_}=underline
    hi SpellCap ${_}fg=$_27 ${_}bg=bg ${_}=underline
    hi SpellLocal ${_}fg=$_172 ${_}bg=bg ${_}=underline
    hi SpellRare ${_}fg=$_58 ${_}bg=bg ${_}=underline
    hi StatusLine ${_}fg=$_40 ${_}bg=$_235 ${_}=underline
    hi StatusLineNC ${_}fg=$_240 ${_}bg=$_235 ${_}=underline
    hi TabLine ${_}fg=$_240 ${_}bg=NONE ${_}=underline
    hi TabLineFill ${_}fg=$_240 ${_}bg=NONE ${_}=underline
    hi TabLineSel ${_}fg=$_40 ${_}bg=$_235 ${_}=underline
    hi Title ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi VertSplit ${_}fg=$_22 ${_}bg=$_235 ${_}=underline
    hi Visual ${_}fg=$_199 ${_}bg=$_17 ${_}=italic,underline
    hi VisualNOS ${_}fg=NONE ${_}bg=NONE ${_}=NONE
    hi WarningMsg ${_}fg=$_124 ${_}bg=NONE ${_}=NONE
    hi WildMenu ${_}fg=$_178 ${_}bg=$_88 ${_}=underline

    hi Comment ${_}fg=$_242 ${_}bg=$_233 ${_}=italic
    hi Constant ${_}fg=$_161 ${_}bg=NONE ${_}=NONE
    hi Error ${_}fg=$_250 ${_}bg=$_88 ${_}=NONE
    hi Function ${_}fg=$_33 ${_}bg=NONE ${_}=italic
    hi Identifier ${_}fg=$_166 ${_}bg=NONE ${_}=NONE
    hi Ignore ${_}fg=$_238 ${_}bg=NONE ${_}=NONE
    hi Keyword ${_}fg=$_142 ${_}bg=$_0 ${_}=italic
    hi Number ${_}fg=$_128 ${_}bg=NONE ${_}=NONE
    hi PreProc ${_}fg=$_135 ${_}bg=$_233 ${_}=italic
    hi Special ${_}fg=$_100 ${_}bg=$_233 ${_}=NONE
    hi Statement ${_}fg=$_112 ${_}bg=NONE ${_}=italic
    hi String ${_}fg=$_28 ${_}bg=$_233 ${_}=NONE
    hi Todo ${_}fg=$_52 ${_}bg=$_202 ${_}=NONE
    hi Type ${_}fg=$_76 ${_}bg=$_17 ${_}=italic
    hi Underlined ${_}fg=NONE ${_}bg=NONE ${_}=underline'''

def term_colors():
    '''Return the 256 terminal colors as a list of RGB hex triples.'''

    _rgbfmt = '{:02x}' * 3

    def _3(x, on):
        def _(i):
            return on if i else 0

        n = divmod(x, 8)[1]
        return _rgbfmt.format(_(n & 0b1), _(n & 0b10), _(n & 0b100))

    rgb = []
    ra = rgb.append

    # system colors
    for i in range(7):
        ra(_3(i, 0x80))
    ra(_3(7, 0xc0))
    ra(_3(7, 0x80))
    for i in range(9, 16):
        ra(_3(i, 0xff))

    # color cube
    for r in range(6):
        for g in range(6):
            for b in range(6):
                i = 36 * r + 6 * g + b + 16
                ra(
                    _rgbfmt.format(
                        r and (r * 40 + 55),
                        g and (g * 40 + 55),
                        b and (b * 40 + 55),
                    )
                )

    # grayscale ramp
    for i in range(24):
        x = (i * 10) + 8
        ra(_rgbfmt.format(x, x, x))

    return rgb

tc = term_colors()
cterm = dict(_='cterm')
gui = dict(_='gui')
for i in range(256):
    si = str(i)
    _i = f'_{i}'
    cterm[_i] = si
    gui[_i] = f'#{tc[i]}'

schemes = dict(
    cterm=Template(scheme_template).substitute(cterm),

    # This grossness is to fix up the scheme template to deal with the fact
    # that the termguicolors stuff only uses the GUI colors, not the
    # attributes. We thus have to jam in a cterm. We also need an ANSI-color
    # list.
    gui='\n'.join(
        '{0}={1} cterm={1}'.format(*line.rsplit('=', 1)) if '=' in line else line
        for line in Template(scheme_template).substitute(gui).splitlines()
    ) + Template(
        '\n\n    let g:terminal_ansi_colors = [\n\\       '
        + ',\n\\       '.join(f"'$_{i}'" for i in range(16))
        + '\n\\   ]'
    ).substitute(gui)
)

print(Template(main_template).substitute(schemes))
