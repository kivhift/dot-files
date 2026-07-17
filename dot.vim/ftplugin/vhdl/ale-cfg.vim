" Bail if we don't have ALE installed.
if !exists('g:ale_enabled')
    finish
endif

let b:ale_linters = ['ghdl', 'vcom']
