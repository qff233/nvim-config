return {
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",

    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return require("configs.ui").lualine
        end,
    },

    {
        "akinsho/bufferline.nvim",
        opts = function()
            return require("configs.ui").bufferline
        end,
    },

    {
        "xiyaowong/transparent.nvim",
        opts = function ()
            return require("configs.ui").transparent
        end
    }
}
