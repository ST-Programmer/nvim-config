return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "rust",
                "python",
            },
            highlight = {
                enable = true,
                disable = {}, -- Add languages here to disable highlighting
            },
            indent = {
                enable = true,
            },
            -- You can enable additional modules if needed
        }
    end
}
