return {
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = function()
            local tools = {
                "black"
            }
            require("mason-null-ls").setup {
                ensure_installed = tools,
                handlers = {}
            }

            local nls = require("null-ls")
            nls.setup {
                -- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {},
            }
        end,
    },
}
