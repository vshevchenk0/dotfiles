vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("williamboman/mason.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use({
        "j-hui/fidget.nvim",
        tag = "legacy",
    })
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("ray-x/lsp_signature.nvim")
    -- use("chr4/nginx.vim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("folke/neodev.nvim")
    use("smjonas/inc-rename.nvim")
    use("Wansmer/symbol-usage.nvim")
    use("aznhe21/actions-preview.nvim")

    use({
      "mfussenegger/nvim-dap",
      requires = { "nvim-neotest/nvim-nio" },
    })
    use("leoluz/nvim-dap-go")
    use("rcarriga/nvim-dap-ui")
    use({
      "nvim-neotest/neotest",
      requires = { "nvim-neotest/nvim-nio" },
    })
    use("nvim-neotest/neotest-go")

    -- Base
    use("folke/todo-comments.nvim")
    use("akinsho/toggleterm.nvim")
    use("antoinemadec/FixCursorHold.nvim")
    use("folke/which-key.nvim")

    -- View
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
			"nvim-tree/nvim-web-devicons",
			"meuter/lualine-so-fancy.nvim"
		},
    })
    use("kyazdani42/nvim-web-devicons")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("lukas-reineke/indent-blankline.nvim")
    use({
      "folke/noice.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    })
    use({
      "OXY2DEV/markview.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
    })
    use("navarasu/onedark.nvim")
    use("xiantang/darcula-dark.nvim")
    use("sainnhe/sonokai")
    use("sainnhe/edge")
    use("marko-cerovac/material.nvim")
    use({"catppuccin/nvim", as = "catppuccin"})
    use("ribru17/bamboo.nvim")
    use("ellisonleao/gruvbox.nvim")
    use("luisiacc/gruvbox-baby")
    use("sainnhe/gruvbox-material")

    -- Navigation
    -- use("kyazdani42/nvim-tree.lua")
    use("stevearc/oil.nvim")
    use("refractalize/oil-git-status.nvim")
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    })
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    use("karb94/neoscroll.nvim")
    use("preservim/tagbar")
    use({
      "utilyre/barbecue.nvim",
      requires = {
        "SmiteshP/nvim-navic"
      }
    })

    -- Git
    use("lewis6991/gitsigns.nvim")
    use({
      "NeogitOrg/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      }
    })

    -- Edit
    use("tpope/vim-surround")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
end)
