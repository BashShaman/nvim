return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "ellisonleao/gruvbox.nvim"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    -- tag = "nvim-0.6",
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "kyazdani42/nvim-web-devicons"
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim" --> to learn more
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  -- use "hrsh7th/cmp-nvim-lua"
  -- use "onsails/lspkind.nvim"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip" --> to learn more
  use "kyazdani42/nvim-tree.lua"
  use "mfussenegger/nvim-jdtls"
  use "mfussenegger/nvim-dap"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "rafamadriz/friendly-snippets"
  --  use "rcarriga/nvim-dap-ui"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "RRethy/vim-illuminate"
  -- use "navarasu/onedark.nvim"
  -- use "rhysd/vim-grammarous"
  -- use "jbyuki/one-small-step-for-vimkind"
  -- use "tpope/vim-unimpaired"
  use "numToStr/Comment.nvim" --> to learn more
  use "windwp/nvim-autopairs" --> to learn more
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use "lukas-reineke/indent-blankline.nvim"
  use "folke/tokyonight.nvim"
  use "bluz71/vim-nightfly-guicolors"
  use "EdenEast/nightfox.nvim"
end)

-- To install later
-- use "folke/which-key.nvim"
-- use "goolord/alpha-nvim"
-- My Pugins
-- use "/home/nemo/Plugins/nemoutils"
-- use "/home/nemo/Plugins/stackmap"
