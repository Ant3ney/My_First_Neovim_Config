-- Only required if packer is set as opt
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Let packer manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Tokyonight colorscheme
  use {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  }

  -- LSP Support via mason + lspconfig
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lspconfig = require("lspconfig")
      local servers = { "clangd", "lua_ls", "tsserver" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end
  }

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "lua", "javascript", "typescript", "c", "cpp",
          "vim", "vimdoc", "query", "markdown", "markdown_inline"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }

  use { 'theprimeagen/harpoon'}


end)

