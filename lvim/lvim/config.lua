-- vim options
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '81'
vim.opt.scrolloff = 1
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'

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
-- lvim.builtin.bufferline.options.mode = "tabs"
-- lvim.builtin.bufferline.active = false
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","


-- NORMAL Mode Keybindings
vim.keymap.set("n", "S", "/<Space><BS>")
-- lvim.keys.normal_mode["S"] = "/<Space><BS>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["qS"] = ":noh<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<leader><Tab>"] = "<Cmd>:tabn<cr>"
lvim.keys.normal_mode["<leader><S-Tab>"] = "<Cmd>:tabp<cr>"
lvim.keys.normal_mode["<Tab>"] = "<Cmd>:BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = "<Cmd>:BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["q>>"] = "<Cmd>:BufferLineMoveNext<cr>"
lvim.keys.normal_mode["q<<"] = "<Cmd>:BufferLineMovePrev<cr>"
lvim.keys.normal_mode["-"] = ":split<cr>"
lvim.keys.normal_mode["<C-F2>"] = ":vsplit<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["<C-j>"] = "<C-e>"
lvim.keys.normal_mode["<C-k>"] = "<C-y>"
lvim.keys.normal_mode["s"] = ":HopChar1<cr>"
lvim.keys.normal_mode["qs"] = ":HopChar1MW<cr>"
lvim.keys.normal_mode["<leader>u"] = "<Cmd>:UndotreeToggle<cr>:UndotreeFocus<cr>"
lvim.keys.normal_mode["<C-h>"] = "<Cmd>:SymbolsOutline<cr>"
lvim.keys.normal_mode["<leader><leader>f"] =
"<Cmd>::Telescope find_files find_command=rg,--ignore,--max-depth=4,--files prompt_prefix=🔍<cr>"
-- Moving around windows (splits)
lvim.keys.normal_mode["<C-l>"] = "<C-w>p"
lvim.keys.normal_mode["<C-b>"] = "<Cmd>:NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-m>"] = "<C-w>|<C-w>_"
lvim.keys.normal_mode["<C-n>"] = "<C-w>="
lvim.keys.normal_mode["<S-l>"] = "<Cmd>:FocusSplitCycle<CR>"
lvim.keys.normal_mode["<S-h>"] = "<Cmd>:FocusSplitCycle reverse<CR>"
lvim.keys.normal_mode["<leader>j"] = "<Cmd>:BufferLinePick<cr>"
lvim.keys.normal_mode["<leader>lx"] = "<Cmd>:LspStop<cr>"
lvim.keys.normal_mode["<leader>lX"] = "<Cmd>:LspStart<cr>"


-- INSERT Mode Keybindings
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-l>"] = "<right>"
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>"

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
vim.keymap.set({ "i" }, "<M-c>", "/**/<left><left>  <left>", { remap = true })

-- Move lines up and down
vim.keymap.set("n", "K", "$<left> :m .-2<CR>==", { silent = true })
vim.keymap.set("n", "J", "$<left> :m .+1<CR>==", { silent = true })

vim.keymap.set({ "x", "v" }, "J", " :m '>+<CR>gv=gv<left>")
vim.keymap.set({ "x", "v" }, "K", " :m '<-2<CR>gv=gv<left>")

-- Change theme settings
lvim.colorscheme = "kanagawa"

lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
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
  { "ray-x/guihua.lua" },
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
  { "nvim-neo-tree/neo-tree.nvim" },
  { "beauwilliams/focus.nvim" },
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
  dimInactive = true,
})


-- place this in one of your configuration file(s)
require('hop').setup()
require('neoscroll').setup()
require('nvim-surround').setup()
require('tidy').setup()
require("symbols-outline").setup({
  width = 30,
  wrap = true,
  keymaps = {
    fold = { "h", "<BS>" },
    unfold = { "l", "<Space>" }
  }
})
require('nvim-highlight-colors').setup()
require('treesitter-context').setup()
require('focus').setup()
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  },
  hint_enable = true,
  floating_window = false,
  toggle_key = "<C-k>",
  zindex = 9999999,
  transparency = 50
})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

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

local _ft = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Outline",
  callback = function()
    vim.wo.signcolumn = "no"
  end,
  group = _ft,
})

-- load folds (works weird with unnamed buffers)
-- vim.cmd [[
--   augroup remember_folds
--   autocmd!
--   autocmd BufWinLeave * mkview
--   autocmd BufWinEnter * silent! loadview
--   augroup END
-- ]]

vim.cmd [[
function!   QuickFixOpenAll()
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

require('user.telescoping')

-- require('lspconfig').ruff_lsp.setup {}

local null_ls = require("null-ls")
local sources = { null_ls.builtins.formatting.black, }
-- null_ls.builtins.diagnostics.ruff
-- source will run on LSP formatting request
null_ls.setup({ sources = sources })

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.keymap.set('n', '<C-Space>', vim.diagnostic.open_float, { noremap = true, silent = true })
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
