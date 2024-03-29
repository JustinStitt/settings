-- NORMAL Mode Keybindings
vim.keymap.set("n", "S", "/<Space><BS>")
vim.keymap.set("n", "g!", ":.!<Space><BS>")
vim.keymap.set("n", ",S", ":%s/\\v")
vim.keymap.set("n", "q]]", "F{a<CR><Esc>$i<CR><up><CR><up><Tab>")
-- vim.keymap.set({ "n" }, "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
--   { desc = "Get References under cursor" })
vim.keymap.set({ "n" }, "gr", require('telescope.builtin').lsp_references)
vim.keymap.set({ "n" }, "gd", require('telescope.builtin').lsp_definitions)
vim.keymap.set({ "n" }, "gI", require('telescope.builtin').lsp_implementations)
vim.keymap.set({ "n" }, ",r", require('telescope.builtin').resume)
lvim.keys.normal_mode["cI"] = "^ciw"
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
vim.keymap.set({ "n" }, ",R", "<cmd>lua require('memento').toggle()<CR>")
vim.keymap.set({ "o", "x" }, "aW", '<cmd>lua require("various-textobjs").subword(false)<CR>')
vim.keymap.set({ "o", "x" }, "iW", '<cmd>lua require("various-textobjs").subword(true)<CR>')
vim.keymap.set('n', '<C-Space>', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "x" }, "<C-b>", "<Cmd>:NvimTreeToggle<cr>")
vim.keymap.set({ "n" }, "<C-_>", "gcc", { remap = true })
vim.keymap.set({ "n" }, "<C-p>", "<C-i>", { noremap = true })
vim.keymap.set({ "i" }, "<C-_>", "<Esc>,/A", { remap = true })
vim.keymap.set({ "v" }, "<C-_>", "gcc", { remap = true })
vim.keymap.set({ "i" }, "<M-c>", "/**/<left><left>  <left>", { remap = true })
vim.keymap.set({ "n" }, ",lz",
  "<cmd>lua EnterLinuxMode()<cr>",
  { desc = "Enable Kernel-Dev Mode" })
-- <cmd>:hi TAB guibg=yellow ctermbg=yellow<cr>
-- Move lines up and down
vim.keymap.set("n", "K", "$<left> :m .-2<CR>==", { silent = true })
vim.keymap.set("n", "J", "$<left> :m .+1<CR>==", { silent = true })
vim.keymap.set("n", "P", "\"0p", { silent = true })

vim.keymap.set({ "x", "v" }, "J", " :m '>+<cr>gv=gv<left>")
vim.keymap.set({ "x", "v" }, "K", " :m '<-2<CR>gv=gv<left>")
vim.keymap.set({ "n" }, "zF", "zMzOzz", { noremap = true })
vim.keymap.set('v', '/', '<esc>/\\%V') -- search within selection
vim.keymap.set({ "n" }, ",mk", "oCc: Kees Cook <keescook@chromium.org>")
vim.keymap.set({ "n" }, ",mn", "oCc: Nick Desaulniers <ndesaulniers@google.com>")
vim.keymap.set({ "n" }, ",mj", "oReviewed-by: Justin Stitt <justinstitt@google.com>")
vim.keymap.set({ "n" }, ",mN", "oCc: Nathan Chancellor <nathan@kernel.org>")
vim.keymap.set({ "n" }, ",mN", "oCc: Nathan Chancellor <nathan@kernel.org>")
-- lvim.keys.normal_mode["S"] = "/<Space><BS>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["qS"] = ":noh<cr><Cmd>:SnipClose<CR>"
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
lvim.keys.normal_mode["<leader>lT"] = "<Cmd>:Trouble<CR>"
lvim.keys.normal_mode["-"] = ":split<cr>"
lvim.keys.normal_mode["<C-F2>"] = ":vsplit<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["<C-j>"] = "<C-e>"
lvim.keys.normal_mode["<C-k>"] = "<C-y>"
lvim.keys.normal_mode["s"] = ":HopChar1<cr>"
lvim.keys.normal_mode["qs"] = ":HopChar1MW<cr>"
lvim.keys.normal_mode["<leader>u"] = "<Cmd>:UndotreeToggle<cr>:UndotreeFocus<cr>"
lvim.keys.normal_mode["<leader><leader>c"] = "<Cmd>:Copilot panel<cr>"
lvim.keys.normal_mode["<C-h>"] = "<Cmd>:SymbolsOutline<cr>"
lvim.keys.normal_mode["<leader><leader>f"] =
"<Cmd>::Telescope find_files find_command=rg,--ignore,--max-depth=4,--files prompt_prefix=🔍<cr>"
lvim.keys.normal_mode["<leader>P"] = ":lua require('neoclip.fzf')('*')<cr>"
-- Moving around windows (splits)
lvim.keys.normal_mode["<C-l>"] = "<C-w>p"
lvim.keys.normal_mode["<C-b>"] = "<Cmd>:NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-m>"] = "<cmd>:WindowsMaximize<cr>"
lvim.keys.normal_mode["<C-n>"] = "<cmd>:WindowsEqualize<cr>"
lvim.keys.normal_mode["<S-l>"] = "<Cmd>:FocusSplitCycle<CR>"
lvim.keys.normal_mode["<S-h>"] = "<Cmd>:FocusSplitCycle reverse<CR>"
lvim.keys.normal_mode["<leader>j"] = "<Cmd>:BufferLinePick<cr>"
lvim.keys.normal_mode["<leader>lx"] = "<Cmd>:LspStop<cr>"
lvim.keys.normal_mode["<leader>lX"] = "<Cmd>:LspStart<cr>"
lvim.keys.normal_mode["<leader>lF"] = "<Cmd>:LspRestart<cr>"
lvim.keys.normal_mode["<leader>gB"] = "<Cmd>:Git blame<cr>"
lvim.keys.normal_mode["<leader>gi"] = "<Cmd>:Git commit -s -m 's'<cr>"
lvim.keys.normal_mode["<leader>w"] = "<cmd>lua require('nvim-window').pick()<cr>"
lvim.keys.normal_mode["<leader><leader>r"] = "<Cmd>:RunCode<cr>"
lvim.keys.normal_mode["<leader>A"] = "<Cmd>:lua require('harpoon.mark').add_file()<CR>"
-- lvim.keys.normal_mode["<leader>H"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<leader>H"] = "<Cmd>:Telescope harpoon marks<CR>"


lvim.keys.visual_mode["<leader><leader>r"] = ":SnipRun<cr>"

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
lvim.keys.visual_mode['<leader>w'] = "<Cmd>::lua require('wrapping-paper').wrap_line()<cr>"

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

-- gitconflict default mappings
-- co — choose ours
-- ct — choose theirs
-- cb — choose both
-- c0 — choose none
-- ]x — move to previous conflict
-- [x — move to next conflict
--
-- janky
vim.cmd [[
  nnoremap * #
  nnoremap # *
]]

vim.api.nvim_set_keymap(
  "v",
  ",n",
  ":<c-u>HSHighlight 1<CR>",
  {
    noremap = true,
    silent = true
  }
)

vim.api.nvim_set_keymap(
  "v",
  ",N",
  ":<c-u>HSRmHighlight<CR>",
  {
    noremap = true,
    silent = true
  }
)

-- vim.api.nvim_set_keymap(
--   "v", ",w", ":lua require('wrapping-paper').wrap_line()<CR>"
-- )
