return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return {
                ensure_installed = {
                    "bash",
                    "rust",
                    "cpp",
                    "c",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "typescript",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                }
            }
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
