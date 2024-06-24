return {
    -- {
    --     "craftzdog/solarized-osaka.nvim",
    --     lazy = true,
    --     priority = 1000,
    --     opts = function()
    --         return {
    --             transparent = true,
    --         }
    --     end,
    -- },
    {
        "neanias/everforest-nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("everforest").setup({
                transparent_background_level = 1,
            })
        end,
    },
}
