-- Copilot Chat

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },            -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },         -- for curl, log wrapper
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    },
    opts = {
    },
  },
}
