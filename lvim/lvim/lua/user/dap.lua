local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
  command = '/usr/bin/lldb-vscode-15', -- can install lldb-vscode-14 with https://github.com/xbc5/DAPInstall.nvim#configuration
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

dap.configurations.c = {
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

-- run this as per: https://github.com/mfussenegger/nvim-dap/issues/210
-- echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
