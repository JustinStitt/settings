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
--
--  "<cmd>:hi TAB guibg=#333333<cr><cmd>:LvimToggleFormatOnSave<cr><cmd>:set noexpandtab<cr><cmd>:set shiftwidth=2<cr><cmd>:set tabstop=2<cr><cmd>:set list<cr>",

-- function EnterLinuxDevMode()
--   vim.cmd [[ hi TAB guibg=#333333 ]]
-- end

--  "<cmd>:hi TAB guibget shiftwidth=2<cr><cmd>:set tabstop=2<cr><cmd>:set list<cr>",
function EnterLinuxMode()
  vim.cmd [[ hi TAB guibg=#333333 ]]
  disable_format_on_save()
  vim.cmd [[ set noexpandtab ]]
  vim.cmd [[ set shiftwidth=2 ]]
  vim.cmd [[ set tabstop=2 ]]
  vim.cmd [[ set list ]]
end

vim.api.nvim_create_autocmd(
  "BufRead",
  { pattern = "*.c", command = "lua EnterLinuxMode()" }
)

function disable_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
  else
    disable_format_on_save()
  end
end

function disable_format_on_save()
  clear_augroup "lsp_format_on_save"
end

function clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  vim.schedule(function()
    pcall(function()
      vim.api.nvim_clear_autocmds { group = name }
    end)
  end)
end
