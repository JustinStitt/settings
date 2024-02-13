require('copilot').setup({
	suggestion = {
		keymap = {
			accept = "<M-\\>"
		}
	},
})

require("chatgpt").setup({
	-- note get this script
	-- it's contents are simply
	-- head -n 1 /usr/local/google/home/justinstitt/.env | sed 's/OPENAI_API_KEY=//'
	-- so be sure to have .env with line 1 with OPENAI_API_KEY=...
	--
	-- also change actions.json to default model of gpt-4-1106-preview
	-- it is located /usr/local/google/home/justinstitt/.local/share/lunarvim/site/pack/lazy/opt/ChatGPT.nvim
	api_key_cmd = "/usr/local/google/home/justinstitt/get_openai_key",
	chat = {
		keymaps = {
			close = { "<C-c>", "<C-q>" }
		}
	},

	openai_params = {
		model = "gpt-4-1106-preview",
		max_tokens = 3000
	}
})

require 'nvim-web-devicons'.setup {}
require('kanagawa').setup({
	compile = false,
	undercurl = true, -- enable undercurls
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
require('neoscroll').setup {
	easing_function = "sine",
	-- performance_mode = true,
}
local t = {}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '120', [['sine']] } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '120', [['sine']] } }
require('neoscroll.config').set_mappings(t)

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
-- require('nvim-highlight-colors').setup()
-- require('treesitter-context').setup({
-- 	max_lines = 10,
-- })
require('focus').setup({
	autoresize = {
		enable = false,
		height_quickfix = 2,
	}
})
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
-- require('wlsample.airline')
require 'window-picker'.setup({})
-- require("auto-session").setup({})
require('code_runner').setup { mode = 'toggleterm', filetype_path = vim.fn.expand('~/.config/lvim/code_runner.json'), project_path =
    vim.fn.expand('~/.config/lvim/projects.json'), }
require "octo".setup({
	default_to_projects_v2 = false,
	suppress_missing_scope = {
		projects_v2 = true,
	}
})
require("various-textobjs").setup {}
require 'git-conflict'.setup {}
require('neoclip').setup {}

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<Leader><C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

-- require("karen-yank").setup()
require("scrollbar").setup()

-- require("cutlass").setup({
--   cut_key = "d",
--   override_del = nil,
--   exclude = {},
--   registers = {
--     select = "s",
--     delete = "d",
--     change = "c",
--   },
-- })

require("scrollbar.handlers.gitsigns").setup()
require("high-str").setup()
require("oil").setup()
require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end
})

require("wrapping-paper").setup({
	width = 80
})

require("winshift").setup({
	highlight_moving_win = true, -- Highlight the window being moved
	focused_hl_group = "Visual", -- The highlight group used for the moving window
	moving_win_options = {
		wrap = false,
		cursorline = false,
		cursorcolumn = false,
		colorcolumn = "",
	},
	keymaps = {
		disable_defaults = false, -- Disable the default keymaps
		win_move_mode = {
			["h"] = "left",
			["j"] = "down",
			["k"] = "up",
			["l"] = "right",
			["H"] = "far_left",
			["J"] = "far_down",
			["K"] = "far_up",
			["L"] = "far_right",
			["<left>"] = "left",
			["<down>"] = "down",
			["<up>"] = "up",
			["<right>"] = "right",
			["<S-left>"] = "far_left",
			["<S-down>"] = "far_down",
			["<S-up>"] = "far_up",
			["<S-right>"] = "far_right",
		},
	},
	window_picker = function()
		return require("winshift.lib").pick_window({
			-- A string of chars used as identifiers by the window picker.
			picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
			filter_rules = {
				-- This table allows you to indicate to the window picker that a window
				-- should be ignored if its buffer matches any of the following criteria.
				cur_win = true, -- Filter out the current window
				floats = true, -- Filter out floating windows
				filetype = {}, -- List of ignored file types
				buftype = {}, -- List of ignored buftypes
				bufname = {}, -- List of vim regex patterns matching ignored buffer names
			},
			filter_func = nil,
		})
	end,
})
