local _ft = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Outline",
  callback = function()
    vim.wo.signcolumn = "no"
  end,
  group = _ft,
})

vim.cmd [[
function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "tabnew " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
command! QuickFixOpenAll         call QuickFixOpenAll()
]]


-- apparently speeds up lvim boot by automatically setting clipboard, not requiring nvim to find it
-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--     ["+"] = 'win32yank.exe -i --crlf',
--     ["*"] = 'win32yank.exe -i --crlf',
--   },
--   paste = {
--     ["+"] = 'win32yank.exe -o --lf',
--     ["*"] = 'win32yank.exe -o --lf',
--   },
--   cache_enabled = 0,
-- }

-- disable clangd multiple offset warning
local cmp_nvim_lsp = require "cmp_nvim_lsp"
require("lspconfig").clangd.setup {
  -- on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

-- HACK: for icon duplicating/shifting text in statuscolumn (lsp)
-- vim.diagnostic.config({ virtual_text = true, signs = true })
--
--
---- From vim defaults.vim
-- ---
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler
-- (happens when dropping a file on gvim) and for a commit message (it's
-- likely a different one than last time).
-- vim.api.nvim_create_autocmd('BufReadPost', {
--   group = vim.g.user.event,
--   callback = function(args)
--     local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
--     local not_commit = vim.b[args.buf].filetype ~= 'commit'

--     if valid_line and not_commit then
--       vim.cmd([[normal! g`"]])
--     end
--   end,
-- })
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
