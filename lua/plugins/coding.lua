return {
    "SmiteshP/nvim-navic",

    {
        "williamboman/mason.nvim",
        opts = function()
            return require("configs.mason")
        end,
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = true,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    {
        "nvimdev/guard.nvim",
        config = function()
            require("configs.guard")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("configs.others").luasnip(opts)
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "onsails/lspkind.nvim",
            },
        },
        opts = function()
            ---@diagnostic disable-next-line: different-requires
            return require("configs.cmp")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { icons = false },
    },

    {
        "j-hui/fidget.nvim",
        requires = { "neovim/nvim-lspconfig" },
        tag = "legacy",
        config = true,
    },
}
