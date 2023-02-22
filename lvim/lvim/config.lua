-- vim options
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '81'

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
}
lvim.builtin.nvimtree.setup.view.mappings.list = { { key = "<Space>", action = "edit" } }
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_c = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.telescope.defaults = {
  file_ignore_patterns = { "node_modules", "conda", 'npm', '.vscode-server*', '.posh-themes', '.dbus', '.pyenv', '.vim' } }

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","

-- NORMAL Mode Keybindings
vim.keymap.set("n", "S", "/<Space><BS>")
-- lvim.keys.normal_mode["S"] = "/<Space><BS>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["qS"] = ":noh<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<Tab>"] = "<Cmd>:BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<Cmd>:BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["q<<"] = "<Cmd>:BufferLineMovePrev<cr>"
lvim.keys.normal_mode["q>>"] = "<Cmd>:BufferLineMoveNext<cr>"
lvim.keys.normal_mode["<C-F2>"] = ":vsplit<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["-"] = ":split<cr>"
lvim.keys.normal_mode["<C-j>"] = "<C-e>"
lvim.keys.normal_mode["<C-k>"] = "<C-y>"
lvim.keys.normal_mode["s"] = ":HopChar1<cr>"
lvim.keys.normal_mode["qs"] = ":HopChar1MW<cr>"
lvim.keys.normal_mode["qu"] = "<Cmd>:UndotreeToggle<cr>:UndotreeFocus<cr>"
lvim.keys.normal_mode["<C-h>"] = "<Cmd>:SymbolsOutline<cr>"
lvim.keys.normal_mode["<leader><leader>f"] =
"<Cmd>::Telescope find_files find_command=rg,--ignore,--max-depth=4,--files prompt_prefix=🔍<cr>"
-- Moving around windows (splits)
lvim.keys.normal_mode["<C-1>"] = "<C-w>h"
lvim.keys.normal_mode["<C-4>"] = "<C-w>l"
lvim.keys.normal_mode["<C-3>"] = "<C-w>k"
lvim.keys.normal_mode["<C-2>"] = "<C-w>j"
lvim.keys.normal_mode["<C-l>"] = "<C-w>p"
lvim.keys.normal_mode["<C-b>"] = "<Cmd>:NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-m>"] = "<C-w>|<C-w>_"
lvim.keys.normal_mode["<C-n>"] = "<C-w>="
lvim.keys.normal_mode["<leader>j"] = "<Cmd>:BufferLinePick<cr>"


-- INSERT Mode Keybindings
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-l>"] = "<right>"

-- VISUAL Mode Keybindings
lvim.keys.visual_mode["<Space>"] = "<Esc>"

-- OTHER Mode Keybindings
lvim.keys.term_mode = { ["<C-l>"] = false }
lvim.lsp.buffer_mappings.normal_mode['gk'] = lvim.lsp.buffer_mappings.normal_mode['K']
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
vim.keymap.set({ "n", "i", "v", "x" }, "<C-b>", "<Cmd>:NvimTreeToggle<cr>")
vim.keymap.set({ "n" }, "<C-_>", "gcc", { remap = true })
vim.keymap.set({ "i" }, "<C-_>", "<Esc>,/A", { remap = true })
vim.keymap.set({ "v" }, "<C-_>", "gcc", { remap = true })

-- Move lines up and down
vim.keymap.set("n", "J", " :m .+1<CR>==<left>", { silent = true })
vim.keymap.set("n", "K", " :m .-2<CR>==<left>", { silent = true })
vim.keymap.set({ "x", "v" }, "J", " :m '>+<CR>gv=gv<left>")
vim.keymap.set({ "x", "v" }, "K", " :m '<-2<CR>gv=gv<left>")

-- Change theme settings
lvim.colorscheme = "kanagawa"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.which_key.mappings['q'] = {}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "lunarvim/colorschemes" },
  { "rebelot/kanagawa.nvim" },
  { "karb94/neoscroll.nvim" },
  { "phaazon/hop.nvim" },
  { "kylechui/nvim-surround" },
  { "mbbill/undotree" },
  { "jesseduffield/lazygit" },
  { "simrat39/symbols-outline.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "tyru/capture.vim" },
  { "brenoprata10/nvim-highlight-colors" },
  -- { "sunjon/Shade.nvim" },
  { "airblade/vim-matchquote" },
  -- { "johnfrankmorgan/whitespace.nvim" },
  { "folke/noice.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "mcauley-penney/tidy.nvim" },
  { "nvim-treesitter/nvim-treesitter-context" },
}

-- Kanagawa theme settings
require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = false },
  specialReturn = false, -- special highlight for the return keyword
})


-- place this in one of your configuration file(s)
require('hop').setup()
require('neoscroll').setup()
require('nvim-surround').setup()
require('tidy').setup()
require('noice').setup({
  lsp = {
    hover = {
      { enabled = false }
    },
    signature = {
      { enabled = false }
    }
  },
  messages = {
    view_error = "messages"
  },
})
-- require('shade').setup({
--   overlay_opacity = 70,
--   opacity_step = 5,
-- })
require("symbols-outline").setup()
require('nvim-highlight-colors').setup()
require('treesitter-context').setup()
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  hint_enable = false,
  toggle_key = "<C-k>",
  zindex = 9999999
})
-- require('whitespace-nvim').setup({
--   highlight = 'DiffDelete',
--   ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', '[Scratch]' },
-- })

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
  command = '/usr/bin/lldb-vscode-15',
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  },
}


vim.api.nvim_command [[
  autocmd ColorScheme * highlight NormalFloat guibg=#1f1f28
]]

vim.api.nvim_command [[ autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f1f28 ]]

vim.api.nvim_command [[
  autocmd ColorScheme * highlight TreesitterContext guibg=#2a2a37
]]
