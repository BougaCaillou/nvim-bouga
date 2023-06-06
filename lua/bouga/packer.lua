-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

	-- Dir telescope (telescope for search in dir)
  use {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  }

  -- Sonokai colorscheme
  use { 'sainnhe/sonokai', as = 'sonokai' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }

  -- NvimTree
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-tree/nvim-web-devicons' }

  -- Undo tree
  use { 'mbbill/undotree' }

  -- Fugitive
  use { 'tpope/vim-fugitive' }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function() pcall(vim.cmd, 'MasonUpdate') end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Autoclose backets and stuff...
  use { 'm4xshen/autoclose.nvim' }

  -- Code action menu (better than lsp's one)
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  -- Copilot the bro
  use { 'github/copilot.vim' }

  -- Which key
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require('which-key').setup {}
    end
  }

	-- Feline
	use { 'freddiehaddad/feline.nvim' }

	-- Git signs
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	-- Comment
	use { 'tpope/vim-commentary' }

	-- Indent lines
	use { 'lukas-reineke/indent-blankline.nvim' }

	-- Colorizer
	use { 'norcalli/nvim-colorizer.lua' }
end)
