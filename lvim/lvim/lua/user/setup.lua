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
  -- NOTE: modify ~/.local/share/lunarvim/site/pack/lazy/opt/ChatGPT.nvim/lua/chatgpt/api.lua + 98 and hardcode API KEY
  chat = {
    keymaps = {
      close = { "<C-c>", "<C-q>" }
    }
  }
})
require 'nvim-web-devicons'.setup {}
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
require('hop').setup()
require('neoscroll').setup {}
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
require('wlsample.airline')
require 'window-picker'.setup({})
require("auto-session").setup({})
require('code_runner').setup { mode = 'toggleterm', filetype_path = vim.fn.expand('~/.config/lvim/code_runner.json'), project_path =
    vim.fn.expand('~/.config/lvim/projects.json'), }
require "octo".setup()
require("various-textobjs").setup {}
require 'git-conflict'.setup {}
require('neoclip').setup {}
