require "plugins.packer"
require "plugins.nvim-tree"
require "plugins.vim-go"
require "plugins.telescope"
require "user.options"
require "plugins.key-mappings"

vim.cmd.colorscheme "dracula"
vim.opt.termguicolors = false

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup.lua source <afile> | PackerCompile
  augroup end
]])
