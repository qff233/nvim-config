return {
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = function()
            return require("configs.others").indent_blankline
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require("configs.treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("configs.others").gitsigns
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = function()
            return require("configs.nvimtree")
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
            vim.g.nvimtree_side = opts.view.side
        end,
    },

    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
            },
        },
    },
}
