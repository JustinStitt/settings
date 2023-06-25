-- vim options
vim.opt.relativenumber                              = false
vim.opt.tabstop                                     = 2
vim.opt.shiftwidth                                  = 2
vim.opt.colorcolumn                                 = '81'
vim.opt.scrolloff                                   = 1
vim.opt.foldlevel                                   = 99
vim.wo.foldmethod                                   = "expr"
vim.wo.foldexpr                                     = "nvim_treesitter#foldexpr()"
vim.o.updatetime                                    = 250
vim.g.mkdp_theme                                    = "dark"
vim.g.mkdp_auto_close                               = 0

-- lvim options
lvim.leader                                         = ","

lvim.format_on_save                                 = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
}

-- disable built-in LVIM statusline
-- lvim.builtin.lualine.active                         = false

-- Change theme settings
lvim.colorscheme                                    = "kanagawa"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.alpha.active                           = true
lvim.builtin.alpha.mode                             = "dashboard"
lvim.builtin.terminal.active                        = true
lvim.builtin.treesitter.auto_install                = true
lvim.builtin.which_key.mappings['q']                = {}

-- neoscroll speed adjustments
local t                                             = {}
t['<C-u>']                                          = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
t['<C-d>']                                          = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
require('neoscroll.config').set_mappings(t)

vim.g.leetcode_browser = 'firefox'
