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
