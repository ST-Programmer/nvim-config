vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- Keybindings for CMakeTools
vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ct', ':CMakeTest<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ck', ':CMakeSelectKit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cv', ':CMakeSelectVariant<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '\\', ':!cmake -S . -B build/ && cmake --build build/ && ./build/main <CR>',
    { noremap = true, silent = true })
