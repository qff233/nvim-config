return {
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",

    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return require("plugins.configs.ui").lualine
        end,
    },

    {
        "akinsho/bufferline.nvim",
        opts = function()
            return require("plugins.configs.ui").bufferline
        end,
    },

    {
        "xiyaowong/transparent.nvim",
        opts = function ()
            return require("plugins.configs.ui").transparent
        end
    }
}
