" Bail if we don't have ALE installed.
if !exists('g:ale_enabled')
    finish
endif

let b:ale_enabled = 1

let b:ale_completion_enabled = 1
let b:ale_fix_on_save = 1
let b:ale_fixers = {
    \ 'rust': ['rustfmt'],
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let b:ale_linters = { 'rust': ['analyzer', 'cargo'] }
let b:ale_rust_cargo_use_clippy = 1
let b:ale_sign_column_always = 1

" Be able to switch to definitions, etc, without saving first.
setlocal bufhidden=hide

nmap <buffer> <C-]> <plug>(ale_go_to_definition)
nmap <buffer> [W <plug>(ale_first)
nmap <buffer> ]W <plug>(ale_last)
nmap <buffer> [w <plug>(ale_previous)
nmap <buffer> ]w <plug>(ale_next)
