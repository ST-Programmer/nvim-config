require("st")

vim.cmd("highlight Comment cterm=NONE gui=NONE")
vim.cmd("TSDisable highlight")
vim.cmd("syntax on")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi WinBar guibg=NONE ctermbg=NONE")

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",                                    -- This applies to all buffers
    callback = function()
        vim.cmd("so ~/.config/nvim/lua/st/remap.lua") -- Run the :so command on startup
    end,
})
