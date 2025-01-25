require("st")

-- Automatically source remap.lua on Neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",                                    -- This applies to all buffers
    callback = function()
        vim.cmd("so ~/.config/nvim/lua/st/remap.lua") -- Run the :so command on startup
    end,
})
