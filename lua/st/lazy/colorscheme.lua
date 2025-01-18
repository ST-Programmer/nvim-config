return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme nordic")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                disable_italics = true, -- Disable italics
            })
            -- vim.cmd('colorscheme rose-pine')
        end,
    },
    {
        "morhetz/gruvbox",
        name = "gruvbox",
        lazy = false,
        priority = 1000,
    },
    {
        "sainnhe/gruvbox-material",
        name = "gruvbox-material",
        lazy = false,
        priority = 1000,
    }
}
