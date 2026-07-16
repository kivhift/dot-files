" Bail if we don't have ALE installed.
if !exists('g:ale_enabled')
    finish
endif

let b:ale_fix_on_save = 1
let b:ale_linters = ['shell', 'shellcheck']
let b:ale_sh_shellcheck_options = '--shell=bash'
