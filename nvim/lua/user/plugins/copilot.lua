-- GitHub Copilot

return {
  "zbirenbaum/copilot.lua",
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function ()
    require('copilot').setup({

      -- suggestion = { enabled = false },

      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-k>",
          next = "<C-L>",
          prev = "<C-H>",
        },
      },
      filetypes = {
        sh = function ()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
            -- disable for .env files
            return false
          end
          return true
        end,
      },
    })
  end
}

