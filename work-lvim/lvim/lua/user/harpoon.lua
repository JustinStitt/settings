require("harpoon").setup({
  projects = {
    ["$HOME/repos/nc-poker"] = {
      tmux = {
        cmds = {
          "python -m nc-poker",
          "python -m client"
        }
      }
    }
  }
})

require("telescope").load_extension('harpoon')
