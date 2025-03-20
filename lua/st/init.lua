require("st.remap")
require("st.set")
require("st.lazy_init")

vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = "*.asm",
    callback = function()
        vim.g.asmsyntax = "fasm"
    end,
})
