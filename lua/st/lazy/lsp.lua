return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "habamax/vim-godot", -- Plugin for GDScript syntax support
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local ls = require('luasnip')

        -- Set up capabilities for the LSP clients
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Function to set keybindings when LSP attaches
        local on_attach = function(client, bufnr)
            -- Enable LSP keymaps here
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- Jump to definition mapping
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, opts)
        end

        -- Fidget and Mason setup
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright",
            },
            handlers = {
                -- Default handler for LSP servers
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach, -- Attach the keymaps when the server attaches
                    }
                end,

                -- Custom setup for Lua Language Server
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                -- Custom setup for Clangd
                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        cmd = { "clangd", "--background-index", "--clang-tidy", "--fallback-style=webkit" }, -- Optional flags
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                        root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt",
                            ".clangd"),
                        settings = {
                            clangd = {
                                completion = {
                                    enableSnippets = true
                                },
                                diagnostics = {
                                    enable = true,
                                    underline = true,
                                }
                            }
                        }
                    })
                end,
            }
        })

        -- CMP configuration
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For luasnip users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- This remains as it is for the previous item
                ['<A-k>'] = cmp.mapping.select_prev_item(cmp_select), -- Map 'k' to move up in the suggestions
                ['<A-j>'] = cmp.mapping.select_next_item(cmp_select), -- Map 'j' to move down in the suggestions
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),   -- Confirm completion
                ["<C-Space>"] = cmp.mapping.complete(),               -- Trigger completion with Ctrl-Space
                ['<CR>'] = function(fallback)
                    if require('luasnip').expand_or_jumpable() then
                        require('luasnip').expand_or_jump() -- Expand or jump if possible
                    else
                        -- Accept completion (fallback to Copilot if necessary)
                        cmp.mapping.confirm({ select = true })(fallback)
                    end
                end,
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- Diagnostic configuration
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
