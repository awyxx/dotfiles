vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- package manager

    use 'neovim/nvim-lspconfig' -- collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer' -- install LSP servers
    use 'hrsh7th/nvim-cmp' -- autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- for LSP

    use 'itchyny/lightline.vim' -- line
    use 'spywhere/lightline-lsp' -- errors / warnings on lightline

    use 'derekwyatt/vim-fswitch' -- switching source <-> header file

    use 'hrsh7th/cmp-vsnip' -- snippets
    use 'hrsh7th/vim-vsnip' -- snippets

    use 'tpope/vim-commentary' -- comment stuff

    use 'romgrk/barbar.nvim' -- tabs
    use 'preservim/nerdtree' -- files
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'ellisonleao/gruvbox.nvim' -- color scheme
    use 'folke/tokyonight.nvim' -- color scheme
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- TODO: debug for c/cpp
end)
