require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "cpp",
    "rust",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline"
  },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

