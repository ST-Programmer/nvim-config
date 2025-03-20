return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            local rose_pine = require("rose-pine")
            rose_pine.setup {
                styles = { italic = false }
            }
        end
    },
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000
    }
}
