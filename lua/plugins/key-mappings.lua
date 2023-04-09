vim.g.mapleader = ","

vim.keymap.set("", "<leader>q", ":q<CR>")      -- Quit current tab
vim.keymap.set("", "<leader>n", ":tabnew<CR>") -- Open new tab
vim.keymap.set("", "<leader>v", ":vsplit<CR>") -- Split view
vim.keymap.set("", "<leader>s", ":w<CR>")      -- Save

vim.keymap.set("", "<leader>m", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Useful to move things around in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
