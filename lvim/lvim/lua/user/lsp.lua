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
