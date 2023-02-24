local action_state = require("telescope.actions.state")
local actions = require('telescope.actions')
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selected_entry = action_state.get_selected_entry()
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)
  vim.cmd("cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end

function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "split")
end

function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

-- local actions = require("lvim.utils.modules").require_on_exported_call "telescope.actions"
local actions = require('telescope.actions')


lvim.builtin.telescope = {
  ---@usage disable telescope completely [not recommended]
  active = true,
  on_config_done = nil,
  theme = "dropdown", ---@type telescope_themes
  defaults = {
    prompt_prefix = lvim.icons.ui.Telescope .. " ",
    selection_caret = lvim.icons.ui.Forward .. " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = nil,
    layout_strategy = nil,
    layout_config = {},
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
    mappings = {
      i = {
        ["<Space>"] = actions.select_default,
        ["<ESC>"] = actions.close,
        ["<C-q>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<CR>"] = telescope_custom_actions.multi_selection_open,
        ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
        ["<C-s>"] = telescope_custom_actions.multi_selection_open_split,
        ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
      },
      n = {
        ["<ESC>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,
        ["<CR>"] = telescope_custom_actions.multi_selection_open,
        ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
        ["<C-s>"] = telescope_custom_actions.multi_selection_open_split,
        ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
      },
      -- n = {
      --   ["<C-j>"] = actions.move_selection_next,
      --   ["<C-k>"] = actions.move_selection_previous,
      --   ["<C-q>"] = function(...)
      --     actions.smart_send_to_qflist(...)
      --     actions.open_qflist(...)
      --   end,
      --   ["<esc>"] = actions.close,
      --   -- ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
      --   -- ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      --   ["<cr>"] = custom_actions.fzf_multi_select
      -- },
    },
    file_ignore_patterns = {},
    path_display = { "smart" },
    winblend = 0,
    border = {},
    borderchars = nil,
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    },
    grep_string = {
      only_sort_text = true,
    },
    buffers = {
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    colorscheme = {
      enable_preview = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}
