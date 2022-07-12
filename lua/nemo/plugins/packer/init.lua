local function startup(use)
  use "wbthomason/packer.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    config = function ()
      require "nemo.plugins.treesitter"
    end
  }
--
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    after = {
      "telescope-fzf-native.nvim",
      "telescope-ui-select.nvim",
    },
    config = function()
      require "nemo.plugins.telescope"
    end,
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-ui-select.nvim"

  -- LSP
  use "kyazdani42/nvim-web-devicons"
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "nemo.plugins.lspconfig"
    end,
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "nemo.plugins.null-ls"
    end,
  }
  use { "glepnir/lspsaga.nvim", branch = "main" }

  -- Complitions
  use {
    "hrsh7th/nvim-cmp",
    after = {
      "cmp-buffer",
      "cmp-path",
      "cmp-nvim-lsp",
      "LuaSnip",
      "cmp_luasnip",
    },
    config = function()
      require "nemo.plugins.cmp"
    end,
  }
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-nvim-lua"
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require "nemo.plugins.luasnip"
    end,
  }
  use "saadparwaiz1/cmp_luasnip"

  -- Tree
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "nemo.plugins.tree"
    end,
  }

  -- Java
  use "mfussenegger/nvim-jdtls"

  use "mfussenegger/nvim-dap"
  use "rafamadriz/friendly-snippets"
  --  use "rcarriga/nvim-dap-ui"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "RRethy/vim-illuminate"
  -- use "jbyuki/one-small-step-for-vimkind"
  -- use "tpope/vim-unimpaired"

  -- Miscellaneous
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require "nemo.plugins.autopairs"
    end,
    after = "nvim-cmp"
  }

  -- Visual
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require "nemo.colorschemes.nightfox"
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "nemo.plugins.indent-blankline"
    end,
    after = "nightfox.nvim",
  }
end

local loadPath = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(loadPath)) > 0 then
  vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    loadPath,
  }
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = { "*" },
    callback = function()
      require("packer").startup(startup)
      require("packer").sync()
    end,
  })
else
  return require("packer").startup(startup)
end

-- --
-- ---- To install later
-- ---- use "folke/which-key.nvim"
-- ---- use "goolord/alpha-nvim"
-- ---- My Pugins
-- ---- use "/home/nemo/Plugins/nemoutils"
-- ---- use "/home/nemo/Plugins/stackmap"
