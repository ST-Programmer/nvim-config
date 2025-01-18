return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/overseer.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
        local osys = require("cmake-tools.osys")
        require("cmake-tools").setup {
            -- CMake Configuration
            cmake_command = "cmake",                                    -- Path to cmake executable
            ctest_command = "ctest",                                    -- Path to ctest executable
            cmake_use_preset = true,                                    -- Use presets for cmake
            cmake_regenerate_on_save = true,                            -- Regenerate when saving CMakeLists.txt
            cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Options for CMake generate
            cmake_build_options = {},                                   -- Options for CMake build
            cmake_build_directory = function()
                -- Generate build directory path based on the OS
                if osys.iswin32 then
                    return "out\\${variant:buildType}"
                end
                return "out/${variant:buildType}"
            end,

            -- CMake compilation and soft link options
            cmake_soft_link_compile_commands = true, -- Link compile_commands.json to root dir
            cmake_compile_commands_from_lsp = false, -- Get compile commands from LSP
            cmake_kits_path = nil,               -- Optional path for global cmake kits
            cmake_variants_message = {
                short = { show = true },         -- Show short variant message
                long = { show = true, max_length = 40 }, -- Show long variant message with a length limit
            },

            -- CMake Debugger (DAP) settings
            cmake_dap_configuration = {
                name = "cpp",
                type = "codelldb",
                request = "launch",
                stopOnEntry = false,
                runInTerminal = true,
                console = "integratedTerminal",
            },

            -- CMake Executor Settings
            cmake_executor = {
                name = "quickfix", -- Executor type
                opts = {}, -- Executor options
                default_opts = {
                    quickfix = {
                        show = "always", -- Show quickfix window
                        position = "belowright", -- Quickfix window position
                        size = 10,
                        encoding = "utf-8",
                        auto_close_when_success = true, -- Auto close on success
                    },
                    toggleterm = {
                        direction = "float", -- Terminal direction
                        close_on_exit = false, -- Do not close on exit
                        auto_scroll = true, -- Auto scroll to bottom
                        singleton = true, -- Single terminal instance
                    },
                    overseer = {
                        new_task_opts = {
                            strategy = {
                                "toggleterm",
                                direction = "horizontal",
                                autos_croll = true,
                                quit_on_exit = "success"
                            }
                        },
                        on_new_task = function(task)
                            require("overseer").open({ enter = false, direction = "right" })
                        end,
                    },
                    terminal = {
                        name = "Main Terminal",
                        prefix_name = "[CMakeTools]: ", -- Unique prefix for terminals
                        split_direction = "horizontal", -- Split direction for terminal
                        split_size = 11,
                        single_terminal_per_instance = true, -- Single terminal per instance
                        single_terminal_per_tab = true, -- Single terminal per tab
                        keep_terminal_static_location = true, -- Static location for terminal
                        auto_resize = true,       -- Auto resize terminal
                        start_insert = false,     -- Start in insert mode
                        focus = false,            -- Focus on terminal
                        do_not_add_newline = false, -- Prevent auto newline
                    },
                },
            },

            -- CMake Runner Settings
            cmake_runner = {
                name = "terminal", -- Runner type
                opts = {},
                default_opts = {
                    quickfix = {
                        show = "always",
                        position = "belowright",
                        size = 10,
                        encoding = "utf-8",
                        auto_close_when_success = true,
                    },
                    toggleterm = {
                        direction = "float",
                        close_on_exit = false,
                        auto_scroll = true,
                        singleton = true,
                    },
                    overseer = {
                        new_task_opts = {
                            strategy = {
                                "toggleterm",
                                direction = "horizontal",
                                autos_croll = true,
                                quit_on_exit = "success"
                            }
                        },
                        on_new_task = function(task)
                        end,
                    },
                    terminal = {
                        name = "Main Terminal",
                        prefix_name = "[CMakeTools]: ",
                        split_direction = "horizontal",
                        split_size = 11,
                        single_terminal_per_instance = true,
                        single_terminal_per_tab = true,
                        keep_terminal_static_location = true,
                        auto_resize = true,
                        start_insert = false,
                        focus = false,
                        do_not_add_newline = false,
                    },
                },
            },

            -- CMake Notifications and Virtual Text Support
            cmake_notifications = {
                runner = { enabled = true },
                executor = { enabled = true },
                spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                refresh_rate_ms = 100,   -- Spinner update rate
            },
            cmake_virtual_text_support = true, -- Enable virtual text display for targets
        }
    end,
}

