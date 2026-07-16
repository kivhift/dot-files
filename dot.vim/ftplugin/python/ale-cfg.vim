" Bail if we don't have ALE installed.
if !exists('g:ale_enabled')
    finish
endif

let b:ale_fix_on_save = v:true
let b:ale_fixers = ['ruff', 'ruff_format']
let b:ale_linters = ['ruff']
