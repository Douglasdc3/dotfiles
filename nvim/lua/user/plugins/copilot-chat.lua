-- Copilot Chat

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      -- window = {
      --   layout = 'float',
      --   relative = 'cursor',
      --   width = 1,
      --   height = 0.4,
      --   row = 1
      -- },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
