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

    use("mfussenegger/nvim-dap")
    use("leoluz/nvim-dap-go")
    use("rcarriga/nvim-dap-ui")
    use("nvim-neotest/neotest")
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
    -- use("Mofiqul/vscode.nvim")
    use("gbprod/nord.nvim")
    use("navarasu/onedark.nvim")
    -- use("fcancelinha/northern.nvim")
    -- use("AlexvZyl/nordic.nvim")
    -- use("CodeGradox/onehalf-lush")
    -- use("olivercederborg/poimandres.nvim")
    -- use("lewpoly/sherbet.nvim")
    -- use("rmehri01/onenord.nvim")
    -- use("kvrohit/rasmus.nvim")
    -- use("HoNamDuong/hybrid.nvim")
    use("xiantang/darcula-dark.nvim")
	use({ "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" })
	use("lourenci/github-colors")
	use("sainnhe/sonokai")
	use("sainnhe/edge")
	use("marko-cerovac/material.nvim")
	use({"catppuccin/nvim", as = "catppuccin"})
	use("ribru17/bamboo.nvim")
	use("romgrk/kyntell.vim")
	use("calind/selenized.nvim")
	use("p00f/alabaster.nvim")
	use("tiagovla/tokyodark.nvim")
	use("RRethy/base16-nvim")
	use({ "loganswartz/sunburn.nvim", requires = "loganswartz/polychrome.nvim" })
	use("jaywilliams/vim-vwilight")
	use("ramojus/mellifluous.nvim")
	use("comfysage/evergarden")
	use("ellisonleao/gruvbox.nvim")
	use("luisiacc/gruvbox-baby")
	-- use({
	-- 	"NTBBloodbath/doom-one.nvim",
		-- setup = function()
		-- 	vim.g.doom_one_enable_treesitter = true
		-- end,
		-- config = function()
		-- 	vim.cmd('colorscheme doom-one')
		-- end
	-- })

    -- Navigation
    -- use("kyazdani42/nvim-tree.lua")
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

	-- Neorg
	use ({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	})
end)
