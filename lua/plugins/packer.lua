-- Automatically installs Packer a Neovim Plugin Manager
-- https://github.com/wbthomason/packer.nvim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Styling
    use { 'dracula/vim', as = 'dracula' }

    -- File Explorer
    use {
        "nvim-tree/nvim-tree.lua",         -- https://github.com/nvim-tree/nvim-tree.lua
        requires = {
            "nvim-tree/nvim-web-devicons", -- https://github.com/nvim-tree/nvim-web-devicons
        },
    }

    -- Finding things
    use {
        "nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        run = "make",
    }
    use {
        "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
        requires = {
            "nvim-lua/plenary.nvim",
        },
        branch = "0.1.x",
    }

    -- Syntax Tree Parsing for Highlighting code
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Autocompletion for Prograimming
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    -- Golang
    use "fatih/vim-go" -- https://github.com/fatih/vim-go

    -- Git Plugin for nvim
    use("tpope/vim-fugitive")


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
