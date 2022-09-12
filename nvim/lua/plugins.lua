vim.cmd([[packadd packer.nvim]])

return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use('folke/tokyonight.nvim')

        -- use({
        --     'NTBBloodbath/doom-one.nvim',
        --     setup = function()
        --         -- Add color to cursor
        --         vim.g.doom_one_cursor_coloring = true
        --         -- Set :terminal colors
        --         vim.g.doom_one_terminal_colors = false
        --         -- Enable italic comments
        --         vim.g.doom_one_italic_comments = true
        --         -- Enable TS support
        --         vim.g.doom_one_enable_treesitter = true
        --         -- Color whole diagnostic text or only underline
        --         vim.g.doom_one_diagnostics_text_color = false
        --         -- Enable transparent background
        --         vim.g.doom_one_transparent_background = false

        --         -- Pumblend transparency
        --         vim.g.doom_one_pumblend_enable = false
        --         vim.g.doom_one_pumblend_transparency = 20

        --         -- Plugins integration
        --         vim.g.doom_one_plugin_neorg = false
        --         vim.g.doom_one_plugin_barbar = false
        --         vim.g.doom_one_plugin_telescope = true
        --         vim.g.doom_one_plugin_neogit = true
        --         vim.g.doom_one_plugin_nvim_tree = true
        --         vim.g.doom_one_plugin_dashboard = false
        --         vim.g.doom_one_plugin_startify = false
        --         vim.g.doom_one_plugin_whichkey = false
        --         vim.g.doom_one_plugin_indent_blankline = true
        --         vim.g.doom_one_plugin_vim_illuminate = false
        --         vim.g.doom_one_plugin_lspsaga = false
        --     end,
        --     config = function()
        --         vim.cmd("colorscheme doom-one")
        --     end,
        -- })

        use('shaunsingh/nord.nvim')

        use({
            {
                'nvim-lualine/lualine.nvim',
                event = 'BufEnter',
                config = function()
                    require('plugins.lualine')
                end,
            },
            {
                'j-hui/fidget.nvim',
                after = 'lualine.nvim',
                config = function()
                    require('fidget').setup()
                end,
            },
        })

        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            'nvim-treesitter/nvim-treesitter',
            event = 'BufRead',
            run = ':TSUpdate',
            config = function()
                require('plugins.treesitter')
            end,
        })

        --------------------------
        -- Editor UI Niceties --
        --------------------------

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.indentline')
            end,
        })

        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.gitsigns')
            end,
        })

        use({
            'TimUntersberger/neogit',
            config = function()
                require('plugins.neogit')
            end,
        })

        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('plugins.nvim-tree')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })

        use({
            'akinsho/bufferline.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.bufline')
            end
        })

--        use('preservim/tagbar')

--        use({
--            'karb94/neoscroll.nvim',
--            event = 'WinScrolled',
--            config = function()
--                require('neoscroll').setup({ hide_cursor = false })
--            end,
--        })

        -------------------------
        -- Editing to the MOON --
        -------------------------

        use({
            'tpope/vim-commentary',
            event = 'BufRead',
        })

        use({
            'machakann/vim-sandwich',
            event = 'BufRead',
        })

--        use({
--            'wellle/targets.vim',
--            event = 'BufRead',
--        })

        --------------
        -- Terminal --
        --------------

        use({
            'numToStr/FTerm.nvim',
            event = 'CursorHold',
            config = function()
                require('plugins.fterm')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------

        use({
            'neovim/nvim-lspconfig',
            after = 'nvim-treesitter',
            config = function()
                require('plugins.lsp.servers')
            end,
            requires = {
                {
                    -- WARN: Unfortunately we won't be able to lazy load this
                    'hrsh7th/cmp-nvim-lsp',
                },
            },
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            after = 'nvim-treesitter',
            config = function()
                require('plugins.lsp.null-ls')
            end,
        })

        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('plugins.lsp.nvim-cmp')
                end,
                requires = {
                    'L3MON4D3/LuaSnip',
                    event = 'InsertEnter',
                },
            },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })

        use({
            'williamboman/mason.nvim',
            config = function()
                require('plugins.lsp.mason')
            end,
        })

        -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
        use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            after = 'nvim-cmp',
            config = function()
                require('plugins.pairs')
            end,
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
