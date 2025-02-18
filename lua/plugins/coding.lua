return {
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },

    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        --         opts = {
        --             hooks = {
        --                 pre = function()
        --                     require("ts_context_commentstring.internal").update_commentstring({})
        --                 end,
        --             },
        --         },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end,
    },

    {
        "echasnovski/mini.ai",
        keys = {
            { "a", mode = { "x", "o" } },
            { "i", mode = { "x", "o" } },
        },
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@uv.outer" },
                        i = { "@block.inner", "@conditional.inner", "@uv.inner" },
                    }, {}),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
                },
            }
        end,
    },
}
