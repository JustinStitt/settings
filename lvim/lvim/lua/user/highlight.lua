vim.api.nvim_command [[
  autocmd ColorScheme * highlight NormalFloat guibg=#1f1f28
]]

vim.api.nvim_command [[ autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f1f28 ]]

vim.api.nvim_command [[
  autocmd ColorScheme * highlight TreesitterContext guibg=#2a2a37
]]

vim.api.nvim_command [[
  autocmd ColorScheme * highlight SpellBad guifg=red
  autocmd FileType gitcommit setlocal spell
  set listchars=tab:>\ ,trail:-,nbsp:+,eol:$
]]

vim.cmd [[
  match Space /\s/
]]

vim.cmd [[
  function! HiTabs()
  syntax match TAB /\t/
  hi TAB ctermbg=blue ctermfg=red
  endfunction
  au BufEnter,BufRead * call HiTabs()
]]

-- vim.cmd [[
-- function! RunOnWorkingDirectoryEnterIsLinux()
--   if expand('%:p:h') =~# "linux"
--   endif
-- endfunction

-- autocmd BufEnter * call RunOnWorkingDirectoryEnterIsLinux()
-- ]]
