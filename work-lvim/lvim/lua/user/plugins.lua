lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "lunarvim/colorschemes" },
  { "karb94/neoscroll.nvim" },
  { "phaazon/hop.nvim" },
  { "kylechui/nvim-surround" },
  -- { "rebelot/kanagawa.nvim",                   commit = "de7fb5f" },
  { "rebelot/kanagawa.nvim" },
  { "mbbill/undotree" },
  { "jesseduffield/lazygit" },
  { "simrat39/symbols-outline.nvim" },
  { "ray-x/lsp_signature.nvim" },
  { "ray-x/guihua.lua" },
  { "tyru/capture.vim" },
  -- { "brenoprata10/nvim-highlight-colors" },
  { "airblade/vim-matchquote" },
  { "folke/noice.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "mcauley-penney/tidy.nvim" },
  -- { "nvim-treesitter/nvim-treesitter-context", commit = '3a48e2d3c91218ad4b198bb48e813e6573230f0b' },
  { "beauwilliams/focus.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "folke/todo-comments.nvim" },
  { "Yilin-Yang/vim-markbar" },
  { "chentoast/marks.nvim" },
  -- { "junegunn/vim-peekaboo" },
  { "mattn/emmet-vim" },
  { "windwp/nvim-ts-autotag" },
  { "leafOfTree/vim-svelte-plugin" },
  { "adelarsq/vim-matchit" },
  -- { "ap/vim-css-color" },
  { "iamcco/markdown-preview.nvim",      build = function() vim.fn["mkdp#util#install"]() end },
  { "smzm/hydrovim" },
  { "jcorbin/vim-lobster" },
  { "tpope/vim-fugitive" },
  { "alaviss/nim.nvim" },

  { "zbirenbaum/copilot.lua" },
  -- { "ojroques/nvim-hardline" },
  -- { "nvim-neo-tree/neo-tree.nvim" },
  { "windwp/windline.nvim" },
  { "s1n7ax/nvim-window-picker" },
  -- { "rmagatti/auto-session" },
  { "michaelb/sniprun",                  build = "bash ./install.sh" },
  { "CRAG666/code_runner.nvim" },
  { "pwntester/octo.nvim" },
  { "chrisgrieser/nvim-spider",          lazy = true },
  { "chrisgrieser/nvim-various-textobjs" },
  { "xiyaowong/virtcolumn.nvim" },
  {
    "willothy/flatten.nvim",
    opts = {
      window = {
        open = "alternate"
      }
    },
    lazy = false,
    priority = 1001,
  },
  { "akinsho/git-conflict.nvim" },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { 'ibhagwan/fzf-lua' },
    config = function()
      require('neoclip').setup()
    end,
  },
  { "Rawnly/gist.nvim" },
  { "jackMort/ChatGPT.nvim" },
  { "ThePrimeagen/harpoon" },
  { "simrat39/rust-tools.nvim" },
  { "ravenxrz/DAPInstall.nvim" },
  { "petertriho/nvim-scrollbar" },
  { "kevinhwang91/nvim-hlslens" },
  -- { "gbprod/cutlass.nvim" },
  { "pocco81/high-str.nvim" },
  { "jabirali/vim-tmux-yank" },
  { "hiphish/rainbow-delimiters.nvim" },
  -- { "mg979/vim-visual-multi" },
  { "declancm/cinnamon.nvim" },
  { "tpope/vim-sleuth" },
  {
    "carbon-steel/detour.nvim",
    config = function()
      vim.keymap.set('n', '<c-w><enter>', ":Detour<cr>")
    end
  },
  { "stevearc/oil.nvim" },
  { "kevinhwang91/nvim-ufo",        dependencies = { 'kevinhwang91/promise-async' } },
  { "benlubas/wrapping-paper.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  { "gaborvecsei/memento.nvim" },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = '\\' -- Recommended to be a single key
    }
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  },
  {
    "yorickpeterse/nvim-window",
    keys = {
      { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
    },
    config = true,
  },
  { "sindrets/winshift.nvim" },
}
