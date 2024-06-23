-- Define theme

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opt = {
        flavour = "mocha",
    },
    config = function ()
        vim.cmd.colorscheme "catppuccin"
    end
}
