-- Add debugger support

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    "nvim-neotest/nvim-nio",
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup({})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', dap.continue, {})
    vim.keymap.set('n', '<F10>', dap.step_over, {})
    vim.keymap.set('n', '<F11>', dap.step_into, {})
    vim.keymap.set('n', '<F12>', dap.step_out, {})
    vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>db', dap.set_breakpoint, {})

    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { '/Users/kenandries/vscode-php-debug/out/phpDebug.js' }
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
      }
    }
  end,
}
