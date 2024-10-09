local keymaps = require("keymaps")

return {
    {
        "tversteeg/registers.nvim",
        opts = {},
        keys = {
            { '"',     mode = { "n", "v" } },
            { "<C-R>", mode = "i" },
        },
        cmd = "Registers",
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return {
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "󰍵" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "│" },
                },
            }
        end,
    },

}
