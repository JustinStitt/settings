local null_ls = require("null-ls")
local sources = { null_ls.builtins.formatting.black, --[[ null_ls.builtins.diagnostics.ruff ]] }
-- null_ls.builtins.diagnostics.ruff
-- source will run on LSP formatting request
null_ls.setup({
  sources = sources,
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.nim = {
  install_info = {
    url = "~/repos/tree-sitter-nim",              -- local path or git repo
    files = { "src/parser.c", "src/scanner.cc" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main",                              -- default branch in case of git repo if different from master
    generate_requires_npm = false,                -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false,       -- if folder contains pre-generated src/parser.c
  },
  filetype = "nim",                               -- if filetype does not match the parser name
}


-- add `pyright` to `skipped_servers` list
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "lifeline" })
--
vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])
require('lspconfig').vls.setup {}
-- require('lvim.lsp.manager').setup("vls")
-- require('lspconfig')['vls'].setup {
--   cmd = { "v", "ls" },
--   filetypes = { "vlang", "v" },
-- }

-- -- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "pylama", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
}

-- require('lspconfig').pyre.setup {}
-- require('lspconfig').ruff_lsp.setup {}
-- local util = require("lspconfig/util")
-- require("lspconfig.configs").pylyzer = {
--   default_config = {
--     name = "pylyzer",
--     cmd = { "pylyzer", "--server" },
--     filetypes = { "python" },
--     root_dir = function(fname)
--       local root_files = {
--         "pyproject.toml",
--         "setup.py",
--         "setup.cfg",
--         "requirements.txt",
--         "Pipfile",
--       }
--       return util.root_pattern(unpack(root_files))(fname)
--           or util.find_git_ancestor(fname)
--           or util.path.dirname(fname)
--     end,
--   },
-- }
--
-- vim.cmd [[ source /usr/local/google/home/justinstitt/playground/learning-to-build/llvm-project/llvm/utils/vim/syntax/llvm.vim ]]
-- vim.cmd [[
--   augroup testing_llvmir
--   autocmd!
--     autocmd BufReadPost *.ll set filetype=llvm
--   augroup END
-- ]]
