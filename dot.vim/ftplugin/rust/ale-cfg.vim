" Bail if we don't have ALE installed.
if !exists('g:ale_enabled')
    finish
endif

let b:ale_completion_enabled = 1
let b:ale_fix_on_save = 1
let b:ale_fixers = ['rustfmt']
let b:ale_linters = ['analyzer', 'cargo']
let b:ale_rust_cargo_use_clippy = 1

" Be able to switch to definitions, etc, without saving first.
setlocal bufhidden=hide

nmap <buffer> <C-]> <plug>(ale_go_to_definition)
