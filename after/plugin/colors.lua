function ColorMyPencils(color)
    color = color or "nordic"
    vim.cmd("colorscheme " .. color)

    -- Set gruvbox contrast options
    vim.g.gruvbox_contrast_dark = 'medium'
    vim.g.gruvbox_contrast_light = 'soft'

    -- Set background transparency for Normal and NormalFloat

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Gruvbox default dark
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
