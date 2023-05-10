-- vim options
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '81'
vim.opt.scrolloff = 1
vim.opt.foldlevel = 99
-- vim.opt.foldmethod = 'indent'
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"


lvim.format_on_save = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
}

lvim.builtin.lualine.active = false
lvim.builtin.nvimtree.active = false
lvim.leader = ","



-- NORMAL Mode Keybindings
vim.keymap.set("n", "S", "/<Space><BS>")
vim.keymap.set("n", "g!", ":.!<Space><BS>")
vim.keymap.set("n", ",S", ":%s/\\v")
vim.keymap.set("n", "q]]", "F{a<CR><Esc>$i<CR><up><CR><up><Tab>")
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
lvim.keys.normal_mode["<leader>t"] = "<Cmd>:TodoTelescope<cr>"
lvim.keys.normal_mode["<leader>bR"] = "<Cmd>:SessionRestore<CR>"
lvim.keys.normal_mode["<leader>bS"] = "<Cmd>:SessionSave<CR>"
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
lvim.keys.normal_mode["<C-b>"] = "<Cmd>:NeoTreeFocusToggle<cr>"
lvim.keys.normal_mode["<C-m>"] = "<C-w>|<C-w>_"
lvim.keys.normal_mode["<C-n>"] = "<C-w>="
lvim.keys.normal_mode["<S-l>"] = "<Cmd>:FocusSplitCycle<CR>"
lvim.keys.normal_mode["<S-h>"] = "<Cmd>:FocusSplitCycle reverse<CR>"
lvim.keys.normal_mode["<leader>j"] = "<Cmd>:BufferLinePick<cr>"
lvim.keys.normal_mode["<leader>lx"] = "<Cmd>:LspStop<cr>"
lvim.keys.normal_mode["<leader>lX"] = "<Cmd>:LspStart<cr>"
lvim.keys.normal_mode["<leader>lF"] = "<Cmd>:LspRestart<cr>"
lvim.keys.normal_mode["<leader>gB"] = "<Cmd>:Git blame<cr>"
lvim.keys.normal_mode["<leader><leader>r"] = "<Cmd>:NeoRunner<cr>"


-- ChatGPT keybindings
lvim.keys.normal_mode["<leader><leader>g"] = "<Cmd>:ChatGPT<cr>"
lvim.keys.visual_mode["<leader><leader>e"] = "<Cmd>:ChatGPTEditWithInstructions<cr>"
lvim.keys.visual_mode["<leader><leader>a"] = "<Cmd>:ChatGPTRun code_readability_analysis<cr>"
lvim.keys.visual_mode["<leader><leader>s"] = "<Cmd>:ChatGPTRun summarize<cr>"
lvim.keys.visual_mode["<leader><leader>d"] = "<Cmd>:ChatGPTRun docstring<cr>"
lvim.keys.visual_mode["<leader><leader>t"] = "<Cmd>:ChatGPTRun add_tests<cr>"
lvim.keys.visual_mode["<leader><leader>x"] = "<Cmd>:ChatGPTRun explain_code<cr>"
lvim.keys.visual_mode["<leader><leader>f"] = "<Cmd>:ChatGPTRun fix_bugs<cr>"
lvim.keys.visual_mode["<leader><leader>c"] = "<Cmd>:ChatGPTRun complete_code<cr>"
lvim.keys.visual_mode["<leader><leader>o"] = "<Cmd>:ChatGPTRun optimize_code<cr>"



-- INSERT Mode Keybindings
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-l>"] = "<right>"
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>"
lvim.keys.insert_mode["<C-]>"] = "<space>"

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

-- lvim.builtin.nvimtree.setup.view.side = "left"
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
  { "karb94/neoscroll.nvim" },
  { "phaazon/hop.nvim" },
  { "kylechui/nvim-surround" },
  { "rebelot/kanagawa.nvim",                  commit = "de7fb5f" },
  { "mbbill/undotree" },
  { "jesseduffield/lazygit" },
  { "simrat39/symbols-outline.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "ray-x/guihua.lua" },
  { "tyru/capture.vim" },
  { "brenoprata10/nvim-highlight-colors" },
  { "airblade/vim-matchquote" },
  { "folke/noice.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "mcauley-penney/tidy.nvim" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "beauwilliams/focus.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "folke/todo-comments.nvim" },
  { "Yilin-Yang/vim-markbar" },
  { "chentoast/marks.nvim" },
  { "junegunn/vim-peekaboo" },
  { "mattn/emmet-vim" },
  { "windwp/nvim-ts-autotag" },
  { "leafOfTree/vim-svelte-plugin" },
  { "adelarsq/vim-matchit" },
  { "ap/vim-css-color" },
  { "iamcco/markdown-preview.nvim",           build = function() vim.fn["mkdp#util#install"]() end },
  { "smzm/hydrovim" },
  { "jcorbin/vim-lobster" },
  { "tpope/vim-fugitive" },
  { "alaviss/nim.nvim" },
  { "jackMort/ChatGPT.nvim" },
  { "zbirenbaum/copilot.lua" },
  -- { "ojroques/nvim-hardline" },
  { "nvim-neo-tree/neo-tree.nvim" },
  { "windwp/windline.nvim" },
  { "s1n7ax/nvim-window-picker" },
  { "rmagatti/auto-session" },
  { "BenGH28/neo-runner.nvim" }, -- then run :UpdateRemotePlugins
}


vim.g.mkdp_theme = "dark"

vim.g.mkdp_auto_close = 0

-- Alt-] and Alt-\ to cycle suggestions and accept them
require('copilot').setup({
  suggestion = {
    keymap = {
      accept = "<M-\\>"
    }
  },
  openai_params = {
    max_tokens = 600

  }
})

require("chatgpt").setup({
  chat = {
    keymaps = {
      close = { "<C-c>", "<C-q>" }
    }
  }
})

require 'nvim-web-devicons'.setup {}
-- Kanagawa theme settings
require('kanagawa').setup({
  compile = true,
  undercurl = false, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = false },
  specialReturn = false, -- special highlight for the return keyword
  dimInactive = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  }
})


require('todo-comments').setup()
require('marks').setup {}

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
  zindex = 1024,
  transparency = 100
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

require('user.telescoping')

-- require('lspconfig').ruff_lsp.setup {}

local null_ls = require("null-ls")
local sources = { null_ls.builtins.formatting.black, --[[ null_ls.builtins.diagnostics.ruff ]] }
-- null_ls.builtins.diagnostics.ruff
-- source will run on LSP formatting request
null_ls.setup({
  sources = sources,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.keymap.set('n', '<C-Space>', vim.diagnostic.open_float, { noremap = true, silent = true })
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--


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

-- local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- gr then <leader>le to see references of symbol under cursor
require('wlsample.airline')
require 'window-picker'.setup({})
require("auto-session").setup({})
vim.g.clipboard = {
  name = 'win32yank',
  copy = {
    ["+"] = 'win32yank.exe -i --crlf',
    ["*"] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ["+"] = 'win32yank.exe -o --lf',
    ["*"] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}

-- vim.diagnostic.config({ virtual_text = true, signs = true })

-- disable clangd multiple offset warning
local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

vim.g.runner_cpp_compiler = "clang++"
vim.g.runner_cpp_options = '-std=c++20 -Wall -g'

require("neo-tree").setup({ window = { width = 22, mappings = { ["<space>"] = "open" } } })
