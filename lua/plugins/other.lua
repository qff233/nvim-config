return {
    "nvim-lua/plenary.nvim",
    "sainnhe/everforest",
    "christoomey/vim-tmux-navigator",

    {
        "ggandor/leap.nvim",
        lazy = true,
        keys = { "s", "S" },
        config = function()
            require("leap").add_default_mappings()
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require("plugins.configs.telescope")
        end,
        config = function(_, opts)
            ---@diagnostic disable-next-line: different-requires
            local telescope = require("telescope")
            telescope.setup(opts)

            -- load extensions
            -- for _, ext in ipairs(opts.extensions_list) do
            --     telescope.load_extension(ext)
            -- end
        end,
    },
}
